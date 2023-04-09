import 'package:flutter/material.dart';
import 'package:real_estate_app/Utils/themes.dart';

class SpecsCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final int number;
  const SpecsCard({
    super.key,
    required this.icon,
    required this.label,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: SizedBox(
        width: 130,
        child: Card(
          elevation: 0,
          color: AppColors.PRIMARY_COLOR.withAlpha(90),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors
                        .white, // AppColors.SECONDARY_COLOR.withOpacity(0.3),
                    child: Icon(
                      icon,
                      color: AppColors.PRIMARY_COLOR,
                      size: 25,
                    ),
                    radius: 25,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '$number',
                  //label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
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
