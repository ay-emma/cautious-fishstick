import 'package:flutter/material.dart';
import 'package:learn_test/home_view.dart';
import 'package:learn_test/validators.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _passwordKey = const ValueKey("passwordKey");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login view"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                "Hello world",
                style: TextStyle(
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextFormField(
                key: const ValueKey("emailKey"),
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text("email address"),
                ),
                validator: Validator().validateEmail,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                key: _passwordKey,
                controller: passwordController,
                decoration: const InputDecoration(
                    label: Text("Password"),
                    helperText:
                        "Should contain an uppercase, lowercase, a number, and a special character."),
                validator: Validator().validatePassword,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
