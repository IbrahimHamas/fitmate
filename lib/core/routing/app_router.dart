import 'package:fitmate/core/dependency_injection/injection_container.dart';
import 'package:fitmate/core/features/MainHome/presentation/view_model/main_home_cubit.dart';
import 'package:fitmate/core/features/MainHome/presentation/views/main_home_view.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view/trainers_view.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view/workout_plans_view.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_cubit.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:fitmate/features/auth/presentation/views/login_view.dart';
import 'package:fitmate/features/auth/presentation/views/sign_up_view.dart';
import 'package:fitmate/features/welcome/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return PageRouteBuilder<void>(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 280),
          pageBuilder: (context, _, _) => WelcomeView(
            onGetStarted: () => Navigator.of(context).pushNamed(Routes.login),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            if (MediaQuery.disableAnimationsOf(context)) return child;
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              BlocProvider(create: (_) => sl<AuthCubit>(), child: LoginView()),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              BlocProvider(create: (_) => sl<AuthCubit>(), child: SignUpView()),
        );
      /*  case Routes.profile:
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

      //plan details
      case Routes.planDetails:
        return MaterialPageRoute(builder: (_) => PlanDetails());


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
        */
      case Routes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => MainHomeCubit(),
            child:  MainHomeView(),
          ),
        );
      case Routes.workoutPlans:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<WorkoutPlansCubit>(
            create: (_) => sl<WorkoutPlansCubit>()..fetchWorkoutPlans(),
            child: const WorkoutPlansView(),
          ),
        );
      case Routes.trainers:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<TrainersCubit>(
            create: (_) => sl<TrainersCubit>()..fetchTrainers(),
            child: const TrainersView(),
          ),
        );
    }
  }
}
