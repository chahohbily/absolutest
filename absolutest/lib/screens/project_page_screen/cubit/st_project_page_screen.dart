abstract class StProjectPageScreen{}

class StProjectPageScreenInit extends StProjectPageScreen{}

class StProjectPageScreenLoaded extends StProjectPageScreen{}

class StProjectPageScreenLoading extends StProjectPageScreen{}

class StProjectPageScreenNoAuthError extends StProjectPageScreen{}

class StProjectPageScreenNoInternetError extends StProjectPageScreen {}

class StProjectPageScreenError extends StProjectPageScreen{
  final int? error;
  final String? message;
  StProjectPageScreenError({this.error,this.message});
}
    