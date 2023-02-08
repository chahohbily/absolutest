import 'st_login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CbLoginScreen extends Cubit<StLoginScreen> {
  CbLoginScreen() : super(StLoginScreenLoaded());
  
  // Future<void> getData() async {
  // try {
  //     Map<String, dynamic> response =
  //         await Api.get(method: 'method', testMode: true);
  //     emit(StLoginScreenLoaded());
  //   } on APIException catch (e) {
  //     emit(StLoginScreenError(error: e.code));
  //   }
  // }
}
    