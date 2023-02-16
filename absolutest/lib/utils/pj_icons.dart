import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PjIcons {
  final SvgPicture background = SvgPicture.asset(
    'assets/icons/back_icon_first.svg',
    fit: BoxFit.fitHeight,
  );
  final SvgPicture secondBackground =
      SvgPicture.asset('assets/icons/back_icon_second.svg');
  final SvgPicture logo = SvgPicture.asset('assets/icons/logo.svg');
  final SvgPicture backArrow = SvgPicture.asset(
    'assets/icons/back_arrow.svg',
  );
  final SvgPicture errorCircleRounded =
      SvgPicture.asset('assets/icons/error_circle_rounded.svg');
  final SvgPicture nextArrow = SvgPicture.asset('assets/icons/arrow_next.svg');
  final SvgPicture account = SvgPicture.asset('assets/icons/account.svg');
  final SvgPicture plus = SvgPicture.asset('assets/icons/plus.svg');
}
