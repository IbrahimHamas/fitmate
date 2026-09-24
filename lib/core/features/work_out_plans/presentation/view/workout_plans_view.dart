import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_cubit.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_state.dart';
import 'package:fitmate/core/common/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/workout_plan_card.dart';

class WorkoutPlansView extends StatefulWidget {
  const WorkoutPlansView({super.key});

  @override
  State<WorkoutPlansView> createState() => _WorkoutPlansViewState();
}

class _WorkoutPlansViewState extends State<WorkoutPlansView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.width(context, 16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Responsive.height(context, 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bolt, size: Responsive.font(context, 28)),
                      SizedBox(width: Responsive.width(context, 6)),
                      Text(
                        'IronPulse',
                        style: TextStyle(
                          fontSize: Responsive.font(context, 14),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: Responsive.height(context, 16)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search workouts...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              SizedBox(height: Responsive.height(context, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Featured Workout Plans',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: Responsive.font(context, 14)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(fontSize: Responsive.font(context, 12)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Responsive.height(context, 8)),
              Expanded(
                child: BlocBuilder<WorkoutPlansCubit, WorkoutPlansState>(
                  builder: (context, state) {
                    if (state is WorkoutPlansLoading ||
                        state is WorkoutPlansInitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is WorkoutPlansError) {
                      return Center(child: Text(state.message));
                    } else if (state is WorkoutPlansSuccess) {
                      if (state.plans.isEmpty) {
                        return const Center(
                          child: Text('No workout plans found'),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.plans.length,
                        itemBuilder: (context, index) {
                          return WorkoutPlanCard(plan: state.plans[index]);
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
