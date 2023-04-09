import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/Utils/themes.dart';

class ChoiceCard extends StatelessWidget {
  final Object value;
  final ValueChanged onChange;
  final Object? groupValue;
  final String label;
  const ChoiceCard({
    super.key,
    required this.label,
    required this.value,
    required this.onChange,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145.sp,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: RadioListTile(
          value: value,
          groupValue: groupValue,
          onChanged: onChange,
          activeColor: AppColors.PRIMARY_COLOR,
          contentPadding: EdgeInsets.zero,
          dense: true,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: value == groupValue
                  ? AppColors.PRIMARY_COLOR
                  : Color(0xFF000000),
              width: value == groupValue ? 1.5 : 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          tileColor: value == groupValue
              ? AppColors.PRIMARY_COLOR.withAlpha(90)
              : null,
          title: Text(
            label,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
