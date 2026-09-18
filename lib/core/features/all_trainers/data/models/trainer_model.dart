class TrainerModel {
  final String id;
  final String name;
  final String specialty;
  final double rating;
  final int yearsExp;
  final int clientsCount;
  final String imageUrl;

  const TrainerModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.yearsExp,
    required this.clientsCount,
    required this.imageUrl,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) {
    return TrainerModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      specialty: json['specialty']?.toString() ?? '',
      rating: _toDouble(json['rating']),
      yearsExp: _toInt(json['years_exp']),
      clientsCount: _toInt(json['clients_count']),
      imageUrl: json['image_url']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'years_exp': yearsExp,
      'clients_count': clientsCount,
      'image_url': imageUrl,
    };
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;

    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(value.toString()) ?? 0.0;
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;

    if (value is num) {
      return value.toInt();
    }

    return int.tryParse(value.toString()) ?? 0;
  }
}