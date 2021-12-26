import 'package:facebook_ui/models/user_model.dart';
import 'package:facebook_ui/widgets/profil_avator.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer(@required this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
              ProfilAvator(
                imageUrl: currentUser.imageUrl,
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?",
                      hintStyle: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                    size: 35,
                  ),
                  label: const Text("Live"),
                ),
                const VerticalDivider(width: 8.0),
                FlatButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                    size: 35,
                  ),
                  label: const Text("Photo"),
                ),
                const VerticalDivider(width: 8.0),
                FlatButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                    size: 35,
                  ),
                  label: const Text("Room"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
