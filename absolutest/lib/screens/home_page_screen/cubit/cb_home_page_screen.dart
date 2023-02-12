import 'st_home_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CbHomePageScreen extends Cubit<StHomePageScreen> {
  CbHomePageScreen() : super(StHomePageScreenLoaded());
  
  // Future<void> getData() async {
  // try {
  //     Map<String, dynamic> response =
  //         await Api.get(method: 'method', testMode: true);
  //     emit(StHomePageScreenLoaded());
  //   } on APIException catch (e) {
  //     emit(StHomePageScreenError(error: e.code));
  //   }
  // }
}
    