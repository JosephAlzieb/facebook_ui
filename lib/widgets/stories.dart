import 'package:cached_network_image/cached_network_image.dart';

import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/story_model.dart';
import 'package:facebook_ui/models/user_model.dart';
import 'package:facebook_ui/widgets/profil_avator.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User? currentUser;
  final List<Story> stories;

  const Stories({
    required this.currentUser,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                currentUser: currentUser!,
                isAddStory: true, story: null,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              story: story, currentUser: currentUser!,
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User currentUser;
  final bool isAddStory;
  final Story? story;

  const _StoryCard({
    required this.currentUser,
    required this.story,
    this.isAddStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CachedNetworkImage(
            height: double.infinity,
            width: 160,
            fit: BoxFit.cover,
            imageUrl: isAddStory ? currentUser.imageUrl : story!.imageUrl,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 35.0,
                    color: Palette.facebookBlue,
                  ),
                )
              : Container(
                  child: ProfilAvator(
                    imageUrl: story!.user.imageUrl,
                    hasBorder: !story!.isViewed,
                  ),
                ),
        ),
        Positioned(
          bottom: 12.0,
          left: 12.0,
          right: 12.0,
          child: Text(
            isAddStory ? "Add to Story" : story!.user.name,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
