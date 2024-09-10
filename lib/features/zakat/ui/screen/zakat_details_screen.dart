import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:muslim_app/config/colors/app_colors.dart';
import 'package:muslim_app/core/components/custom_button.dart';
import 'package:muslim_app/core/constant/app_constant.dart';
import 'package:muslim_app/core/helpers/spacing.dart';
import 'package:muslim_app/core/methods/app_functions/app_functions.dart';
import 'package:muslim_app/features/home/data/model/feature_model.dart';
import 'package:muslim_app/features/zakat/ui/widgets/value_of_zakat.dart';

import '../widgets/notes_part.dart';
import '../widgets/zakat_title_and_image.dart';

class ZakatMoneyDetailsScreen extends StatefulWidget {
  const ZakatMoneyDetailsScreen({super.key, required this.featureModel});
  final FeatureModel featureModel;

  @override
  State<ZakatMoneyDetailsScreen> createState() =>
      _ZakatMoneyDetailsScreenState();
}

class _ZakatMoneyDetailsScreenState extends State<ZakatMoneyDetailsScreen> {
  List<String> items(context) => [
        AppLocalizations.of(context)!.moneySave,
        AppLocalizations.of(context)!.bankMoney,
      ];
  String? moneySelectedValue;
  var moneyValueController = TextEditingController();
  var goldValuePriceController = TextEditingController();
  double zakatValue = 0.0;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ZakatTitleAndImagePart(featureModel: widget.featureModel),
                Spacing.verticalSpace(20),
                SizedBox(
                  width: AppConstant.deviceWidth(context) * .8,
                  child: DropdownButton(
                    hint: Text(
                      AppLocalizations.of(context)!.chooseTypeOfIncome,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    value: moneySelectedValue,
                    icon: const Icon(
                      IconlyBroken.arrow_down_2,
                      size: 20,
                      color: AppColors.kPrimaryColor,
                    ),
                    items: items(context)
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        moneySelectedValue = value.toString();
                      });
                    },
                  ),
                ),
                Spacing.verticalSpace(20),
                TextFormField(
                  controller: moneyValueController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enterTheAcullValue,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.enterTheAcullValue;
                    }
                    return null;
                  },
                ),
                Spacing.verticalSpace(20),
                if (moneySelectedValue ==
                    AppLocalizations.of(context)!.bankMoney)
                  TextFormField(
                    controller: goldValuePriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.goldPrice,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.enterThePrice;
                      }
                      return null;
                    },
                  ),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      double nisabThreshold = moneySelectedValue ==
                              AppLocalizations.of(context)!.moneySave
                          ? 20000
                          : 85 * double.parse(goldValuePriceController.text);
                      setState(() {
                        zakatValue = AppFunctions.calculateZakat(
                            double.parse(moneyValueController.text),
                            nisabThreshold);
                      });
                      if (AppFunctions.calculateZakat(
                              double.parse(moneyValueController.text),
                              nisabThreshold) ==
                          0) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(AppLocalizations.of(context)!.zakat),
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
                          ),
                        );
                      }
                    }
                  },
                  text: AppLocalizations.of(context)!.calculateZakat,
                ),
                Spacing.verticalSpace(10),
                ValueOfZakat(zakatValue: zakatValue),
                Spacing.verticalSpace(20),
                const NotesPart(
                  isGold: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
