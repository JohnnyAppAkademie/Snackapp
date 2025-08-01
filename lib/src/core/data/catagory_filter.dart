class CategoryFilter {
  //  Attribute //

  /* Name der Kategorie */
  final String name;

  /* All Category Flag  */
  final bool isMainCategory;

  /* Wird gerade danach gesucht */
  bool isSelected;

  /// __CategoryFilter - Konstruktor__
  /// <br> Erstellt einen Filter. <br>
  /// <br> __Required__:
  /// * __[String: name]__ - Der Name der Kategorie
  ///
  /// <br> __Not Required__:
  /// * __[bool: isMainCategory]__ - Handelt es sich um die Main Catagory ("All Categories")
  /// * __[bool : isSelected]__ - Ist das Feld selektiert worden vom User
  CategoryFilter({
    required this.name,
    this.isMainCategory = false,
    this.isSelected = false,
  });
}
