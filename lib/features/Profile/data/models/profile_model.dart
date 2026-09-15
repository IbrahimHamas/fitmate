class ProfileModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? profileImage;
  final int plansCompleted;
  final int workoutHours;

  const ProfileModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.profileImage,
    required this.plansCompleted,
    required this.workoutHours,
  });

  ProfileModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? profileImage,
    int? plansCompleted,
    int? workoutHours,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      plansCompleted: plansCompleted ?? this.plansCompleted,
      workoutHours: workoutHours ?? this.workoutHours,
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      profileImage: json['profile_image'],
      plansCompleted: (json['plans_completed'] as num?)?.toInt() ?? 0,
      workoutHours: (json['workout_hours'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'plans_completed': plansCompleted,
      'workout_hours': workoutHours,
    };
  }
}
