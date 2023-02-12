import 'dart:developer';

import 'package:absolutest/utils/pj_gradients.dart';
import 'package:absolutest/utils/pj_icons.dart';
import 'package:flutter/material.dart';

class PjScaffold extends StatefulWidget {
  final Widget body;
  final bool withWaves;

  const PjScaffold({
    Key? key,
    required this.body,
    this.withWaves = false,
  }) : super(key: key);

  @override
  State<PjScaffold> createState() => _PjScaffoldState();
}

class _PjScaffoldState extends State<PjScaffold> {
  late final bool canPop;

  @override
  void initState() {
    canPop = Navigator.of(context).canPop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: PjGradients.backgroundGradient,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              if (widget.withWaves) ...[
                Positioned(
                  top: -150,
                  left: -100,
                  child: PjIcons().background,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: PjIcons().secondBackground,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: canPop
                        ? GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 32,
                              width: 32,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: PjIcons().backArrow,
                            ),
                            //child: PjIcons().backArrow,
                          )
                        : PjIcons().logo,
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: widget.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
