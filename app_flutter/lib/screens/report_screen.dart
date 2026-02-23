import 'package:flutter/material.dart';

import 'package:dopa_mine/constants/app_constants.dart';
import 'package:dopa_mine/constants/app_strings.dart';
import 'package:dopa_mine/models/exercise.dart';
import 'package:dopa_mine/models/workout_session.dart';
import 'package:dopa_mine/widgets/content_frame.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({
    super.key,
    required this.exercise,
    required this.session,
    required this.points,
  });

  final Exercise exercise;
  final WorkoutSession session;
  final int points;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${widget.points}${AppStrings.pointRewardSuffix}'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.reportTitle)),
      body: SafeArea(
        child: ContentFrame(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppStrings.reportDone,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppLayout.mediumSpacing),
              Text('${AppStrings.reportExercisePrefix}${widget.exercise.name}'),
              Text(
                '${AppStrings.reportDurationPrefix}${_formatDuration(widget.session.duration)}',
              ),
              Text(
                '${AppStrings.reportCountPrefix}${widget.session.repetitionCount}${AppStrings.repetitionUnit}',
              ),
              Text('${AppStrings.reportPointPrefix}${widget.points}'),
              const Spacer(),
            ],
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
              onPressed: () {
                Navigator.of(context).popUntil((Route<dynamic> route) {
                  return route.isFirst;
                });
              },
              child: const Text(AppStrings.goHome),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final int minutes = duration.inMinutes.remainder(60);
    final int seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, AppStrings.timePaddingChar)}:${seconds.toString().padLeft(2, AppStrings.timePaddingChar)}';
  }
}
