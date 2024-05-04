import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:news/config/resource/assets.dart';
import 'package:news/config/resource/my_colors.dart';
import 'package:news/config/resource/my_spaces.dart';
import 'package:news/config/resource/my_text_styles.dart';
import 'package:news/features/detail_news/presentation/widget/detail_news_widget.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:shimmer/shimmer.dart';

class DetailNewsPage extends StatelessWidget {
  final NewsModel item;

  const DetailNewsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: true,
                floating: true,
                stretch: true,
                expandedHeight: 40.h,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: _imageNews(),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share_outlined)),
                ],
              ),
            ),
          ];
        },
        body: Builder(builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: MySpaces.s8, horizontal: MySpaces.s16),
                  child: DetailNewsWidget(item: item),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _imageNews() {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: item.urlToImage ?? '',
          imageBuilder: (context, imageProvider) => ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
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
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  width: 144,
                  height: 144,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade300,
            width: 100.w,
            child: Image.asset(
              Assets.logo,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: MySpaces.s8, horizontal: MySpaces.s16),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(MySpaces.s24)),
                        color: MyColors.danger.shade800),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: MySpaces.s4, horizontal: MySpaces.s8),
                      child: Text(
                        item.source != null ? item.source!.name ?? "" : "",
                        style: Text500Style.normal.copyWith(color: MyColors.white),
                      ),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
