import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/resources/app_assets.dart';
import 'package:news_app/core/resources/app_strings.dart';

class HomeDrawer extends StatelessWidget {
  void Function()  onPress;
  HomeDrawer(this.onPress);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Text(
              AppStrings.appTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                InkWell(onTap: (){
                  onPress();
                },
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.home, height: 24.h, width: 24.w),
                      SizedBox(width: 8.w),
                      Text(
                        AppStrings.goToHome,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Divider(height: 48.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.theme,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      AppStrings.theme,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  initialValue: "light",
                  dropdownColor: Theme.of(context).colorScheme.primary,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: "light",
                      child: Text(
                        "Light",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    DropdownMenuItem(
                      value: "dark",
                      child: Text(
                        "Dark",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
