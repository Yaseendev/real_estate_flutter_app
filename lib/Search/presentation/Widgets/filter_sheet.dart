import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'options_filter.dart';
import 'category_filter.dart';
import 'filter_form.dart';

class FilterSheet extends StatefulWidget {
  final String? category;
  final Set<String> categories;
  final List<String> amenities;
  final List<String> bedrooms;
  final List<String> bathrooms;
  final List<String> levels;
  const FilterSheet({
    Key? key,
    this.category,
    required this.categories,
    required this.amenities,
    required this.bedrooms,
    required this.bathrooms,
    required this.levels,
  }) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final PageController pageController = PageController(initialPage: 0);
  late final List<Widget> fliterPages;
  late final List<Widget> fliterOptionsPages;
  //late final Set<String> categories;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    fliterOptionsPages = [
      CategoryFilter(
        categories: widget.categories,
        onBack: () => goToPage(0),
      ),
      OptionsFilter(
        onBack: () => goToPage(0),
        title: getTranslated('amenities', context),
        // onAmenities: widget.onSelectedAmenities,
        selectedAmenities: widget.amenities,
      ),
      OptionsFilter(
        onBack: () => goToPage(0),
        title: getTranslated('bedrooms', context),
        // onAmenities: widget.onSelectedAmenities,
        selectedBedrooms: widget.bedrooms,
      ),
      OptionsFilter(
        onBack: () => goToPage(0),
        title: getTranslated('bathrooms', context),
        // onAmenities: widget.onSelectedAmenities,
        selectedBathrooms: widget.bathrooms,
      ),
      OptionsFilter(
        onBack: () => goToPage(0),
        title: getTranslated('levels', context),
        // onAmenities: widget.onSelectedAmenities,
        selectedLevels: widget.levels,
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .75,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            FilterForm(
              categories: widget.categories,
              selectedAmenities: widget.amenities,
              selectedBedrooms: widget.bedrooms,
              selectedBathrooms: widget.bathrooms,
              selectedLevels: widget.levels,
              onCategory: () {
                goToPage(1, 0);
              },
              onAmenities: () => goToPage(1, 1),
              onBedrooms: () => goToPage(1, 2),
              onBathrooms: () => goToPage(1, 3),
              onLevels: () => goToPage(1, 4),
            ),
            fliterOptionsPages[currentIndex],
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    if (pageController.page?.toInt() == 0) {
      return Future.value(true);
    } else {
      goToPage(0);
      return Future.value(false);
    }
  }

  Future<void> goToPage(int page, [int? optionPage]) async {
    if (optionPage != null) setState(() => currentIndex = optionPage);
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 120), curve: Curves.easeIn);
  }
}
