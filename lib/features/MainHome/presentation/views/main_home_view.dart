import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/features/MainHome/data/models/navigation_item_model.dart';
import 'package:fitmate/features/MainHome/presentation/view_model/main_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  static final List<NavigationItemModel> _items = [
    NavigationItemModel(
      label: 'Home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      page: const Placeholder(),
    ),
    NavigationItemModel(
      label: 'Trainers',
      icon: Icons.fitness_center_outlined,
      selectedIcon: Icons.fitness_center_rounded,
      page: const Placeholder(),
    ),
    NavigationItemModel(
      label: 'Plans',
      icon: Icons.calendar_today_outlined,
      selectedIcon: Icons.calendar_today_rounded,
      page: const Placeholder(),
    ),
    NavigationItemModel(
      label: 'Favorites',
      icon: Icons.favorite_border_rounded,
      selectedIcon: Icons.favorite_rounded,
      page: const Placeholder(),
    ),
    NavigationItemModel(
      label: 'Profile',
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
