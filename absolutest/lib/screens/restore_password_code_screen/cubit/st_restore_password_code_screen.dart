abstract class StRestorePasswordCodeScreen{}

class StRestorePasswordCodeScreenInit extends StRestorePasswordCodeScreen{}

class StRestorePasswordCodeScreenLoaded extends StRestorePasswordCodeScreen{}

class StRestorePasswordCodeScreenLoading extends StRestorePasswordCodeScreen{}

class StRestorePasswordCodeScreenNoAuthError extends StRestorePasswordCodeScreen{}

class StRestorePasswordCodeScreenNoInternetError extends StRestorePasswordCodeScreen {}

class StRestorePasswordCodeScreenError extends StRestorePasswordCodeScreen{
  final int? error;
  final String? message;
  StRestorePasswordCodeScreenError({this.error,this.message});
}
    