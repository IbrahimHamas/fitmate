import 'package:fitmate/core/dependency_injection/injection_container.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/features/profile/data/models/profile_model.dart';
import 'package:fitmate/features/profile/presentation/view/edit_profile_screen.dart';
import 'package:fitmate/features/profile/presentation/view/profile_screen.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.profile:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<ProfileCubit>()..getProfile(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.editProfile:
        final args = settings.arguments;
        final ProfileModel? profileModel = args is ProfileModel ? args : null;

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<ProfileCubit>(),
            child: EditProfileScreen(
              profile:
                  profileModel ??
                  const ProfileModel(
                    fullName: '',
                    email: '',
                    phoneNumber: '',
                    plansCompleted: 0,
                    workoutHours: 0,
                  ),
            ),
          ),
        );

      // plan details
      /* case Routes.planDetails:
        return MaterialPageRoute(builder: (_) => PlanDetails()); */

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
