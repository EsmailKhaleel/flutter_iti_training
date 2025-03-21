import 'package:flutter/material.dart';
import 'package:iti_training/firebase_service/auth.dart';
import 'package:iti_training/screens/produts_layout.dart';
import 'package:iti_training/screens/register.dart';
import 'package:iti_training/widgets/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String? _enteredEmail;
  String? _enteredPassword;
  final auth = Auth();

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  Future<void> _submitLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      await auth.signIn(_enteredEmail!, _enteredPassword!);
      if (!context.mounted) {
        return;
      }
      showSnackBar(context, "Successfully Signed In With: $_enteredEmail");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProductsLayoutScreen(),
      ));
    } catch (e) {
      debugPrint(e.toString());
      if (!context.mounted) {
        return;
      }
      showSnackBar(context, "Failed to Sign In \n$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: _emailValidator,
                  onSaved: (newValue) => _enteredEmail = newValue,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    labelText: 'Password',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  obscureText: !isPasswordVisible,
                  validator: _passwordValidator,
                  onSaved: (newValue) => _enteredPassword = newValue,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _submitLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.onPrimaryFixed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    icon: const Icon(Icons.login_outlined, color: Colors.white),
                    label: const Text("Login",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
