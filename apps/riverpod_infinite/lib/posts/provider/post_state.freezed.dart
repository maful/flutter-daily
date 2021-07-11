// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostStateTearOff {
  const _$PostStateTearOff();

  _PostState call(
      {List<Post> posts = const <Post>[],
      PostStatus status = PostStatus.initial,
      bool hasReachedMax = false}) {
    return _PostState(
      posts: posts,
      status: status,
      hasReachedMax: hasReachedMax,
    );
  }
}

/// @nodoc
const $PostState = _$PostStateTearOff();

/// @nodoc
mixin _$PostState {
  List<Post> get posts => throw _privateConstructorUsedError;
  PostStatus get status => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
  $Res call({List<Post> posts, PostStatus status, bool hasReachedMax});
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? status = freezed,
    Object? hasReachedMax = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostStatus,
      hasReachedMax: hasReachedMax == freezed
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(
          _PostState value, $Res Function(_PostState) then) =
      __$PostStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> posts, PostStatus status, bool hasReachedMax});
}

/// @nodoc
class __$PostStateCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(_PostState _value, $Res Function(_PostState) _then)
      : super(_value, (v) => _then(v as _PostState));

  @override
  _PostState get _value => super._value as _PostState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? status = freezed,
    Object? hasReachedMax = freezed,
  }) {
    return _then(_PostState(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostStatus,
      hasReachedMax: hasReachedMax == freezed
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostState extends _PostState with DiagnosticableTreeMixin {
  const _$_PostState(
      {this.posts = const <Post>[],
      this.status = PostStatus.initial,
      this.hasReachedMax = false})
      : super._();

  @JsonKey(defaultValue: const <Post>[])
  @override
  final List<Post> posts;
  @JsonKey(defaultValue: PostStatus.initial)
  @override
  final PostStatus status;
  @JsonKey(defaultValue: false)
  @override
  final bool hasReachedMax;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostState(posts: $posts, status: $status, hasReachedMax: $hasReachedMax)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostState'))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('hasReachedMax', hasReachedMax));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostState &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                const DeepCollectionEquality()
                    .equals(other.hasReachedMax, hasReachedMax)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(hasReachedMax);

  @JsonKey(ignore: true)
  @override
  _$PostStateCopyWith<_PostState> get copyWith =>
      __$PostStateCopyWithImpl<_PostState>(this, _$identity);
}

abstract class _PostState extends PostState {
  const factory _PostState(
      {List<Post> posts, PostStatus status, bool hasReachedMax}) = _$_PostState;
  const _PostState._() : super._();

  @override
  List<Post> get posts => throw _privateConstructorUsedError;
  @override
  PostStatus get status => throw _privateConstructorUsedError;
  @override
  bool get hasReachedMax => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostStateCopyWith<_PostState> get copyWith =>
      throw _privateConstructorUsedError;
}
