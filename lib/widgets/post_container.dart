import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/post_model.dart';
import 'package:facebook_ui/widgets/profil_avator.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 10.0),
                Text(
                  post.caption,
                  style: const TextStyle(fontSize: 20),
                ),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 10.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl))
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _PostState(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfilAvator(imageUrl: post.user.imageUrl),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostState extends StatelessWidget {
  final Post post;

  _PostState({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
                child: Text(
              "${post.likes}",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            )),
            Text(
              "${post.comments} comments",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(width: 5.0),
            Text(
              "${post.shares} shares",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              ontap: () {},
              icon: MdiIcons.thumbUpOutline,
              lable: "Like",
            ),
            _PostButton(
              ontap: () {},
              icon: MdiIcons.commentOutline,
              lable: "Comment",
            ),
            _PostButton(
              ontap: () {},
              icon: MdiIcons.shareOutline,
              lable: "Share",
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final String lable;
  final Function ontap;
  final IconData icon;

  const _PostButton({
    @required this.lable,
    @required this.ontap,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: ()=>ontap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            height: 35.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30.0,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4.0),
                Text(lable, style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
