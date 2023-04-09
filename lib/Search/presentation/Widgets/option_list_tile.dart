import 'package:flutter/material.dart';
import 'package:real_estate_app/Utils/themes.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  const OptionTile({
    super.key,
  required this.isSelected,
  required this.title,
  required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        trailing:
          isSelected ? Icon(Icons.check, color: AppColors.PRIMARY_COLOR, size: 26) : null,
          onTap: () => onSelected(isSelected),
    );
  }
}
