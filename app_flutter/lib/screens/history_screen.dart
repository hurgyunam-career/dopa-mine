import 'package:dopa_mine/constants/app_constants.dart';
import 'package:dopa_mine/constants/app_strings.dart';
import 'package:dopa_mine/models/exercise.dart';
import 'package:dopa_mine/models/workout_session.dart';
import 'package:dopa_mine/providers/workout_provider.dart';
import 'package:dopa_mine/widgets/content_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (BuildContext context, WorkoutProvider provider, Widget? child) {
        final Map<String, Exercise> exerciseById = <String, Exercise>{
          for (final Exercise exercise in provider.exercises) exercise.id: exercise,
        };
        final List<WorkoutSession> sessions = provider.sessionHistory;

        return Scaffold(
          appBar: AppBar(title: const Text(AppStrings.historyPageTitle)),
          body: SafeArea(
            child: ContentFrame(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppStrings.historyPageDescription,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppLayout.smallSpacing),
                  Text(
                    AppStrings.prototypeNoSave,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppLayout.mediumSpacing),
                  Expanded(
                    child: sessions.isEmpty
                        ? _MockHistoryCard()
                        : ListView.separated(
                            itemCount: sessions.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: AppLayout.smallSpacing),
                            itemBuilder: (BuildContext context, int index) {
                              final WorkoutSession session = sessions[index];
                              final Exercise? exercise =
                                  exerciseById[session.exerciseId];

                              return Card(
                                child: ListTile(
                                  title: Text(exercise?.name ?? session.exerciseId),
                                  subtitle: Text(
                                    '${_formatDate(session.startTime)} · ${_formatDuration(session.duration)} · ${session.repetitionCount}${AppStrings.repetitionUnit}',
                                  ),
                                  trailing: Text(
                                    '${AppStrings.historyTotalPointsPrefix}${session.pointsAwarded}',
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
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    final String month = date.month.toString().padLeft(2, AppStrings.timePaddingChar);
    final String day = date.day.toString().padLeft(2, AppStrings.timePaddingChar);
    return '${date.year}-$month-$day';
  }

  String _formatDuration(Duration duration) {
    final int minutes = duration.inMinutes.remainder(60);
    final int seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, AppStrings.timePaddingChar)}:${seconds.toString().padLeft(2, AppStrings.timePaddingChar)}';
  }
}

class _MockHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text(AppStrings.historyCardTitle),
        subtitle: const Text('${AppStrings.historyMockDate} · 01:20 · 12회'),
        trailing: const Text('+14'),
      ),
    );
  }
}
