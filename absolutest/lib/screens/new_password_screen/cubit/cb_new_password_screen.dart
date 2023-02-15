import 'st_new_password_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CbNewPasswordScreen extends Cubit<StNewPasswordScreen> {
  CbNewPasswordScreen() : super(StNewPasswordScreenLoaded());

  Future<void> getData() async {
    // try {
    // Map<String, dynamic> response =
    //     await Api.get(method: 'method', testMode: true);
    // emit(StNewPasswordScreenLoaded());
    //   } on APIException catch (e) {
    //     emit(StNewPasswordScreenError(error: e.code));
    //   }
  }
}
