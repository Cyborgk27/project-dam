import 'package:flutter/material.dart';
import 'package:rpos/presentation/pages/widgets/input_decoration.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Datos quemados para validación
  final String _validEmail = 'test@example.com';
  final String _validPassword = 'password123';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: StyleInputDecoration.inputDecoration(
                hintText: 'test@example.com',
                labelText: 'Email',
                icon: const Icon(Icons.alternate_email)),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: StyleInputDecoration.inputDecoration(
                hintText: '********',
                labelText: 'Password',
                icon: const Icon(Icons.lock)),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, 'navbar');
              setState(() {});
            },
            child: const Text('Sign Ing'),
          ),
        ],
      ),
    );
  }
}
