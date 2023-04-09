import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
   String searchTerm = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextFormField(
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
                prefixIcon: Icon(Icons.search),
              ),
                onChanged: (value) {
                  searchTerm = value;
                
                },
                textAlignVertical: TextAlignVertical.bottom,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
        );
  }
}