class FoodItem {
  String? id;
  String? type;
  String? quantityUnit;
  String? quantityLimit;
  String? category;
  String? classification;
  String? special;
  String? fixedQuantity;
  String? name;
  String? rawItem;
  String? description;
  String? goal;
  String? time;
  String? carbs;
  String? fat;
  String? protein;
  String? lysine;
  String? fiber;
  String? calories;
  String? mealTypeSubOption;
  String? media;
  String? createdAt;
  String? updatedAt;
  List<FoodMedia>? mediaDecoded;
  String? quantityUnitDisplay;
  String? qty;
  String? quantityUi;

  FoodItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    quantityUnit = json['quantity_unit'];
    quantityLimit = json['quantity_limit'];
    category = json['category'];
    classification = json['classification'];
    special = json['special'];
    fixedQuantity = json['fixed_quantity'];
    name = json['name'];
    rawItem = json['raw_item'];
    description = json['description'];
    goal = json['goal'];
    time = json['time'];
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
    lysine = json['lysine'];
    fiber = json['fiber'];
    calories = json['calories'];
    mealTypeSubOption = json['meal_type_sub_option'];
    media = json['media'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    if (json['media_decoded'] != null) {
      mediaDecoded = [];
      json['media_decoded'].forEach((v) {
        mediaDecoded!.add(FoodMedia.fromJson(v));
      });
    }

    quantityUnitDisplay = json['quantity_unit_display'];
    qty = json['qty'];
    quantityUi = json['quantity_ui'];
  }
}


class FoodMedia {
  String? uri;
  String? type;
  String? group;
  String? url;

  FoodMedia.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    type = json['type'];
    group = json['group'];
    url = json['url'];
  }
}