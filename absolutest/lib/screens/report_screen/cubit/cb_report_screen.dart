import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cb_report_screen.freezed.dart';

class CbReportScreen extends Cubit<StReportScreen> {
  CbReportScreen() : super(const StReportScreen.loaded());
}

@freezed
abstract class StReportScreen with _$StReportScreen {
  const factory StReportScreen.loading() = _Loading;
  const factory StReportScreen.error(int? error, String? message) = _Error;
  const factory StReportScreen.loaded() = _Loaded;
}