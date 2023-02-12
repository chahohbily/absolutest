abstract class StHomePageScreen{}

class StHomePageScreenInit extends StHomePageScreen{}

class StHomePageScreenLoaded extends StHomePageScreen{}

class StHomePageScreenLoading extends StHomePageScreen{}

class StHomePageScreenNoAuthError extends StHomePageScreen{}

class StHomePageScreenNoInternetError extends StHomePageScreen {}

class StHomePageScreenError extends StHomePageScreen{
  final int? error;
  final String? message;
  StHomePageScreenError({this.error,this.message});
}
    