import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/resources/app_assets.dart';
import 'package:news_app/core/resources/app_strings.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  void Function(CategoryModel) selectedCategory;

  CategoryItem({
    required this.categoryModel,
    required this.index,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedCategory(categoryModel);
      },
      child: Directionality(
        textDirection: index.isOdd ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          height: 198.h,
          padding: REdgeInsetsDirectional.only(end: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                categoryModel.imagePath,
                height: 198.h,
                fit: BoxFit.cover,
                width: 120.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    categoryModel.title,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium?.copyWith(fontSize: 32.sp),
                  ),
                  Container(
                    padding: REdgeInsetsDirectional.only(start: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withValues(alpha: .5),
                      borderRadius: BorderRadius.circular(84.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.viewAll,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10.w),
                        CircleAvatar(
                          radius: 24.r,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          child: SvgPicture.asset(
                            matchTextDirection: true,
                            AppAssets.arrow,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
