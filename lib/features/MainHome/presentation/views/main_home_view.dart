import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/features/MainHome/data/models/navigation_item_model.dart';
import 'package:fitmate/features/MainHome/presentation/view_model/main_home_cubit.dart';
import 'package:fitmate/features/Profile/presentation/view/profile_screen.dart';
import 'package:fitmate/features/all_trainers/presentation/view/trainers_view.dart';
import 'package:fitmate/features/plans/presentation/views/plans_page.dart';
import 'package:fitmate/features/work_out_plans/presentation/view/workout_plans_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  static final List<NavigationItemModel> _items = [
    NavigationItemModel(
      label: AppStrings.home,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      page: const WorkoutPlansView(),
    ),
    NavigationItemModel(
      label: AppStrings.trainers,
      icon: Icons.fitness_center_outlined,
      selectedIcon: Icons.fitness_center_rounded,
      page: const TrainersView(),
    ),
    NavigationItemModel(
      label: AppStrings.plans,
      icon: Icons.calendar_today_outlined,
      selectedIcon: Icons.calendar_today_rounded,
      page: const PlansPage(),
    ),
    NavigationItemModel(
      label: AppStrings.favorites,
      icon: Icons.favorite_border_rounded,
      selectedIcon: Icons.favorite_rounded,
      page: const Placeholder(),
    ),
    NavigationItemModel(
      label: AppStrings.profile,
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
      page: const ProfileScreen(), // تم ربط شاشة البروفايل هنا
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: _items.map((item) => item.page).toList(growable: false),
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              context.read<MainHomeCubit>().changeIndex(index);
            },
            destinations: _items
                .map(
                  (item) => NavigationDestination(
                    label: item.label,
                    icon: Icon(item.icon),
                    selectedIcon: Icon(item.selectedIcon),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
