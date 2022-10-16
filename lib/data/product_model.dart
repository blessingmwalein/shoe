class Product {
  final int id;
  final String name;
  final double price;
  final double totalRating;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.totalRating,
    required this.image,
  });

  toJSONEncodable() {
    Map<String, dynamic> m = {};

    m['id'] = id;
    m['name'] = name;
    m['price'] = price;
    m['totalRating'] = totalRating;
    m['image'] = image;

    return m;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "totalRating": totalRating
    };
  }
}

class ScreenArguments {
  final String id;
  final String name;
  final double price;
  final double totalRating;
  final String image;

  ScreenArguments({
    required this.id,
    required this.name,
    required this.price,
    required this.totalRating,
    required this.image,
  });
}

class OrderList {
  List<Product> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
