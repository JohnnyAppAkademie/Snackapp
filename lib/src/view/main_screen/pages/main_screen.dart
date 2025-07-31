import 'package:flutter/material.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/repository/snack_repository.dart';
import 'package:jp_app/src/view/main_screen/widgets/category_checkbox.dart';
import 'package:jp_app/src/view/main_screen/widgets/recommend_display.dart';
import 'package:jp_app/src/view/main_screen/widgets/snack_display.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> categories = [
    'All Categories',
    'Favourites',
    'Sweet',
    'Vegan',
    'Cold',
  ];

  late List<bool> checkedStates;

  @override
  void initState() {
    super.initState();
    checkedStates = List<bool>.filled(categories.length, false);
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
            /*  Checkboxen  */
            CategoryCheckbox(
              categories: categories,
              checkedStates: checkedStates,
            ),
            SizedBox(height: context.screenHeight * 0.05),
            /* Item Lookout */
            SizedBox(height: 225, child: SnackDisplay(snack: snackList[0])),
            SizedBox(height: context.screenHeight * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    itemCount: snackList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RecommendDisplay(snack: snackList[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
