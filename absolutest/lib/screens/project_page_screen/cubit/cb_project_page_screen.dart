import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_project_page_screen.freezed.dart';

class CbProjectPageScreen extends Cubit<StProjectPageScreen> {
  CbProjectPageScreen() : super(const StProjectPageScreen.loaded());
}

@freezed
abstract class StProjectPageScreen with _$StProjectPageScreen {
  const factory StProjectPageScreen.loading() = _Loading;
  const factory StProjectPageScreen.error(int? error, String? message) = _Error;
  const factory StProjectPageScreen.loaded() = _Loaded;
}
    