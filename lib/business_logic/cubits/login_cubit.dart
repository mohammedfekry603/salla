
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/login_states.dart';
import 'package:salla/constant/end_point.dart';
import 'package:salla/data/diohelper/DioHelper.dart';

class LoginCubit extends Cubit<LogintStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final response = await DioHelper.postData(
        url: login,
        data: {
          "email": email,
          "password": password,
        },
      );
      emit(LoginSucessState());
    } catch (error) {
      emit(LoginErrorState(error.toString()));
    }
  }
}
