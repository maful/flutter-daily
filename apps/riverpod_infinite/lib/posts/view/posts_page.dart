import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite/posts/posts.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: PostsList(),
    );
  }
}

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ScopedReader watch, Widget? child) {
        final prov = watch(postsNotifierProvider);
        final posts = prov.posts;

        switch (prov.status) {
          case PostStatus.failure:
            return const Center(child: Text('Failed to fetch posts'));
          case PostStatus.success:
            if (posts.isEmpty) {
              return const Center(child: Text('no posts'));
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return index >= posts.length
                    ? BottomLoader()
                    : _PostListItem(post: posts[index]);
              },
              itemCount: prov.hasReachedMax ? posts.length : posts.length + 1,
              controller: _scrollController,
            );
          default:
            return const _PostLoading();
        }
      },
    );
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!context.read(postsNotifierProvider).hasReachedMax) {
        print("reach the bottom");
        context.read(postsNotifierProvider.notifier).fetchPosts();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _PostListItem extends StatelessWidget {
  const _PostListItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.id}', style: textTheme.caption),
        title: Text(post.title),
        subtitle: Text(post.body),
        isThreeLine: true,
        dense: true,
      ),
    );
  }
}

class _PostLoading extends StatelessWidget {
  const _PostLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
