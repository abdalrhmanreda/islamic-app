import 'package:arabic_tools/arabic_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim_app/core/helpers/extensions.dart';
import 'package:muslim_app/features/ahadith/logic/ahadith_cubit.dart';
import 'package:muslim_app/features/ahadith/logic/ahadith_state.dart';

import '../../../../core/components/progress_indector.dart';
import '../../data/model/imam_model.dart';
import '../widgets/custom_imam_app_bar.dart';
import 'book_hadiths_screen.dart';

class AhadithDetailsScreen extends StatelessWidget {
  const AhadithDetailsScreen({
    super.key,
    required this.title,
    required this.imamModel,
  });

  final String title;
  final ImamModel imamModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AhadithCubit()..getImamBooks(imamModel.immamName),
      child: BlocConsumer<AhadithCubit, AhadithState>(
        listener: (context, state) {
          // Handle state changes if needed
        },
        builder: (context, state) {
          // Extract values to minimize multiple calls to context.read<AhadithCubit>()
          final ahadithCubit = context.read<AhadithCubit>();
          final imamBooks = ahadithCubit.imamBooks;

          // Skip the first index if the bookNumber is "introduction" for specific imams
          final filteredImamBooks = (imamModel.immamName == 'imamMuslim' ||
                  imamModel.immamName == 'imamIbnMajah')
              ? imamBooks
                  .where((book) => book.bookNumber != 'introduction')
                  .toList()
              : imamBooks;

          return Scaffold(
            body: state is Loading && imamBooks.isEmpty
                ? const Center(
                    child: CustomLoadingIndicator(),
                  )
                : CustomScrollView(
                    slivers: [
                      CustomImamAppBar(title: title, imamModel: imamModel),
                      SliverToBoxAdapter(
                        child: Column(
                          children: List.generate(
                            filteredImamBooks.length,
                            (index) {
                              final book = filteredImamBooks[index];
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      // Navigate to the BookHadithsScreen
                                      context.navigateToWidget(
                                          context,
                                          BookHadithsScreen(
                                            hadithsCount: book.numberOfHadith,
                                            bookNumber: book.bookNumber,
                                            title: book.book[1].name,
                                            immamName: imamModel.immamName,
                                          ));
                                    },
                                    title: Text(
                                      Arabic_Tools()
                                          .RemoveTashkeel(book.book[1].name),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      '${book.numberOfHadith} ${AppLocalizations.of(context)!.hadith}',
                                    ),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
