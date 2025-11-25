import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/loginapi.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login 2025',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Map<String, dynamic>? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = user != null ? user!['name'] ?? 'User' : 'User';
    final email = user != null ? user!['email'] ?? '' : '';

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Welcome, $name', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text(email, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SizedBox(
              height: 160,
              child: Image.asset(
               'assets/images/login.png',
               fit: BoxFit.contain,
               ),
              ),
            
              SizedBox(height: 20),


              Text(
                'Welcome',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Sign In to continue',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              SizedBox(height: 26),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
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
                    backgroundColor: Color.fromARGB(255, 174, 185, 24),
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
    );
  }
}
