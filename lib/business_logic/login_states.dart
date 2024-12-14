abstract class LogintStates {}
class LoginInitialState extends LogintStates{}
class LoginLoadingState extends LogintStates{}
class LoginSucessState extends LogintStates{}
class LoginErrorState extends LogintStates{
  String?error;
  LoginErrorState(this.error);
}
