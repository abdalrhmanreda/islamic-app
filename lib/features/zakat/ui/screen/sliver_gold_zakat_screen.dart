import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:muslim_app/config/themes/text_styles.dart';
import 'package:muslim_app/features/home/data/model/feature_model.dart';
import 'package:muslim_app/features/zakat/ui/widgets/notes_part.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../widgets/value_of_zakat.dart';
import '../widgets/zakat_title_and_image.dart';

class SliverGoldZakatScreen extends StatefulWidget {
  const SliverGoldZakatScreen({super.key, required this.featureModel});
  final FeatureModel featureModel;

  @override
  State<SliverGoldZakatScreen> createState() => _SliverGoldZakatScreenState();
}

class _SliverGoldZakatScreenState extends State<SliverGoldZakatScreen> {
  String? goldSelectedValue;
  double zakatValue = 0.0; // To hold calculated zakat value
  TextEditingController gramsController =
      TextEditingController(); // Controller for grams input
  TextEditingController goldValuePriceController =
      TextEditingController(); // Controller for gold value price input
  var formKey = GlobalKey<FormState>();
  List<String> items(context) => [
        AppLocalizations.of(context)!.gold18,
        AppLocalizations.of(context)!.gold21,
        AppLocalizations.of(context)!.gold24,
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ZakatTitleAndImagePart(featureModel: widget.featureModel),
                Spacing.verticalSpace(20),
                if (widget.featureModel.title ==
                    AppLocalizations.of(context)!.goldZakat)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: Text(
                        AppLocalizations.of(context)!.chooseTypeOfGold,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      isExpanded: true,
                      icon: const Icon(
                        IconlyBroken.arrow_down_2,
                        size: 20,
                      ),
                      value: goldSelectedValue,
                      items: items(context).map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          goldSelectedValue = value.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return AppLocalizations.of(context)!.chooseTypeOfGold;
                        }
                        return null;
                      },
                    ),
                  ),
                Spacing.verticalSpace(20),
                TextFormField(
                  controller: gramsController, // Controller for input
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enterNumberOfgrams,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.enterNumberOfgrams;
                    }
                    return null;
                  },
                ),
                Spacing.verticalSpace(15),
                TextFormField(
                  controller: goldValuePriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enterThePrice,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.enterThePrice;
                    }
                    return null;
                  },
                ),
                Spacing.verticalSpace(20),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Ensure gold type is selected
                      if (goldSelectedValue == null &&
                          widget.featureModel.title ==
                              AppLocalizations.of(context)!.goldZakat) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                AppLocalizations.of(context)!.chooseTypeOfGold),
                          ),
                        );
                        return;
                      }

                      // Get grams from user input
                      double grams = double.tryParse(gramsController.text) ?? 0;

                      // Check if grams are above the nisab
                      if (checkNisab(grams, goldSelectedValue)) {
                        // Calculate zakat if grams are above the nisab
                        setState(() {
                          zakatValue = (grams * 0.025) *
                              double.parse(goldValuePriceController
                                  .text); // Zakat is 2.5%
                        });
                      } else {
                        // If below nisab, zakat value is 0
                        setState(() {
                          zakatValue = 0.0;
                        });
                      }
                      if (zakatValue == 0.0) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content:
                                  Text(AppLocalizations.of(context)!.noZakat),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(AppLocalizations.of(context)!.ok),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  text: AppLocalizations.of(context)!.calculateZakat,
                ),
                Spacing.verticalSpace(10),
                ValueOfZakat(zakatValue: zakatValue),
                const NotesPart(
                  isGold: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double getNisab(String? goldType) {
    if (goldType == AppLocalizations.of(context)!.gold18) {
      return 113; // Nisab for 18 carat gold
    } else if (goldType == AppLocalizations.of(context)!.gold21) {
      return 97; // Nisab for 21 carat gold
    } else if (goldType == AppLocalizations.of(context)!.gold24) {
      return 84; // Nisab for 24 carat gold
    } else {
      return 0; // Default case
    }
  }

  bool checkNisab(double grams, String? goldType) {
    double nisab = getNisab(goldType);
    return grams >= nisab;
  }
}
