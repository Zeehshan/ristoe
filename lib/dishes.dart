class Categories {
  int? id;
  String? title;
  String? mid;
  int? sort;
  int? status;
  List<Dishes>? dishes;

  Categories(
      {this.id, this.title, this.mid, this.sort, this.status, this.dishes});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mid = json['mid'];
    sort = json['sort'];
    status = json['status'];
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(Dishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['mid'] = mid;
    data['sort'] = sort;
    data['status'] = status;
    if (dishes != null) {
      data['dishes'] = dishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dishes {
  int? id;
  String? code;
  String? name;
  int? categorie;
  String? img;
  String? description;
  int? isMenu;
  String? normalDishAttrs;
  String? normalDishAttrsFlatten;
  int? menuFixedLimit;
  bool? menuFixedDishes;
  int? isSpicy;
  int? isConge;
  int? isVegan;
  int? isLaunch;
  int? isDinner;
  int? isDelivery;
  String? price;
  int? sort;
  List<Allergens>? allergens;
  int? status;

  Dishes(
      {this.id,
      this.code,
      this.name,
      this.categorie,
      this.img,
      this.description,
      this.isMenu,
      this.normalDishAttrs,
      this.normalDishAttrsFlatten,
      this.menuFixedLimit,
      this.menuFixedDishes,
      this.isSpicy,
      this.isConge,
      this.isVegan,
      this.isLaunch,
      this.isDinner,
      this.isDelivery,
      this.price,
      this.sort,
      this.allergens,
      this.status});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    categorie = json['categorie'];
    img = json['img'];
    description = json['description'];
    isMenu = json['is_menu'];
    normalDishAttrs = json['normal_dish_attrs'];
    normalDishAttrsFlatten = json['normal_dish_attrs_flatten'];
    menuFixedLimit = json['menu_fixed_limit'];
    menuFixedDishes = json['menu_fixed_dishes'];
    isSpicy = json['is_spicy'];
    isConge = json['is_conge'];
    isVegan = json['is_vegan'];
    isLaunch = json['is_launch'];
    isDinner = json['is_dinner'];
    isDelivery = json['is_delivery'];
    price = json['price'];
    sort = json['sort'];
    if (json['allergens'] != null) {
      allergens = <Allergens>[];
      json['allergens'].forEach((v) {
        allergens!.add(new Allergens.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['categorie'] = categorie;
    data['img'] = img;
    data['description'] = description;
    data['is_menu'] = isMenu;
    data['normal_dish_attrs'] = normalDishAttrs;
    data['normal_dish_attrs_flatten'] = normalDishAttrsFlatten;
    data['menu_fixed_limit'] = menuFixedLimit;
    data['menu_fixed_dishes'] = menuFixedDishes;
    data['is_spicy'] = isSpicy;
    data['is_conge'] = isConge;
    data['is_vegan'] = isVegan;
    data['is_launch'] = isLaunch;
    data['is_dinner'] = isDinner;
    data['is_delivery'] = isDelivery;
    data['price'] = price;
    data['sort'] = sort;
    if (allergens != null) {
      data['allergens'] = allergens!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Allergens {
  int? id;
  String? name;
  String? img;

  Allergens({this.id, this.name, this.img});

  Allergens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    return data;
  }
}
