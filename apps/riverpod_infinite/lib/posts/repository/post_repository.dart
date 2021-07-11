import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_infinite/posts/posts.dart';

class PostRequestFailure implements Exception {}

class PostRepository {
  PostRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const _limit = 20;

  Future<List<Post>> fetchPosts([int startIndex = 0]) async {
    final response = await _httpClient.get(
      Uri.https(
        _baseUrl,
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_limit'},
      ),
    );

    if (response.statusCode != 200) {
      throw PostRequestFailure();
    }

    final body = json.decode(response.body) as List;
    return body.map((dynamic json) {
      return Post(
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );
    }).toList();
  }
}
