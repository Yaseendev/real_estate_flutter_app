import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'furnished_chip.dart';
import 'sort_chip.dart';

class FilterForm extends StatefulWidget {
  final VoidCallback onCategory;
  final Set<String> categories;
  final List<String> selectedAmenities;
  final List<String> selectedBedrooms;
  final List<String> selectedBathrooms;
  final List<String> selectedLevels;
  final VoidCallback onAmenities;
  final VoidCallback onBedrooms;
  final VoidCallback onBathrooms;
  final VoidCallback onLevels;

  const FilterForm({
    super.key,
    required this.categories,
    required this.onCategory,
    required this.onAmenities,
    required this.onBedrooms,
    required this.onBathrooms,
    required this.onLevels,
    required this.selectedAmenities,
    required this.selectedBedrooms,
    required this.selectedBathrooms,
    required this.selectedLevels,
  });

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<bool> selectedList = [false, true, false, false];
  final List<bool> selectedFurnished = List<bool>.filled(2, false);
  final Set<String> propertyStatuses = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: 10,
            ),
            child: Text(
              getTranslated('filter', context),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              children: [
                Text(
                  getTranslated('sort', context),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SortChip(
                        label: getTranslated('newly_listed', context),
                        selected: selectedList[0],
                        onSelect: (value) {
                          if (value)
                            setState(() {
                              selectedList.fillRange(
                                  0, selectedList.length, false);
                              selectedList[0] = value;
                            });
                        },
                      ),
                      const SizedBox(width: 10),
                      SortChip(
                        label: getTranslated('most_relv', context),
                        selected: selectedList[1],
                        onSelect: (value) {
                          if (value)
                            setState(() {
                              selectedList.fillRange(
                                  0, selectedList.length, false);
                              selectedList[1] = value;
                            });
                        },
                      ),
                      const SizedBox(width: 10),
                      SortChip(
                        label: getTranslated('lowest_price', context),
                        selected: selectedList[2],
                        onSelect: (value) {
                          if (value)
                            setState(() {
                              selectedList.fillRange(
                                  0, selectedList.length, false);
                              selectedList[2] = value;
                            });
                        },
                      ),
                      const SizedBox(width: 10),
                      SortChip(
                        label: getTranslated('highest_price', context),
                        selected: selectedList[3],
                        onSelect: (value) {
                          if (value)
                            setState(() {
                              selectedList.fillRange(
                                  0, selectedList.length, false);
                              selectedList[3] = value;
                            });
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    getTranslated('categories', context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    widget.categories.isEmpty || widget.categories.length == 6
                        ? getTranslated('all', context)
                        : widget.categories.join(', '),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    widget.onCategory();
                  },
                ),
                const Divider(),
                Text(
                  getTranslated('price_range', context),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textInputAction: TextInputAction.next,
                        //initialValue: startPrice != null ? '$startPrice': null,
                        validator: (val) {
                          if (val != null) {
                            if (val.isNotEmpty && double.tryParse(val) == null)
                              return getTranslated('invalid_value', context);
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        //onChanged: (value) =>startPrice = double.tryParse(value),
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                        height: 40,
                        width: 120,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          //initialValue: endPrice != null ? '$endPrice': null,
                          validator: (val) {
                            if (val != null) {
                              if (val.isNotEmpty &&
                                  double.tryParse(val) == null)
                                return getTranslated('invalid_value', context);
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          //onChanged: (value) =>endPrice = double.tryParse(value),
                        )),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                Text(
                  getTranslated('area_range', context),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textInputAction: TextInputAction.next,
                        //initialValue: startPrice != null ? '$startPrice': null,
                        validator: (val) {
                          if (val != null) {
                            if (val.isNotEmpty && double.tryParse(val) == null)
                              return getTranslated('invalid_value', context);
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        //onChanged: (value) =>startPrice = double.tryParse(value),
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                        height: 40,
                        width: 120,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          //initialValue: endPrice != null ? '$endPrice': null,
                          validator: (val) {
                            if (val != null) {
                              if (val.isNotEmpty &&
                                  double.tryParse(val) == null)
                                return getTranslated('invalid_value', context);
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          //onChanged: (value) =>endPrice = double.tryParse(value),
                        )),
                  ],
                ),
                const Divider(),
                Text(
                  getTranslated('furnished', context),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    FilterSheetChip(
                      label: getTranslated('furnished', context),
                      selected: selectedFurnished[0],
                      onSelect: (value) {
                        setState(() {
                          selectedFurnished[0] = value;
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    FilterSheetChip(
                      label: getTranslated('unfurnished', context),
                      selected: selectedFurnished[1],
                      onSelect: (value) {
                        setState(() {
                          selectedFurnished[1] = value;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  getTranslated('properties_status', context),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterSheetChip(
                        label: getTranslated('finished', context),
                        selected: propertyStatuses
                            .contains(getTranslated('finished', context)),
                        onSelect: (value) {
                          setState(() {
                            value
                                ? propertyStatuses
                                    .add(getTranslated('finished', context))
                                : propertyStatuses
                                    .remove(getTranslated('finished', context));
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      FilterSheetChip(
                        label: getTranslated('semi-finished', context),
                        selected: propertyStatuses
                            .contains(getTranslated('semi-finished', context)),
                        onSelect: (value) {
                          setState(() {
                            value
                                ? propertyStatuses.add(
                                    getTranslated('semi-finished', context))
                                : propertyStatuses.remove(
                                    getTranslated('semi-finished', context));
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      FilterSheetChip(
                        label: getTranslated('unfinished', context),
                        selected: propertyStatuses
                            .contains(getTranslated('unfinished', context)),
                        onSelect: (value) {
                          setState(() {
                            value
                                ? propertyStatuses
                                    .add(getTranslated('unfinished', context))
                                : propertyStatuses.remove(
                                    getTranslated('unfinished', context));
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      FilterSheetChip(
                        label: getTranslated('core_shell', context),
                        selected: propertyStatuses
                            .contains(getTranslated('core_shell', context)),
                        onSelect: (value) {
                          setState(() {
                            value
                                ? propertyStatuses
                                    .add(getTranslated('core_shell', context))
                                : propertyStatuses.remove(
                                    getTranslated('core_shell', context));
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    getTranslated('amenities', context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    widget.selectedAmenities.isEmpty
                        ? getTranslated('view_all', context)
                        : widget.selectedAmenities.join(', '),

                    //! widget.categories.isEmpty || widget.categories.length == 6
                    //     ? 'All'
                    //     : widget.categories.join(', '),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: widget.onAmenities,
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    getTranslated('bedrooms', context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    widget.selectedBedrooms.isEmpty
                        ? getTranslated('view_all', context)
                        : widget.selectedBedrooms.join(', '),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: widget.onBedrooms,
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    getTranslated('bathrooms', context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    widget.selectedBathrooms.isEmpty
                        ? getTranslated('view_all', context)
                        : widget.selectedBathrooms.join(', '),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: widget.onBathrooms,
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    getTranslated('levels', context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    widget.selectedLevels.isEmpty
                        ? getTranslated('view_all', context)
                        : widget.selectedLevels.join(', '),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: widget.onLevels,
                ),
                const Divider(),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(getTranslated('clear', context)),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text(getTranslated('apply', context)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
