import 'package:flutter/material.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/utils/blurred_checkbox.dart';

class CategoryCheckbox extends StatefulWidget {
  const CategoryCheckbox({
    super.key,
    required this.categories,
    required this.checkedStates,
  });

  final List<String> categories;
  final List<bool> checkedStates;

  @override
  State<CategoryCheckbox> createState() => _CategoryCheckboxState();
}

class _CategoryCheckboxState extends State<CategoryCheckbox> {
  late List<String> categories;
  late List<bool> checkedStates;

  @override
  void initState() {
    super.initState();
    categories = widget.categories;
    checkedStates = widget.checkedStates;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: (context.screenHeight * 0.05)),
        Text("Choose your Favourite Snack", maxLines: 2),
        SizedBox(height: (context.screenHeight * 0.05)),
        /* Checkbox - Liste*/
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: BlurredCheckbox(
                  title: categories[index],
                  state: checkedStates[index],
                  onChanged: (value) {
                    setState(() {
                      checkedStates[index] = value ?? false;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
