import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_app/src/core/data/catagory_filter.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';

class CategoryCheckbox extends StatefulWidget {
  const CategoryCheckbox({super.key, required this.filters});

  final List<CategoryFilter> filters;

  @override
  State<CategoryCheckbox> createState() => _CategoryCheckboxState();
}

class _CategoryCheckboxState extends State<CategoryCheckbox> {
  bool isMainSelected = false;
  late final List<CategoryFilter> filters;

  @override
  void initState() {
    super.initState();
    filters = widget.filters;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: context.screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: filters[index].isMainCategory
                ? _MainCategoryButton(
                    title: filters[index].name,
                    isSelected: isMainSelected,
                    onTap: () {
                      setState(() {
                        isMainSelected = !isMainSelected;
                      });
                    },
                  )
                : _SubCategoryButton(
                    title: filters[index].name,
                    state: filters[index].isSelected,
                    onChanged: (value) {
                      setState(() {
                        filters[index].isSelected = value ?? false;
                      });
                    },
                  ),
          );
        },
      ),
    );
  }
}

class _MainCategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  /// __MainCategoryButton__ - Konstruktor
  /// <br> Erstellt einen Widget für die "All Categories" - Filter. <br>
  /// <br> __Required__:
  /// * __[String : title]__ - Der Text auf dem Widget
  /// * __[bool : isSelected]__ - Ist das Widget ausgewählt worden
  /// * __[VoidCallback : onTap]__ - Die Funktion, die bei der Auswahl aufgerufen wird
  const _MainCategoryButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withValues(alpha: 0.7)
                  : Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage("assets/icons/lunch.png"),
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  isSelected
                      ? Icons.arrow_downward_outlined
                      : Icons.arrow_upward_outlined,
                  color: isSelected ? Colors.black : Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubCategoryButton extends StatelessWidget {
  final String title;
  final bool state;
  final ValueChanged<bool?> onChanged;

  /// __SubCategoryButton__ - Konstruktor
  /// <br> Erstellt einen Widget für die Filter. <br>
  /// <br> __Required__:
  /// * __[String : title]__ - Der Text auf dem Widget
  /// * __[bool : state]__ - Der Zustand des Widgets ( gedrückt / nicht gedrückt )
  /// * __[ValueChanged<bool?> : onChanged]__ - Was beim wechseln des States passieren soll
  const _SubCategoryButton({
    required this.title,
    required this.state,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!state),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: state
                  ? Colors.white.withValues(alpha: 0.7)
                  : Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: state
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: state ? Colors.black : Colors.white,
                      fontWeight: state ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
