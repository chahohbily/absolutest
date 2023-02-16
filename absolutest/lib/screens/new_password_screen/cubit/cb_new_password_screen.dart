import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_new_password_screen.freezed.dart';

class CbNewPasswordScreen extends Cubit<StNewPasswordScreen> {
  CbNewPasswordScreen() : super(const StNewPasswordScreen.loaded());
}

@freezed
abstract class StNewPasswordScreen with _$StNewPasswordScreen {
  const factory StNewPasswordScreen.loading() = _Loading;
  const factory StNewPasswordScreen.error(int? error, String? message) = _Error;
  const factory StNewPasswordScreen.loaded() = _Loaded;
}
