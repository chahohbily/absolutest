import 'st_project_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CbProjectPageScreen extends Cubit<StProjectPageScreen> {
  CbProjectPageScreen() : super(StProjectPageScreenLoaded());
  
  // Future<void> getData() async {
  // try {
  //     Map<String, dynamic> response =
  //         await Api.get(method: 'method', testMode: true);
  //     emit(StProjectPageScreenLoaded());
  //   } on APIException catch (e) {
  //     emit(StProjectPageScreenError(error: e.code));
  //   }
  // }
}
    