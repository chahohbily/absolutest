import 'package:absolutest/utils/pj_icons.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';

class PjAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PjAppBar({
    Key? key,
    this.title = '',
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        isHomePage = false,
        super(key: key);

  const PjAppBar.homePage({
    Key? key,
    this.title = '',
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        isHomePage = true,
        super(key: key);

  @override
  final Size preferredSize;

  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: preferredSize.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isHomePage)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: PjIcons().backArrow,
                ),
              Text(
                title,
                style: PjTextStyles.interMedium20,
                textAlign: TextAlign.center,
              ),
              if (isHomePage) PjIcons().account else const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
