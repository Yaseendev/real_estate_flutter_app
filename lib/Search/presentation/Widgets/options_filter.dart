import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'option_list_tile.dart';

class OptionsFilter extends StatefulWidget {
  final VoidCallback onBack;
  // final Function(List<String>)? onAmenities;
  final String title;
  final List<String>? selectedAmenities;
  final List<String>? selectedBedrooms;
  final List<String>? selectedBathrooms;
  final List<String>? selectedLevels;
  const OptionsFilter({
    super.key,
    required this.onBack,
    required this.title,
    //required this.onAmenities,
    this.selectedAmenities,
    this.selectedBedrooms,
    this.selectedBathrooms,
    this.selectedLevels,
  });

  @override
  State<OptionsFilter> createState() => _OptionsFilterState();
}

class _OptionsFilterState extends State<OptionsFilter> {
  final List<String> amenities = ['Balcony', 'Pool', 'Security'];
  final List<String> bedrooms = [
    ...List.generate(10, (index) => (index + 1).toString()),
    '10+',
  ];
  late final List<String> bathrooms;
  late final List<String> levels;

  @override
  void initState() {
    bathrooms = List.of(bedrooms);
    levels = [
      'Ground',
      ...bedrooms,
      'Highest',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                        shape: MaterialStateProperty.all(
                          CircleBorder(),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF5F5F5)),
                        alignment: Alignment.center,
                        // /padding: MaterialStateProperty.all(EdgeInsets.only(left: 10)),
                      ),
                      onPressed: () {
                        widget.onBack();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      left: 16,
                      bottom: 10,
                    ),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  switch (widget.title) {
                    case 'Amenities':
                      setState(widget.selectedAmenities!.clear);
                      break;
                    case 'Bedrooms':
                      setState(widget.selectedBedrooms!.clear);
                      break;
                    case 'Bathrooms':
                      setState(widget.selectedBathrooms!.clear);
                      break;
                    case 'Levels':
                      setState(widget.selectedLevels!.clear);
                      break;
                    case 'المرافق':
                      setState(widget.selectedAmenities!.clear);
                      break;
                    case 'غرف النوم':
                      setState(widget.selectedBedrooms!.clear);
                      break;
                    case 'حمامات':
                      setState(widget.selectedBathrooms!.clear);
                      break;
                    case 'طوابق':
                      setState(widget.selectedLevels!.clear);
                      break;
                    default:
                      break;
                  }
                },
                child: Text(getTranslated('clear_all', context))),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              ...ListTile.divideTiles(
                context: context,
                tiles: buildOptions(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> buildOptions() {
    switch (widget.title) {
      case 'Amenities':
        return amenities
            .map((amenity) => OptionTile(
                  title: amenity,
                  isSelected: widget.selectedAmenities!.contains(amenity),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedAmenities!.remove(amenity)
                          : widget.selectedAmenities!.add(amenity);
                    });
                  },
                ))
            .toList();
      case 'Bedrooms':
        return bedrooms
            .map((bedroom) => OptionTile(
                  title: bedroom,
                  isSelected: widget.selectedBedrooms!.contains(bedroom),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedBedrooms!.remove(bedroom)
                          : widget.selectedBedrooms!.add(bedroom);
                    });
                  },
                ))
            .toList();
      case 'Bathrooms':
        return bathrooms
            .map((bathroom) => OptionTile(
                  title: bathroom,
                  isSelected: widget.selectedBathrooms!.contains(bathroom),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedBathrooms!.remove(bathroom)
                          : widget.selectedBathrooms!.add(bathroom);
                    });
                  },
                ))
            .toList();
      case 'Levels':
        return levels
            .map((level) => OptionTile(
                  title: level,
                  isSelected: widget.selectedLevels!.contains(level),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedLevels!.remove(level)
                          : widget.selectedLevels!.add(level);
                    });
                  },
                ))
            .toList();
      case 'المرافق':
        return amenities
            .map((amenity) => OptionTile(
                  title: amenity,
                  isSelected: widget.selectedAmenities!.contains(amenity),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedAmenities!.remove(amenity)
                          : widget.selectedAmenities!.add(amenity);
                    });
                  },
                ))
            .toList();
      case 'غرف النوم':
        return bedrooms
            .map((bedroom) => OptionTile(
                  title: bedroom,
                  isSelected: widget.selectedBedrooms!.contains(bedroom),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedBedrooms!.remove(bedroom)
                          : widget.selectedBedrooms!.add(bedroom);
                    });
                  },
                ))
            .toList();
      case 'حمامات':
        return bathrooms
            .map((bathroom) => OptionTile(
                  title: bathroom,
                  isSelected: widget.selectedBathrooms!.contains(bathroom),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedBathrooms!.remove(bathroom)
                          : widget.selectedBathrooms!.add(bathroom);
                    });
                  },
                ))
            .toList();
      case 'طوابق':
        return levels
            .map((level) => OptionTile(
                  title: level,
                  isSelected: widget.selectedLevels!.contains(level),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? widget.selectedLevels!.remove(level)
                          : widget.selectedLevels!.add(level);
                    });
                  },
                ))
            .toList();
      default:
        return [];
    }
  }
}
