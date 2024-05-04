import 'package:flutter/material.dart';
import 'package:news/config/resource/gap.dart';
import 'package:news/config/resource/my_colors.dart';
import 'package:news/config/resource/my_spaces.dart';
import 'package:news/config/resource/my_text_styles.dart';
import 'package:news/core/utlis/pars_date.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:intl/intl.dart';

class DetailNewsWidget extends StatelessWidget {
  final NewsModel item;

  const DetailNewsWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySpaces.s16.height,
        Text(
          item.title.toString(),
          style: TitleStyle.t5,
        ),
        MySpaces.s12.height,
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.author ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Text500Style.normal,
                  ),
                  Text(
                    ParsDate.calculateRemandingDate(item.publishedAt!),
                    style: Text500Style.xs,
                  ),
                ],
              ),
            ),
            Text(
              item.publishedAt != null
                  ? DateFormat.yMMMMEEEEd().format(item.publishedAt!)
                  : "",
              style: Text500Style.sm.copyWith(color: MyColors.danger),
            ),
          ],
        ),
        const Divider(),
        Text(
          item.content ?? "",
          textAlign: TextAlign.justify,
          style: Text500Style.normal,
        ),
      ],
    );
  }

}
