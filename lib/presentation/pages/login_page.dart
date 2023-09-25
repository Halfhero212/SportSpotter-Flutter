import 'package:flutter/material.dart';
import 'package:sportspotter/application/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final AuthService authService;

  LoginPage({required this.authService});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = await widget.authService.signInWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                    );
                    if (user != null) {
                      Navigator.pushNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login failed')),
                      );
                    }
                  }
                },
                child: Text('Login with Email'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final user = await widget.authService.signInWithGoogle();
                  if (user != null) {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Google Login failed')),
                    );
                  }
                },
                child: Text('Login with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
