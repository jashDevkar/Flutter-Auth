import 'package:auth_app/components/input_field.dart';
import 'package:auth_app/screens/register.dart';
import 'package:auth_app/services/auth_service.dart';
import 'package:auth_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  AuthService authService = AuthService();

  void login() async {
    ///on login button pressed

    final _email = emailController.text;
    final _password = passwordController.text;
    if (_email != "" && _password != "") {
      try {
        await authService.login(email: _email, password: _password);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }
    else{
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All fields are required')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: const Text('Login'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        backgroundColor: const Color(0xffe7f1ff),
        body: Center(
          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(30.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome back!',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputField(
                    inputController: emailController,
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputField(
                    inputController: passwordController,
                    labelText: 'Password',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: const Text(
                      'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: kRegisterSuggestionStyle.copyWith(
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Register())),
                        child: const Text(
                          ' Register',
                          style: kRegisterSuggestionStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
