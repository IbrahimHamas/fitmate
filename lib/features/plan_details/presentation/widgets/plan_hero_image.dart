import 'package:fitmate/core/constants/app_image.dart';
import 'package:flutter/material.dart';

class PlanHeroImage extends StatelessWidget {
  const PlanHeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 62, left: 16, right: 16),
      child: AspectRatio(
        aspectRatio: 358 / 320,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImage.alphaStrength,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xE5101922), Color(0x00101922)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
