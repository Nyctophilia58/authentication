import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool get isDarkMode =>
      Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

  void changeTheme() {
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: changeTheme,
              icon: Icon(
                isDarkMode
                    ? Icons.wb_sunny
                    : Icons.nights_stay,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),

            //logo
            Icon(
              Icons.lock,
              size: 100,
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(height: 50),

            //welcome back you've been missed
            Text(
              'Welcome back,You\'ve been missed!',style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            //username textfield
            MyTextField(
              controller: usernameController,
              hint: 'Username',
              obsecureText: false,
              icon: Icon(Icons.person,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 25),

            //password textfield
            MyTextField(
              controller: passwordController,
              hint: 'Password',
              obsecureText: true,
              icon: Icon(Icons.lock,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}