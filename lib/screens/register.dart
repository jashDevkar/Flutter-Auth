import 'package:auth_app/components/input_field.dart';
import 'package:auth_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  AuthService authService = AuthService();

  void register() async {
    ///register user with email and password
    final _email = emailController.text;
    final _password = passwordController.text;
    if (_email != "" &&
        _password != "" &&
        confirmPasswordController.text != "") {
      if (_password != confirmPasswordController.text) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password didnt match'),
            ),
          );
        }
      } else {
        try {
          await authService.register(email: _email, password: _password);
          Navigator.pop(context);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $e'),
              ),
            );
          }
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('All fields are required'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 2.0,
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
                    'Hey user!',
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
                    height: 10.0,
                  ),
                  InputField(
                    inputController: passwordController,
                    labelText: 'Password',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InputField(
                    inputController: confirmPasswordController,
                    labelText: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: const Text(
                      'Register',
                    ),
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
