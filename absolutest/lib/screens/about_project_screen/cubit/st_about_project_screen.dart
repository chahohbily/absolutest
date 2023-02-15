abstract class StAboutProjectScreen{}

class StAboutProjectScreenInit extends StAboutProjectScreen{}

class StAboutProjectScreenLoaded extends StAboutProjectScreen{}

class StAboutProjectScreenLoading extends StAboutProjectScreen{}

class StAboutProjectScreenNoAuthError extends StAboutProjectScreen{}

class StAboutProjectScreenNoInternetError extends StAboutProjectScreen {}

class StAboutProjectScreenError extends StAboutProjectScreen{
  final int? error;
  final String? message;
  StAboutProjectScreenError({this.error,this.message});
}
    