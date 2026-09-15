import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fit_up/core/dependency_injection/injection_container.dart';
import 'package:fit_up/core/routing/routes.dart';
import 'package:fit_up/features/profile/data/models/profile_model.dart';
import 'package:fit_up/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:fit_up/features/profile/presentation/view/profile_screen.dart';
import 'package:fit_up/features/profile/presentation/view/edit_profile_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => sl<ProfileCubit>(),
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
                  ProfileModel(
                    fullName: '',
                    email: '',
                    phoneNumber: '',
                    plansCompleted: 0,
                    workoutHours: 0,
                  ),
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
