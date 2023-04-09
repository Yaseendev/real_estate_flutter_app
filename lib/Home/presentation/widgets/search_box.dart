import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';

class SearchBox extends StatelessWidget {
  final Function onPress;
  const SearchBox({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: TextField(
              readOnly: true,
              autofocus: false,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    width: 0,
                    color: Color(0xFFF6F6F6),
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xFFF6F6F6),
                filled: true,
                hintText: getTranslated('search', context),
                prefixIcon:const Icon(Icons.search),
              ),
              textAlignVertical: TextAlignVertical.bottom,
              onTap: () => onPress(),
            ),
          ),
        ),
        SizedBox(width: 5),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              onPress();
            },
            child: Center(child: Icon(Icons.search)),
          ),
        ),
      ],
    );
  }
}
