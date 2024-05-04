import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/config/resource/assets.dart';
import 'package:news/config/resource/my_spaces.dart';
import 'package:news/config/resource/my_text_styles.dart';
import 'package:intl/intl.dart';

class AppBarActionWidget extends StatelessWidget {
  const AppBarActionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MySpaces.s8),
          child: SvgPicture.asset(
            Assets.boxNews,
            width: 30,
            height: 30,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All News",
              style: TitleStyle.t6.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat.MMMEd().format(DateTime.now()),
              style: TitleStyle.t9,
            )
          ],
        ),
      ],
    );
  }
}
