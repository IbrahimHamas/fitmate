class WorkOutPlansModel {
  final String? id;
  final String title;
  final String description;
  final String level;
  final String imageUrl;
  final int durationMinutes;
  final int calories;
  final String equipment;
  final double rating;
  final int durationWeeks;
  final int minutesPerDay;
  final int frequencyDaysPerWeek;
  final String intensity;
  final bool isFavorite;

  WorkOutPlansModel({
    this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.imageUrl,
    required this.durationMinutes,
    required this.calories,
    required this.equipment,
    required this.rating,
    required this.durationWeeks,
    required this.minutesPerDay,
    required this.frequencyDaysPerWeek,
    required this.intensity,
    this.isFavorite = false,
  });

  int get duration => durationMinutes;

  String get tagExtra => '$frequencyDaysPerWeek days/week';

  factory WorkOutPlansModel.fromJson(Map<String, dynamic> json) {
    return WorkOutPlansModel(
      id: json['id'] as String?,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      level: json['level'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      durationMinutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
      calories: (json['calories'] as num?)?.toInt() ?? 0,
      equipment: json['equipment'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      durationWeeks: (json['duration_weeks'] as num?)?.toInt() ?? 0,
      minutesPerDay: (json['minutes_per_day'] as num?)?.toInt() ?? 0,
      frequencyDaysPerWeek:
          (json['frequency_days_per_week'] as num?)?.toInt() ?? 0,
      intensity: json['intensity'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'level': level,
      'image_url': imageUrl,
      'duration_minutes': durationMinutes,
      'calories': calories,
      'equipment': equipment,
      'rating': rating,
      'duration_weeks': durationWeeks,
      'minutes_per_day': minutesPerDay,
      'frequency_days_per_week': frequencyDaysPerWeek,
      'intensity': intensity,
    };
  }
}
