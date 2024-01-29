import 'package:flutter/material.dart';
import 'package:tap_journal/shared/breakpoints.dart';

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    this.maxContentWidth = Breakpoint.desktop,
    this.padding = EdgeInsets.zero,
    required this.child,
  });
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: SizedBox(
          width: maxContentWidth,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
