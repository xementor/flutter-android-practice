import 'package:flutter/material.dart';
import 'package:practice/video/widget/text_c.dart';
import 'package:practice/video/widget/video.dart';

Widget card() {
  return Container(
    child: Column(
      children: [
        video(),
        textContainer("abc"),
      ],
    ),
  );
}
