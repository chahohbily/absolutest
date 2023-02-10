abstract class StNewPasswordScreen{}

class StNewPasswordScreenInit extends StNewPasswordScreen{}

class StNewPasswordScreenLoaded extends StNewPasswordScreen{}

class StNewPasswordScreenLoading extends StNewPasswordScreen{}

class StNewPasswordScreenNoAuthError extends StNewPasswordScreen{}

class StNewPasswordScreenNoInternetError extends StNewPasswordScreen {}

class StNewPasswordScreenError extends StNewPasswordScreen{
  final int? error;
  final String? message;
  StNewPasswordScreenError({this.error,this.message});
}
    