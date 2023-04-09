import 'package:flutter/material.dart';
import 'package:real_estate_app/Property/data/models/filter_check_state.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/themes.dart';

class CategoryFilter extends StatefulWidget {
  final Function onBack;
  final Set<String> categories;
  const CategoryFilter({
    super.key,
    required this.onBack,
    required this.categories,
  });

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  late final FilterCheckState all;

  late final List<FilterCheckState> values;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    values = [
      FilterCheckState(
        title: getTranslated('apartments', context),
        icon: Icons.apartment_rounded,
        value: widget.categories.isEmpty ||
            widget.categories.contains(getTranslated('apartments', context)),
      ),
      FilterCheckState(
        title: getTranslated('villas', context),
        icon: Icons.villa_rounded,
        value:
            widget.categories.isEmpty || widget.categories.contains(getTranslated('villas', context)),
      ),
      FilterCheckState(
        title: getTranslated('vacation_homes', context),
        icon: Icons.holiday_village_rounded,
        value: widget.categories.isEmpty ||
            widget.categories.contains(getTranslated('vacation_homes', context)),
      ),
      FilterCheckState(
        title: getTranslated('commercials', context),
        icon: Icons.store_rounded,
        value: widget.categories.isEmpty ||
            widget.categories.contains(getTranslated('commercials', context)),
      ),
      FilterCheckState(
        title: getTranslated('buildings', context),
        icon: Icons.corporate_fare_rounded,
        value: widget.categories.isEmpty ||
            widget.categories.contains(getTranslated('buildings', context)),
      ),
      FilterCheckState(
        title: getTranslated('lands', context),
        icon: Icons.crop_portrait_rounded,
        value: widget.categories.isEmpty || widget.categories.contains(getTranslated('lands', context)),
      ),
    ];
    all = FilterCheckState(
      title: getTranslated('all', context),
      value: values.every((element) => element.value),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  shape: MaterialStateProperty.all(
                    CircleBorder(),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5)),
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
                getTranslated('categories', context),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        ListView(
          shrinkWrap: true,
          children: [
            CheckboxListTile(
              title: Text(all.title),
              secondary: Icon(all.icon),
              value: all.value,
              activeColor: AppColors.PRIMARY_COLOR,
              onChanged: toggleGroup,
            ),
            const Divider(),
            ...values.map(buildCheckBox),
          ],
        ),
      ],
    );
  }

  Widget buildCheckBox(FilterCheckState checkState) => CheckboxListTile(
        title: Text(checkState.title),
        secondary: Icon(checkState.icon),
        value: checkState.value,
        activeColor: AppColors.PRIMARY_COLOR,
        onChanged: (value) {
          setState(() {
            checkState.value = value ?? false;
            all.value = values.every((element) => element.value);
            value ?? false
                ? widget.categories.add(checkState.title)
                : widget.categories.isEmpty
                    ? widget.categories.addAll(values
                        .map((e) => e.title)
                        .skipWhile((value) => value == checkState.title))
                    : widget.categories.remove(checkState.title);
          });
        },
      );

  void toggleGroup(bool? state) {
    if (state != null)
      setState(() {
        all.value = state;
        values.forEach((category) {
          category.value = state;
        });
        state
            ? widget.categories.addAll(values.map((e) => e.title))
            : widget.categories.clear();
      });
  }
}
