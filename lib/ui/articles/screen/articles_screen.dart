import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/remote/api/api_manager.dart';
import 'package:news_app/core/resources/app_colors.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/sources_response/Source.dart';
import 'package:news_app/ui/articles/widgets/articles_list.dart';

class ArticlesScreen extends StatefulWidget {
  CategoryModel category;

  ArticlesScreen(this.category);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text("Try Again")),
            ],
          );
        }
        var response = snapshot.data;
        List<Source> sources = response?.sources ?? [];

        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lightPrimaryColor,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lightPrimaryColor,
                ),
                dividerHeight: 0,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: sources
                    .map((source) => Tab(text: source.name))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: sources
                      .map((source) => ArticlesList(source.id??""))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
