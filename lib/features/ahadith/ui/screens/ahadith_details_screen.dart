import 'package:arabic_tools/arabic_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_divider.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/model/imam_model.dart';
import '../widgets/custom_imam_app_bar.dart';

class AhadithDetailsScreen extends StatefulWidget {
  const AhadithDetailsScreen({
    super.key,
    required this.title,
    required this.ahadith,
    required this.imamModel,
  });

  final String title;
  final List<String> ahadith;
  final ImamModel imamModel;

  @override
  _AhadithDetailsScreenState createState() => _AhadithDetailsScreenState();
}

class _AhadithDetailsScreenState extends State<AhadithDetailsScreen> {
  late ScrollController _scrollController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void jumpByFive() {
    setState(() {
      _currentIndex = (_currentIndex + 5).clamp(0, widget.ahadith.length - 1);
    });
    _scrollController.animateTo(
      _currentIndex * 150.h, // Estimate item height; adjust as needed
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomImamAppBar(title: widget.title, imamModel: widget.imamModel),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        Arabic_Tools().RemoveTashkeel(widget.ahadith[index]),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                              height: 2,
                              fontFamily: 'Amiri',
                            ),
                      ),
                      Spacing.verticalSpace(10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${AppLocalizations.of(context)!.numberOfHadiths} ${index + 1}',
                        ),
                      ),
                      Spacing.verticalSpace(10),
                      myDivider(AppConstant.deviceWidth(context), 1),
                    ],
                  ),
                );
              },
              childCount: widget.ahadith.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          jumpByFive();
        },
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}
