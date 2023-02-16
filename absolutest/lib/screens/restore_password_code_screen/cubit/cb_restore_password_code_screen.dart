import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_restore_password_code_screen.freezed.dart';

class CbRestorePasswordCodeScreen extends Cubit<StRestorePasswordCodeScreen> {
  CbRestorePasswordCodeScreen() : super(const StRestorePasswordCodeScreen.loaded());
}

@freezed
abstract class StRestorePasswordCodeScreen with _$StRestorePasswordCodeScreen {
  const factory StRestorePasswordCodeScreen.loading() = _Loading;
  const factory StRestorePasswordCodeScreen.error(int? error, String? message) = _Error;
  const factory StRestorePasswordCodeScreen.loaded() = _Loaded;
}

    