import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        "Find Your Plan",

        style: textTheme.headlineMedium!.copyWith(fontSize: 30, height: 1.2),
      ),
    );
  }
}
