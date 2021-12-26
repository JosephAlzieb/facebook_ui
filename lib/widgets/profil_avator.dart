import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class ProfilAvator extends StatelessWidget {
  final String imageUrl;
  final bool isActiv;
  final bool hasBorder;


  const ProfilAvator({
    @required this.imageUrl,
    this.isActiv = false,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Palette.facebookBlue,
      child: CircleAvatar(
        radius: hasBorder ? 32.0: 35.0,
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
    );
  }
}
