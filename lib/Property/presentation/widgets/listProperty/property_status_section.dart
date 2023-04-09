import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import '../choice_card.dart';

class PropertyStatusSection extends StatefulWidget {
  final String groupValue;
  final ValueChanged<String> onChange;
  PropertyStatusSection({
    super.key,
    required this.groupValue,
    required this.onChange,
  });

  @override
  State<PropertyStatusSection> createState() => _PropertyStatusSectionState();
}

class _PropertyStatusSectionState extends State<PropertyStatusSection> {
  late final List<String> status;

  @override
  void initState() {
    super.initState();
    
  }

@override
  void didChangeDependencies() {
      status = [
        getTranslated('finished', context),
        getTranslated('unfinished', context),
        getTranslated('semi-finished', context),
        getTranslated('core_shell', context),
      ];
    
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: status
          .map((stat) => ChoiceCard(
                label: stat,
                value: stat,
                groupValue: widget.groupValue,
                onChange: (value) => widget
                    .onChange(value), //setState(() => selectedStatus = value!),
              ))
          .toList(),
    );
  }
}
