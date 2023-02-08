import 'st_restore_password_code_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CbRestorePasswordCodeScreen extends Cubit<StRestorePasswordCodeScreen> {
  CbRestorePasswordCodeScreen() : super(StRestorePasswordCodeScreenLoaded());
  
  // Future<void> getData() async {
  // try {
  //     Map<String, dynamic> response =
  //         await Api.get(method: 'method', testMode: true);
  //     emit(StRestorePasswordCodeScreenLoaded());
  //   } on APIException catch (e) {
  //     emit(StRestorePasswordCodeScreenError(error: e.code));
  //   }
  // }
}
    