import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/models/post_model.dart';
import 'package:facebook_ui/widgets/circle_button.dart';
import 'package:facebook_ui/widgets/create_post_container.dart';
import 'package:facebook_ui/widgets/post_container.dart';
import 'package:facebook_ui/widgets/rooms.dart';
import 'package:facebook_ui/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            floating: true,
            centerTitle: false,
            actions: [
              CircleButton(Icons.search, () {}),
              CircleButton(MdiIcons.facebookMessenger, () {}),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, index) {
              final Post post = posts[index];
              return PostContainer(
                post: post,
              );
            },
            childCount: posts.length,
          ))
        ],
      ),
    );
  }
}
