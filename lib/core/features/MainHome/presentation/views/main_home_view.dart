
import 'package:fitmate/core/dependency_injection/injection_container.dart';
import 'package:fitmate/core/features/MainHome/data/models/navigation_item_model.dart';
import 'package:fitmate/core/features/MainHome/presentation/view_model/main_home_cubit.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view/workout_plans_view.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_cubit.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  static final List<NavigationItemModel> _items = [
    NavigationItemModel(
      label: 'Home',
      icon: SvgAssetLoader('assets/svgs/home.svg'),
      selectedIcon: SvgAssetLoader('assets/svgs/home.svg'),
      page: BlocProvider<WorkoutPlansCubit>(
        create: (_) => sl<WorkoutPlansCubit>(),
        child: const WorkoutPlansView(),
      ),
    ),
    // NavigationItemModel(
    //   label: 'Trainers',
    //   icon: SvgAssetLoader('assets/svgs/trainers_icon.svg'),
    //   selectedIcon: SvgAssetLoader('assets/svgs/trainers_icon.svg'),
    //   page: BlocProvider<TrainersCubit>(
    //     create: (_) => sl<TrainersCubit>(),
    //     child: const TrainersView(),
    //   ),
    // ),
    NavigationItemModel(
      label: 'Plans',
      icon: SvgAssetLoader('assets/svgs/plans.svg'),
      selectedIcon: SvgAssetLoader('assets/svgs/plans.svg'),
      page: Placeholder(),
    ),
    NavigationItemModel(
      label: 'Favorites',
      icon: SvgAssetLoader('assets/svgs/favourite.svg'),
      selectedIcon: SvgAssetLoader('assets/svgs/favourite.svg'),
      page: Placeholder(),
    ),

    NavigationItemModel(
      label: 'Profile',
      icon: SvgAssetLoader('assets/svgs/profile.svg'),
      selectedIcon: SvgAssetLoader('assets/svgs/profile.svg'),
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
                .asMap()
                .entries
                .map(
                  (entry) => NavigationDestination(
                    icon: SvgPicture.asset(
                      entry.value.icon.assetName,
                      colorFilter: ColorFilter.mode(
                        AppColor.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    selectedIcon: SvgPicture.asset(
                      entry.value.selectedIcon.assetName,
                      colorFilter: ColorFilter.mode(
                        AppColor.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: entry.value.label,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
