import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PjIcons {
  final SvgPicture background = SvgPicture.asset(
    'assets/icons/back_icon_first.svg',
    fit: BoxFit.fitHeight,
  );
  final SvgPicture secondBackground =
      SvgPicture.asset('assets/icons/back_icon_second.svg');
  final SvgPicture logo =
  SvgPicture.asset('assets/icons/logo.svg');
}
