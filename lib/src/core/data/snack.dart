class Snack {
  //  Variabeln //

  /*  Name  */
  String foodName;
  get getFoodName => foodName;
  set setFoodName(foodName) => this.foodName = foodName;

  String foodDescription;
  get getFoodDescription => foodDescription;
  set setFoodDescription(foodDescription) =>
      this.foodDescription = foodDescription;

  /*  Preis */
  double foodPrice;
  get getFoodPrice => foodPrice;
  set setFoodPrice(foodPrice) => this.foodPrice = foodPrice;

  /*  Kategorie */
  List<String> category;

  get getCategory => category;
  set setCategory(category) => this.category = category;

  /*  Rating  */
  double foodRating;
  get getFoodRating => foodRating;
  set setFoodRating(foodRating) => this.foodRating = foodRating;

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

    stringPrice = "${stringPrice.replaceAll(".", ",")} €";

    return stringPrice;
  }
}
