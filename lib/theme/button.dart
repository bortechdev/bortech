import 'package:flutter/material.dart';

import 'theme_constants.dart';
import 'theme_extensions.dart';

typedef OnPressed = void Function();

class BtButton extends StatefulWidget {
  final Widget child;
  final OnPressed onPressed;
  final bool isFilled;
  final bool isSelected;

  const BtButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.isFilled = false,
    this.isSelected = false,
  }) : super(key: key);

  EdgeInsets get padding => isFilled ? ThemeConstants.filledButtonPadding : EdgeInsets.zero;

  Border? border(BuildContext context) => isFilled ? Border.all(color: context.theme.primaryColor) : null;

  Color? backgroundColor(BuildContext context, bool isHovering) => isFilled ? (isHovering ? null : context.theme.primaryColor) : null;

  TextStyle textStyle(BuildContext context, bool isHovering) => context.theme.textTheme.titleMedium!.copyWith(
        color: isFilled
            ? (isHovering ? context.theme.primaryColor : Colors.white)
            : (isHovering || isSelected ? context.theme.primaryColor : null),
      );

  @override
  State<BtButton> createState() => _BtButtonState();
}

class _BtButtonState extends State<BtButton> {
  bool isHovering = false;

  void _handleEnter() => setState(() => isHovering = true);

  void _handleExit() => setState(() => isHovering = false);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _handleEnter(),
        onExit: (_) => _handleExit(),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: AnimatedDefaultTextStyle(
            duration: ThemeConstants.hoverDuration,
            curve: Curves.ease,
            style: widget.textStyle(context, isHovering),
            child: AnimatedContainer(
              duration: ThemeConstants.hoverDuration,
              curve: Curves.ease,
              decoration: BoxDecoration(
                color: widget.backgroundColor(context, isHovering),
                border: widget.border(context),
              ),
              padding: widget.padding,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
