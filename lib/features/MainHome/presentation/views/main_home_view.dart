import 'package:fit_up/features/MainHome/data/models/navigation_item_model.dart';
import 'package:fit_up/features/MainHome/presentation/view_model/main_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  static final List<NavigationItemModel> _items = [
    NavigationItemModel(
      label: 'Home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      page: Placeholder(),
    ),
    NavigationItemModel(
      label: 'Trainers',
      icon: Icons.shopping_cart_outlined,
      selectedIcon: Icons.shopping_cart_rounded,
      page: Placeholder(),
    ),
    NavigationItemModel(
      label: 'Plans',
      icon: Icons.favorite_border_rounded,
      selectedIcon: Icons.favorite_rounded,
      page: Placeholder(),
    ),
    NavigationItemModel(
      label: 'Favorites',
      icon: Icons.menu_rounded,
      selectedIcon: Icons.menu_open_rounded,
      page: Placeholder(),
    ),
    NavigationItemModel(
      label: 'Favorites',
      icon: Icons.menu_rounded,
      selectedIcon: Icons.menu_open_rounded,
      page: Placeholder(),
    ),
    NavigationItemModel(
      label: 'Profile',
      icon: Icons.menu_rounded,
      selectedIcon: Icons.menu_open_rounded,
      page: Placeholder(),
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
