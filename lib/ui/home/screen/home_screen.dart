import 'package:flutter/material.dart';
import 'package:news_app/core/resources/app_strings.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/articles/screen/articles_screen.dart';
import 'package:news_app/ui/categories/screen/categories_screen.dart';
import 'package:news_app/ui/home/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory != null ? selectedCategory!.title : AppStrings.home,
        ),
      ),
      drawer: HomeDrawer(goToHome),
      body: selectedCategory != null
          ? ArticlesScreen(selectedCategory!)
          : CategoriesScreen(onCategoryClick),
    );
  }

  onCategoryClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  goToHome() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
