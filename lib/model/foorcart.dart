// To parse this JSON data, do
//
//     final foodItem = foodItemFromJson(jsonString);

import 'dart:convert';

FoodItem foodItemFromJson(String str) => FoodItem.fromJson(json.decode(str));

String foodItemToJson(FoodItem data) => json.encode(data.toJson());

class FoodItem {
  String code;
  String message;
  Data data;

  FoodItem({
    required this.code,
    required this.message,
    required this.data,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int status;
  List<Param> param;

  Data({
    required this.status,
    required this.param,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    param: List<Param>.from(json["param"].map((x) => Param.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "param": List<dynamic>.from(param.map((x) => x.toJson())),
  };
}

class Param {
  int id;
  String name;
  bool featured;
  String sku;
  String priceType;
  List<Category> categories;
  List<Category> tags;
  Attributes attributes;
  String weight;
  Dimensions dimensions;
  Images images;
  ProductType productType;
  List<Variation> variations;

  Param({
    required this.id,
    required this.name,
    required this.featured,
    required this.sku,
    required this.priceType,
    required this.categories,
    required this.tags,
    required this.attributes,
    required this.weight,
    required this.dimensions,
    required this.images,
    required this.productType,
    required this.variations,
  });

  factory Param.fromJson(Map<String, dynamic> json) => Param(
    id: json["id"],
    name: json["name"],
    featured: json["featured"],
    sku: json["sku"],
    priceType: json["price_type"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
    attributes: Attributes.fromJson(json["attributes"]),
    weight: json["weight"],
    dimensions: dimensionsValues.map[json["dimensions"]]!,
    images: Images.fromJson(json["images"]),
    productType: productTypeValues.map[json["product_type"]]!,
    variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "featured": featured,
    "sku": sku,
    "price_type": priceType,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "attributes": attributes.toJson(),
    "weight": weight,
    "dimensions": dimensionsValues.reverse[dimensions],
    "images": images.toJson(),
    "product_type": productTypeValues.reverse[productType],
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

class Attributes {
  String paKosherCertification;
  String paBrand;
  String paCaseQuantity;
  String paPackSize;
  String paApproximateCaseWeight;
  PaSingleOrCase paSingleOrCase;

  Attributes({
    required this.paKosherCertification,
    required this.paBrand,
    required this.paCaseQuantity,
    required this.paPackSize,
    required this.paApproximateCaseWeight,
    required this.paSingleOrCase,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    paKosherCertification: json["pa_kosher-certification"],
    paBrand: json["pa_brand"],
    paCaseQuantity: json["pa_case-quantity"],
    paPackSize: json["pa_pack-size"],
    paApproximateCaseWeight: json["pa_approximate-case-weight"],
    paSingleOrCase: paSingleOrCaseValues.map[json["pa_single-or-case"]]!,
  );

  Map<String, dynamic> toJson() => {
    "pa_kosher-certification": paKosherCertification,
    "pa_brand": paBrand,
    "pa_case-quantity": paCaseQuantity,
    "pa_pack-size": paPackSize,
    "pa_approximate-case-weight": paApproximateCaseWeight,
    "pa_single-or-case": paSingleOrCaseValues.reverse[paSingleOrCase],
  };
}

enum PaSingleOrCase {
  CASE_SINGLE
}

final paSingleOrCaseValues = EnumValues({
  "Case, Single": PaSingleOrCase.CASE_SINGLE
});

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

enum Dimensions {
  N_A
}

final dimensionsValues = EnumValues({
  "N/A": Dimensions.N_A
});

class Images {
  int id;
  String src;

  Images({
    required this.id,
    required this.src,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "src": src,
  };
}

enum ProductType {
  VARIABLE
}

final productTypeValues = EnumValues({
  "variable": ProductType.VARIABLE
});

class Variation {
  int id;
  Name name;
  int stockQuantity;
  StockStatus stockStatus;
  String price;
  String regularPrice;
  String salePrice;
  bool isWishlist;
  bool isCart;
  String cartId;
  int cartQuantity;

  Variation({
    required this.id,
    required this.name,
    required this.stockQuantity,
    required this.stockStatus,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.isWishlist,
    required this.isCart,
    required this.cartId,
    required this.cartQuantity,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    stockQuantity: json["stock_quantity"],
    stockStatus: stockStatusValues.map[json["stock_status"]]!,
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    isWishlist: json["is_wishlist"],
    isCart: json["is_cart"],
    cartId: json["cart_id"],
    cartQuantity: json["cart_quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "stock_quantity": stockQuantity,
    "stock_status": stockStatusValues.reverse[stockStatus],
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "is_wishlist": isWishlist,
    "is_cart": isCart,
    "cart_id": cartId,
    "cart_quantity": cartQuantity,
  };
}

enum Name {
  CASE,
  SINGLE
}

final nameValues = EnumValues({
  "Case": Name.CASE,
  "Single": Name.SINGLE
});

enum StockStatus {
  INSTOCK,
  OUTOFSTOCK
}

final stockStatusValues = EnumValues({
  "instock": StockStatus.INSTOCK,
  "outofstock": StockStatus.OUTOFSTOCK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
