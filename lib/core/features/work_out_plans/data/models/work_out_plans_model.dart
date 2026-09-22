class WorkoutPlanModel {
  final String id;
  final String title;
  final String description;
  final String level; // Intermediate, Advanced, Beginner
  final String duration;
  final String tagExtra; // e.g. "Weights", "550 kcal", "No Gear"
  final String imageUrl;
  final bool isFavorite;

  WorkoutPlanModel({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.duration,
    required this.tagExtra,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory WorkoutPlanModel.fromJson(Map<String, dynamic> json) {
    return WorkoutPlanModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      level: json['level'] ?? 'Beginner',
      duration: json['duration'] ?? '',
      tagExtra: json['tag_extra'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'level': level,
      'duration': duration,
      'tag_extra': tagExtra,
      'image_url': imageUrl,
      'is_favorite': isFavorite,
    };
  }
}