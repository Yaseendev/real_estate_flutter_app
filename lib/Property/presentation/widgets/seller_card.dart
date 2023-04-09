import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/themes.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundColor: AppColors.PRIMARY_COLOR,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
            title: Text('Seller Name'),
            subtitle: Text('Poperty Owner'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '+201225568556',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
                SizedBox(width: 5),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    icon:const Icon(Icons.call_rounded),
                    label: Text(getTranslated('contact', context))),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
