import 'st_about_project_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CbAboutProjectScreen extends Cubit<StAboutProjectScreen> {
  CbAboutProjectScreen() : super(StAboutProjectScreenLoaded());
  
  // Future<void> getData() async {
  // try {
  //     Map<String, dynamic> response =
  //         await Api.get(method: 'method', testMode: true);
  //     emit(StAboutProjectScreenLoaded());
  //   } on APIException catch (e) {
  //     emit(StAboutProjectScreenError(error: e.code));
  //   }
  // }
}
    