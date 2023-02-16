import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_builds_screen.freezed.dart';

class CbBuildsScreen extends Cubit<StBuildsScreen> {
  CbBuildsScreen() : super(const StBuildsScreen.loaded());
}

@freezed
abstract class StBuildsScreen with _$StBuildsScreen {
  const factory StBuildsScreen.loading() = _Loading;
  const factory StBuildsScreen.error(int? error, String? message) = _Error;
  const factory StBuildsScreen.loaded() = _Loaded;
}
    