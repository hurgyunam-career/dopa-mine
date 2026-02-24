import 'package:dopa_mine/constants/app_constants.dart';
import 'package:dopa_mine/constants/app_strings.dart';
import 'package:dopa_mine/models/exercise.dart';
import 'package:dopa_mine/providers/workout_provider.dart';
import 'package:dopa_mine/screens/history_screen.dart';
import 'package:dopa_mine/screens/session_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (BuildContext context, WorkoutProvider provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appTitle),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const HistoryScreen(),
                    ),
                  );
                },
                tooltip: AppStrings.viewHistory,
                icon: const Icon(Icons.history),
              ),
            ],
          ),
          body: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppLayout.contentMaxWidth,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppLayout.pagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: AppLayout.mediumSpacing),
                      Text(
                        AppStrings.homeHeadline,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppLayout.smallSpacing),
                      Text(
                        AppStrings.homeDescription,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppLayout.smallSpacing),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppLayout.smallSpacing),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(
                            AppLayout.cardRadius / 2,
                          ),
                        ),
                        child: Text(
                          '${AppStrings.prototypeBadge} · ${AppStrings.prototypeNotice}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(height: AppLayout.pagePadding),
                      Expanded(
                        child: ListView.separated(
                          itemCount: provider.exercises.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: AppLayout.smallSpacing),
                          itemBuilder: (BuildContext context, int index) {
                            final Exercise exercise = provider.exercises[index];
                            final bool isSelected =
                                provider.selectedExercise?.id == exercise.id;

                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppLayout.cardRadius,
                                ),
                                side: BorderSide(
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent,
                                  width: AppLayout.selectedBorderWidth,
                                ),
                              ),
                              child: InkWell(
                                onTap: () => provider.selectExercise(exercise),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    AppLayout.pagePadding,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              exercise.name,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.titleMedium,
                                            ),
                                            const SizedBox(
                                              height: AppLayout.itemDescriptionSpacing,
                                            ),
                                            Text(
                                              exercise.description,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: AppLayout.smallSpacing,
                                      ),
                                      Icon(
                                        isSelected
                                            ? Icons.check_circle
                                            : Icons.circle_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: AppLayout.bottomBarInsets,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppLayout.pagePadding,
              ),
              child: SizedBox(
                width: double.infinity,
                height: AppLayout.bottomButtonHeight,
                child: FilledButton(
                  onPressed: provider.selectedExercise == null
                      ? null
                      : () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const SessionScreen(),
                            ),
                          );
                        },
                  child: const Text(AppStrings.startWorkout),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
