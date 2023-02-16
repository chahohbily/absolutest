import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_versions_screen.freezed.dart';

class CbVersionsScreen extends Cubit<StVersionsScreen> {
  CbVersionsScreen() : super(const StVersionsScreen.loaded());
}

@freezed
abstract class StVersionsScreen with _$StVersionsScreen {
  const factory StVersionsScreen.loading() = _Loading;
  const factory StVersionsScreen.error(int? error, String? message) = _Error;
  const factory StVersionsScreen.loaded() = _Loaded;
}
    