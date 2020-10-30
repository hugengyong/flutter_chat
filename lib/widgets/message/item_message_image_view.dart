import 'dart:io';

import '../../commons/res/styles.dart';
import '../../commons/config.dart';

import '../../pages/photo_view.dart';

import '../../utils/jpush_util.dart';
import '../../utils/route_util.dart';
import '../../utils/utils.dart';

import 'package:flutter/material.dart';

class ImageMessageView extends StatelessWidget {
  final JMImageMessage message;
  final MessageSendType type;

  ImageMessageView({Key key, @required this.message, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            constraints: BoxConstraints(maxWidth: Utils.width / 2),
            child: ClipRRect(
                borderRadius: borderRadius(type),
                child: Hero(
                    tag: message?.id,
                    child: Image.file(File('${message?.thumbPath}'))))),
        onTap: () {
          pushNewPage(
              context,
              PhotoViewPage(
                  photos: [message?.thumbPath], heroTag: message?.id));
        });
  }
}
