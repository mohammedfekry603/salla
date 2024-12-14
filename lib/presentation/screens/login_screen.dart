import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/business_logic/cubits/login_cubit.dart';
import 'package:salla/business_logic/login_states.dart';
import 'package:salla/constant/app_router.dart';
import 'package:salla/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LogintStates>(
        builder: (context, state) {
          final loginCubit = LoginCubit.get(context);

          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Login now to browse our hot offers",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
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
                      if (state is LoginLoadingState)
                        const Center(child: CircularProgressIndicator())
                      else
                        DefaultButton(
                          text: "LOGIN",
                          onTap: () {
                            loginCubit.userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                        ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, AppRouter.registerRoute);
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Color.fromARGB(255, 212, 68, 114),
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
