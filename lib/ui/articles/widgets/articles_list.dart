import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/remote/api/api_manager.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/ui/articles/widgets/article_item.dart';

class ArticlesList extends StatelessWidget {
  final String sourceId;

  ArticlesList(this.sourceId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        var response = snapshot.data;
        List<Article> articles = response?.articles ?? [];
        print("ARTICLES COUNT => ${articles.length}");

        return Padding(
          padding: REdgeInsets.all(16),
          child: ListView.separated(
            itemBuilder: (context, index) => ArticleItem(articles[index]),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
