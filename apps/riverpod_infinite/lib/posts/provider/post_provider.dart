import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite/posts/posts.dart';
import 'package:http/http.dart' as http;

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository(httpClient: http.Client());
});

final postsNotifierProvider =
    StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier(ref.watch(postRepositoryProvider));
});

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier(this._postRepository) : super(PostState()) {
    _initPosts();
  }

  final PostRepository _postRepository;

  _initPosts() async {
    await fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final posts = await _postRepository.fetchPosts(state.posts.length);
      state = posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: new List.from(state.posts)..addAll(posts),
              hasReachedMax: false,
            );
    } catch (_) {
      state = state.copyWith(status: PostStatus.failure);
    }
  }
}
