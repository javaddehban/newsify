import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/config/resource/assets.dart';
import 'package:news/config/resource/gap.dart';
import 'package:news/config/resource/my_colors.dart';
import 'package:news/config/resource/my_spaces.dart';
import 'package:news/config/resource/my_text_styles.dart';
import 'package:news/config/router/routes.dart';
import 'package:news/core/utlis/pars_date.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:shimmer/shimmer.dart';

class ItemNewsWidget extends StatelessWidget {
  final NewsModel item;

  const ItemNewsWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var params = item.toJson();
        context.pushNamed(Routes.detail, extra: params);
      },
      child: Container(
        margin: const EdgeInsets.only(
            left: MySpaces.s8, right: MySpaces.s16, top: MySpaces.s0, bottom: MySpaces.s8),
        height: 144,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _imageNews(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: MySpaces.s8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(item.title ?? "",
                            maxLines: 3, overflow: TextOverflow.ellipsis, style: Text700Style.lg),
                        MySpaces.s4.height,
                        Text(
                          item.description ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Text500Style.normal,
                        ),
                        MySpaces.s4.height,
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              ParsDate.calculateRemandingDate(item.publishedAt!),
                              style: Text700Style.sm.copyWith(color: MyColors.danger),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageNews() {
    return CachedNetworkImage(
      imageUrl: item.urlToImage ?? '',
      height: 144,
      width: 144,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(MySpaces.s8),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        width: 144,
        height: 144,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MySpaces.s8),
            child: Container(
              color: Colors.grey.shade100,
              width: 144,
              height: 144,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => ClipRRect(
        borderRadius: BorderRadius.circular(MySpaces.s8),
        child: Container(
          width: 144,
          height: 144,
          color: Colors.grey.shade300,
          child: Image.asset(
            Assets.logo,
          ),
        ),
      ),
    );
  }
}
