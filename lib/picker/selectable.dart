import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Selectable extends StatelessWidget {
  final bool isSelected;
  final Widget child;

  const Selectable({
    Key key,
    @required this.isSelected,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 100);
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: child,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5, top: 5),
              child: AnimatedOpacity(
                duration: duration,
                opacity: isSelected ? 1.0 : 0.0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.accentColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.check,
                      key: Key("checkmark"),
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
