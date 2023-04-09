import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/Property/presentation/screens/properties_screen.dart';

class CategoryHomeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  const CategoryHomeCard({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(label);
          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PropertiesScreen(
                              category: label,
                            )));
      },
      child: SizedBox(
        width: 80.w,
        height: 90.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 32,
                ),
                radius: 25,
              ),
            ),
            //SizedBox(height: 4),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
