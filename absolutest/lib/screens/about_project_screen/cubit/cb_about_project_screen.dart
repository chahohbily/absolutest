import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_about_project_screen.freezed.dart';

class CbAboutProjectScreen extends Cubit<StAboutProjectScreen> {
  CbAboutProjectScreen() : super(const StAboutProjectScreen.loaded());
}

@freezed
abstract class StAboutProjectScreen with _$StAboutProjectScreen {
  const factory StAboutProjectScreen.loading() = _Loading;
  const factory StAboutProjectScreen.error(int? error, String? message) = _Error;
  const factory StAboutProjectScreen.loaded() = _Loaded;
}