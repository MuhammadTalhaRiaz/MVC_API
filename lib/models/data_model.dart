class Product {
  final String id;
  final String name;
  final ProductData? data;

  Product({required this.id, required this.name, required this.data});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
    );
  }
}

class ProductData {
  final String? color; // Optional
  final String? capacity; // Optional
  final double? price; // Optional
  final String? generation; // Optional
  final int? year; // Optional
  final String? cpuModel; // Optional
  final String? hardDiskSize; // Optional
  final String? strapColour; // Optional
  final String? caseSize; // Optional
  final String? description; // Optional
  final double? screenSize; // Optional

  ProductData({
    this.color,
    this.capacity,
    this.price,
    this.generation,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColour,
    this.caseSize,
    this.description,
    this.screenSize,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      color: json['color'],
      capacity: (json['capacity'] is String)
          ? json['capacity']
          : (json['capacity GB'] is int) ? json['capacity GB'].toString() : null,
      price: (json['price'] is String)
          ? double.tryParse(json['price'])
          : (json['price'] is int) ? json['price'].toDouble() : null,
      generation: json['generation'],
      year: json['year'],
      cpuModel: json['CPU model'],
      hardDiskSize: json['Hard disk size'],
      strapColour: json['Strap Colour'],
      caseSize: json['Case Size'],
      description: json['Description'],
      screenSize: (json['Screen size'] is String)
          ? double.tryParse(json['Screen size'])
          : (json['Screen size'] is int) ? json['Screen size'].toDouble() : null,
    );
  }
}
