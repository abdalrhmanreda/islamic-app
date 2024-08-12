import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:muslim_app/core/helpers/extensions.dart';

import '../../../../config/colors/app_colors.dart';
import '../../data/models/aya_tafseer_model.dart';
import '../../logic/tafseer_cubit.dart';
import '../screens/tafseer_share.dart';

class RowAction extends StatelessWidget {
  const RowAction({
    super.key,
    required this.ayaTafseer,
  });

  final Result ayaTafseer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TafseerCubit, TafseerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            Transform.rotate(
              angle: -45,
              child: IconButton(
                onPressed: () {
                  context.navigateToWidget(
                    context,
                    ShareTafseer(ayaTafseer: ayaTafseer),
                  );
                },
                icon: const Icon(Iconsax.direct_right_outline),
              ),
            ),
            IconButton(
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: ayaTafseer.translation!));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context)!.copyTextInClipBoard,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.kWhiteColor),
                      ),
                    ),
                  );
                },
                icon: const Icon(Iconsax.copy_outline)),
          ],
        );
      },
    );
  }
}
