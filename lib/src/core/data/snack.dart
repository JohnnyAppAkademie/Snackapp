class Snack {
  //  Variabeln //

  /*  Name  */
  String foodName;
  get getFoodName => foodName;
  set setFoodName(foodName) => this.foodName = foodName;

  /*  Kurzbeschreibung  */
  String foodShortDescription;
  String get getFoodShortDescription => foodShortDescription;
  set setFoodShortDescription(String foodShortDescription) =>
      this.foodShortDescription = foodShortDescription;

  /* Beschreibung */
  String foodDescription;
  String get getFoodDescription => foodDescription;
  set setFoodDescription(String foodDescription) =>
      this.foodDescription = foodDescription;

  /*  Preis */
  double foodPrice;
  double get getFoodPrice => foodPrice;
  set setFoodPrice(double foodPrice) => this.foodPrice = foodPrice;

  /*  Kategorie */
  List<String> category;

  List<String> get getCategory => category;
  set setCategory(List<String> category) => this.category = category;

  /*  Rating  */
  double foodRating;
  double get getFoodRating => foodRating;
  set setFoodRating(double foodRating) => this.foodRating = foodRating;

  /*  Likes */
  int foodLikes;

  get getFoodLikes => foodLikes;
  set setFoodLikes(foodLikes) => this.foodLikes = foodLikes;

  /* Imagepfad */
  String foodImage;

  get getFoodImage => foodImage;
  set setFoodImage(foodImage) => this.foodImage = foodImage;

  /*  Favourite */
  bool foodFavourit;

  get getFoodFavourit => foodFavourit;
  set setFoodFavourit(foodFavourit) => this.foodFavourit = foodFavourit;

  Snack({
    required this.foodName,
    required this.foodShortDescription,
    required this.foodDescription,
    required this.foodPrice,
    required this.category,
    required this.foodRating,
    required this.foodLikes,
    required this.foodImage,
    required this.foodFavourit,
  });

  String convertPriceToString() {
    String stringPrice = getFoodPrice.toStringAsFixed(2);

    stringPrice = "\u20B3 ${stringPrice.replaceAll(".", ",")}";

    return stringPrice;
  }
}
