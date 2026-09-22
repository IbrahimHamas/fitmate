import 'package:fitmate/features/plans/presentation/widgets/app_header.dart';
import 'package:fitmate/features/plans/presentation/widgets/header_text.dart';
import 'package:fitmate/features/plans/presentation/widgets/plan_card.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppHeader(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1024),
          child: Padding(
            padding: EdgeInsets.only(top: 24, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(),
                SizedBox(height: 32),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) =>
                        PlanCard(),
                    separatorBuilder: (BuildContext context, _) =>
                        SizedBox(height: 32),
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
