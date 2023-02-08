abstract class StLoginScreen{}

class StLoginScreenInit extends StLoginScreen{}

class StLoginScreenLoaded extends StLoginScreen{}

class StLoginScreenLoading extends StLoginScreen{}

class StLoginScreenNoAuthError extends StLoginScreen{}

class StLoginScreenNoInternetError extends StLoginScreen {}

class StLoginScreenError extends StLoginScreen{
  final int? error;
  final String? message;
  StLoginScreenError({this.error,this.message});
}
    