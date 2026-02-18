import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/remote/api/api_manager.dart';
import 'package:news_app/core/resources/app_routes.dart';
import 'package:news_app/core/resources/app_theme.dart';
import 'package:news_app/ui/categories/screen/categories_screen.dart';
import 'package:news_app/ui/home/screen/home_screen.dart';

void main() {
  ApiManager.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'News App',
          routes: {
            AppRoutes.home: (_) => HomeScreen(),
            // AppRoutes.categories: (_) => CategoriesScreen(),
          },
          initialRoute: AppRoutes.home,
          theme: AppTheme.light_theme,

        );
      },
    );
  }
}
