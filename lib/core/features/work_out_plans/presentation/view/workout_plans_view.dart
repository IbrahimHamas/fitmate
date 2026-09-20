import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_cubit.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_state.dart';
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
    context.read<WorkoutPlansCubit>().fetchWorkoutPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bolt, size: 28),
                      SizedBox(width: 6),
                      Text('IronPulse', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                ],
              ),
          const    SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search workouts...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            const  SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Workout Plans',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            const  SizedBox(height: 8),
              // Plans List
              Expanded(
                child: BlocBuilder<WorkoutPlansCubit, WorkoutPlansState>(
                  builder: (context, state) {
                    if (state is WorkoutPlansLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is WorkoutPlansError) {
                      return Center(child: Text(state.message));
                    } else if (state is WorkoutPlansSuccess) {
                      return ListView.builder(
                        itemCount: state.plans.length,
                        itemBuilder: (context, index) {
                          return WorkoutPlanCard(plan: state.plans[index]);
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
      ),
    );
  }
}
