import 'dart:io';

/// 커밋 전 TODO 동기화 + 상태 정합성 검사 스크립트를 순서대로 실행합니다.
/// 하나라도 실패하면 exit 1로 종료합니다.
///
/// 실행 순서:
/// 1. sync_docs_todo_progress (docs/TODO.md 진행률 동기화)
/// 2. check_lf_line_endings
/// 3. check_navigation_routes_sync
/// 4. check_project_state_sync
/// 5. check_todo_progress_sync
const List<String> kCheckScripts = <String>[
  'tools/sync_docs_todo_progress.dart',
  'tools/check_lf_line_endings.dart',
  'tools/check_navigation_routes_sync.dart',
  'tools/check_project_state_sync.dart',
  'tools/check_todo_progress_sync.dart',
];

Future<void> main() async {
  final String projectRoot = Directory.current.path;
  final String dart = Platform.executable;

  int failed = 0;
  for (final String script in kCheckScripts) {
    final String scriptPath = '$projectRoot${Platform.pathSeparator}${script.replaceAll('/', Platform.pathSeparator)}';
    stdout.writeln('--- $script ---');
    final ProcessResult result = await Process.run(
      dart,
      <String>['run', scriptPath],
      runInShell: false,
      workingDirectory: projectRoot,
    );

    if (result.stdout.toString().trim().isNotEmpty) {
      stdout.write(result.stdout);
    }
    if (result.stderr.toString().trim().isNotEmpty) {
      stderr.write(result.stderr);
    }

    if (result.exitCode != 0) {
      failed++;
      stderr.writeln('$script exited with ${result.exitCode}');
    }
    stdout.writeln('');
  }

  if (failed > 0) {
    stderr.writeln('run_commit_checks: $failed check(s) failed.');
    exit(1);
  }
  stdout.writeln('run_commit_checks: all checks passed.');
}
