
// sealed class ForgetpasswordState {}

// final class ForgetpasswordInitial extends ForgetpasswordState {}
// final class SendCodeLoadingState extends ForgetpasswordState {}
// final class SendCodeSucessState extends ForgetpasswordState {
//   final String message;
//   SendCodeSucessState( this.message);
// }

// final class SendCodeError extends ForgetpasswordState {
//   final String message;
//   SendCodeError( this.message);
// }
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ChangeNewPasswordSuffixIcon extends ForgetPasswordState {}

final class ChangeConfirmPasswordSuffixIcon extends ForgetPasswordState {}

final class SendCodeLoading extends ForgetPasswordState {}

final class SendCodeSucess extends ForgetPasswordState {
  final String message;

  SendCodeSucess(this.message);
}

final class SendCodeError extends ForgetPasswordState {
  final String message;

  SendCodeError(this.message);
}

final class ResetPasswordLoading extends ForgetPasswordState {}

final class ResetPassworddeSucess extends ForgetPasswordState {
  final String message;

  ResetPassworddeSucess(this.message);
}

final class ResetPasswordError extends ForgetPasswordState {
  final String message;

  ResetPasswordError(this.message);
}
