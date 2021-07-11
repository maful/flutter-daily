import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_infinite/posts/posts.dart';

part 'post_state.freezed.dart';

enum PostStatus { initial, success, failure }

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    @Default(const <Post>[]) List<Post> posts,
    @Default(PostStatus.initial) PostStatus status,
    @Default(false) bool hasReachedMax,
  }) = _PostState;

  const PostState._();
}
