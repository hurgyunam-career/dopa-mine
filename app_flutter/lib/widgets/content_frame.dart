import 'package:flutter/material.dart';
import 'package:dopa_mine/constants/app_constants.dart';

class ContentFrame extends StatelessWidget {
  const ContentFrame({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppLayout.pagePadding),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppLayout.contentMaxWidth),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
