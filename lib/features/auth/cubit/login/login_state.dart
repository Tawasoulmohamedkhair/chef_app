sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginloadingState extends LoginState {}

final class LoginSucessState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}

final class ChangeLoginPasswordSuffixIcon extends LoginState {}
