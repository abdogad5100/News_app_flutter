import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/app_strings.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/categories/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  void Function(CategoryModel) selectedCategory;

  CategoriesScreen(this.selectedCategory);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            AppStrings.welcome,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CategoryItem(
                selectedCategory: selectedCategory,
                categoryModel: CategoryModel.categories[index],
                index: index,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
