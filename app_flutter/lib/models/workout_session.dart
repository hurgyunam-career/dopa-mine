class WorkoutSession {
  const WorkoutSession({
    required this.id,
    required this.exerciseId,
    required this.startTime,
    required this.duration,
    required this.repetitionCount,
    required this.isCompleted,
  });

  final String id;
  final String exerciseId;
  final DateTime startTime;
  final Duration duration;
  final int repetitionCount;
  final bool isCompleted;
}
