import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_login_screen.freezed.dart';

class CbLoginScreen extends Cubit<StLoginScreen> {
  CbLoginScreen() : super(const StLoginScreen.loaded());
}

@freezed
abstract class StLoginScreen with _$StLoginScreen {
  const factory StLoginScreen.loading() = _Loading;
  const factory StLoginScreen.error(int? error, String? message) = _Error;
  const factory StLoginScreen.loaded() = _Loaded;
}
    