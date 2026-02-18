import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/app_colors.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  final Article article;

  ArticleItem(this.article);

  @override
  Widget build(BuildContext context) {
    print("IMAGE URL => ${article.urlToImage}");
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.lightPrimaryColor),
      ),
      child: Column(
        spacing: 10.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              height: 220.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(

                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: 40.sp),
            ),
          ),

          Text(article.title ?? "", style: TextStyle(fontSize: 16.sp)),
          Row(
            children: [
              Expanded(
                child: Text(
                  "By: ${article.author}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),

              Text(
                timeago.format(DateTime.parse(article.publishedAt ?? "")),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
