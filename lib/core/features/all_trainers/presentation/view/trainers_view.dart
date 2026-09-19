 
import 'package:fitmate/core/common/widgets/custom_error_widget.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view/widgets/custom_app_bar.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view/widgets/custom_search_bar.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view/widgets/empty_widget.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view/widgets/fetch_trainers.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_state.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/trainer_card_widget.dart';

class TrainersView extends StatefulWidget {
  const TrainersView({super.key});

  @override
  State<TrainersView> createState() => _TrainersViewState();
}

class _TrainersViewState extends State<TrainersView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainersCubit>().fetchTrainers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            CustomSearchBar(controller: _searchController),
            Expanded(
              child: BlocBuilder<TrainersCubit, TrainersState>(
                builder: (context, state) {
                  if (state is TrainersLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColor.primary),
                    );
                  }

                  if (state is TrainersError) {
                    return CustomErrorWidget(message: state.message, onPressed: () { 
                        fetchtraniers(context);
                     },);
                  }

                  if (state is TrainersSuccess) {
                    if (state.trainers.isEmpty) {
                      return CustomEmptyWidget();
                    }

                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(12.w, 14.h, 12.w, 20.h),
                      itemCount: state.trainers.length,
                      itemBuilder: (context, index) {
                        final trainer = state.trainers[index];

                        return TrainerCardWidget(
                          trainer: trainer,
                          onTap: () {
                            
                            // Navigate to trainer profile
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
