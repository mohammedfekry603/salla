abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSucessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  String?error;
  RegisterErrorState(this.error);
}
