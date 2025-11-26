import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/loginmodel.dart';
import 'home.dart';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
             SizedBox(
              child: Image.asset(
               'assets/images/background.png',
               fit: BoxFit.cover,
               ),
              ),
            
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
              color: Colors.black.withOpacity(0.2),
        ),
      ),
       Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(
              height: 120,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain
              ),
             ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Sign In to continue',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 26),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  hoverColor: Colors.white,
                  fillColor: const Color.fromARGB(155, 255, 255, 255),
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  hoverColor: Colors.white,
                  fillColor: const Color.fromARGB(155, 255, 255, 255),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () async {
                    final username = _usernameController.text.trim();
                    final password = _passwordController.text.trim();

                    // simple validation
                    if (username.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enter username and password')),
                      );
                      return;
                    }

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => const Center(child: CircularProgressIndicator()),
                    );

                    final resp = await mockLogin(username, password);

                    Navigator.of(context).pop(); // remove loading

                    if (resp['success'] == true) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomePage(user: resp['user'])),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(resp['message'] ?? 'Login failed')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 125, 172, 82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26),
              Center(
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF87879D),
                    ),
                  ),
              ),
              SizedBox(height: 10),
              Center(
   child: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () async {
          final url = Uri.parse('https://accounts.google.com/signin');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not open Google')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0), 
          child: Image.asset('assets/images/icon.png', width: 20, height: 20),
        ),
      ),
    ),
    const SizedBox(width: 12),
    Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () async {
          final url = Uri.parse('https://www.facebook.com/login.php');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not open Facebook')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/fb.png', width: 20, height: 20),
        ),
      ),
    ),
  ],
),
     
              ),
            ],
          ),
        ),
      ),
      ],
    ),
    );
  }
}
