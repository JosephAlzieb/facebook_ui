import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/user_model.dart';
import 'package:facebook_ui/widgets/profil_avator.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUser;

  const Rooms(@required this.onlineUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: onlineUser.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: _CreateRoomButton(),
              );
            } else {
              final User user = onlineUser[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    ProfilAvator(
                      imageUrl: user.imageUrl,
                      isActiv: true,
                    ),
                    Positioned(
                      bottom: 2.0,
                      right: 2.0,
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.online,
                            border:
                                Border.all(width: 2.0, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      borderSide: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
      textColor: Palette.facebookBlue,
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          const Text(
            "Create\nRoom",
          )
        ],
      ),
    );
  }
}
