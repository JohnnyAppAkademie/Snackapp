import 'package:flutter/material.dart';
import 'package:jp_app/src/core/data/catagory_filter.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/repository/snack_repository.dart';
import 'package:jp_app/src/core/style/text_style.dart';
import 'package:jp_app/src/view/main_screen/widgets/category_checkbox.dart';
import 'package:jp_app/src/view/main_screen/widgets/recommend_display.dart';
import 'package:jp_app/src/view/main_screen/widgets/snack_display.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /*  Filter */
  late List<CategoryFilter> filters;

  final horizontalPadding = const EdgeInsets.symmetric(horizontal: 10);

  @override
  void initState() {
    super.initState();
    filters = [
      CategoryFilter(name: 'All Categories', isMainCategory: true),
      CategoryFilter(name: 'Favourites'),
      CategoryFilter(name: 'Sweet'),
      CategoryFilter(name: 'Vegan'),
      CategoryFilter(name: 'Cold'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/bg_mainscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Header */
            SizedBox(height: (context.screenHeight * 0.08)),

            _buildHeader(context),

            SizedBox(height: (context.screenHeight * 0.02)),

            /*  Checkboxen  */
            CategoryCheckbox(filters: filters),

            SizedBox(height: context.screenHeight * 0.05),

            /* Item Lookout */
            SizedBox(height: 225, child: SnackDisplay(snack: snackList.first)),

            SizedBox(height: context.screenHeight * 0.04),

            /* Recomended Items */
            _buildRecommendations(),
          ],
        ),
      ),
    );
  }

  Column _buildRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: horizontalPadding,
          child: Text(
            "We Recommend",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.01),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: snackList.length - 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: horizontalPadding,
                child: RecommendDisplay(snack: snackList[index + 1]),
              );
            },
          ),
        ),
      ],
    );
  }

  SizedBox _buildHeader(BuildContext context) {
    return SizedBox(
      height: 60,
      width: context.screenWidth * 0.45,
      child: Text("Choose your Favourite Snack", maxLines: 2, style: header),
    );
  }
}
