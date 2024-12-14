import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/states/register_states.dart';
import 'package:salla/constant/end_point.dart';
import 'package:salla/data/diohelper/DioHelper.dart';

class RegisterCubit extends  Cubit<RegisterStates>{
  RegisterCubit (): super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context); 
 

  Future<void> userRegister({
    required String email,
    required String password,
    required String name,
    required String phone
    
     
  }) async {
    emit(RegisterLoadingState());
    try {
      final response = await DioHelper.postData(
        url:register,
        data: {
          'email': email,
          'password': password,
          'name':name,
          'phone':phone
          
        },
      );
      print(response.data);
      emit(RegisterSucessState());
    } catch (error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    }
  }

}