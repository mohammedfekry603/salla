import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/cubits/register_cubit.dart';
import 'package:salla/business_logic/states/register_states.dart';
import 'package:salla/constant/app_router.dart';
import 'package:salla/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {

            }, builder: (BuildContext context, state) { var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Register now to browse our hot offers",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DefaultTextFormField(
                        hint: "name...",
                        prefixIcon: Icons.person_outline,
                        controller: nameController,
                      ),
                      const SizedBox(height: 10),
                      DefaultTextFormField(
                        hint: "phone...",
                        prefixIcon: Icons.phone_android_outlined,
                        controller: phoneController,
                      ),
                      const SizedBox(height: 10),
                      DefaultTextFormField(
                        hint: "email...",
                        prefixIcon: Icons.email_outlined,
                        controller: emailController,
                      ),
                      const SizedBox(height: 13),
                      DefaultTextFormField(
                        hint: 'password...',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 30),
                      if (state is RegisterLoadingState)
                        const Center(child: CircularProgressIndicator())
                      else
                        DefaultButton(
                          text: "REGISTER",
                          onTap: () {
                            cubit.userRegister(
                              email: emailController.text,
                              password: passwordController.text,
                               name:nameController.text ,
                               phone: phoneController.text
                               
                            );
                          },
                        ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(" have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context,AppRouter.loginRoute);
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                color:Color.fromARGB(255, 212, 68, 114),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

 

          