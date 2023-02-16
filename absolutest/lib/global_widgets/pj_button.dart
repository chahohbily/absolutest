import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_icons.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PjButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isProjectButton;
  final bool withIcon;

  const PjButton({
    Key? key,
    required this.text,
    required this.onTap,
  })  : isProjectButton = false,
        withIcon = false,
        super(key: key);

  const PjButton.project({
    Key? key,
    required this.text,
    required this.onTap,
    this.withIcon = false,
  })  : isProjectButton = true,
        super(key: key);

  @override
  State<PjButton> createState() => _PjButtonState();
}

class _PjButtonState extends State<PjButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      child: IntrinsicHeight(
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: widget.isProjectButton ? 4 : 13),
          decoration: BoxDecoration(
            color: widget.isProjectButton
                ? PjColors.whiteOpacity4
                : PjColors.purple,
            borderRadius:
                BorderRadius.circular(widget.isProjectButton ? 8 : 15),
            border: widget.isProjectButton
                ? Border.all(color: PjColors.purple)
                : null,
            boxShadow: widget.isProjectButton
                ? [
                    const BoxShadow(
                      blurRadius: 10,
                      color: PjColors.shadow,
                    )
                  ]
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.isProjectButton ? 13 : 0,
            ),
            child: Column(
              children: [
                Text(
                  widget.text,
                  style: widget.isProjectButton
                      ? PjTextStyles.abelRegular11
                      : PjTextStyles.abelRegular18
                          .copyWith(color: Colors.white),
                ),
                if (widget.withIcon) ...[
                  const SizedBox(width: 5),
                  PjIcons().plus,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
