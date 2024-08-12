import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/methods/url_lunch/url_lunch.dart';
import '../../data/model/imam_model.dart';

class CustomImamAppBar extends StatelessWidget {
  const CustomImamAppBar({
    super.key,
    required this.title,
    required this.imamModel,
  });

  final String title;
  final ImamModel imamModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.kWhiteColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.kWhiteColor,
              fontSize: 20,
            ),
      ),
      centerTitle: true,
      expandedHeight: AppConstant.deviceHeight(context) / 3,
      backgroundColor: AppColors.kPrimaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  imamModel.brief,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.kWhiteColor,
                        fontSize: 14,
                      ),
                ),
                Spacing.verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.forMoreInformation} $title',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.kWhiteColor,
                            fontSize: 14,
                          ),
                    ),
                    TextButton(
                      onPressed: () async {
                        launchUrlMethod(link: imamModel.link);
                      },
                      child: Text(AppLocalizations.of(context)!.clickHere,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.kWhiteColor,
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: Container(
          height: 25, // adjust the height if needed
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
