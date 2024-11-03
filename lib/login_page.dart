import 'package:flutter/material.dart'; // Import Flutter's Material Design library
import 'profile_page.dart'; // Import the profile page file

// Define the Login Page widget as a stateful widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() =>
      _LoginPageState(); // Create the login page state
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Form key to validate input
  final TextEditingController _usernameController =
      TextEditingController(); // Controller for username input
  final TextEditingController _passwordController =
      TextEditingController(); // Controller for password input
  bool _isPasswordVisible = false; // Track password visibility

  @override
  void dispose() {
    // Free up resources when closing the page
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Function to handle login
    if (_formKey.currentState!.validate()) {
      // Check if input is valid
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                profilePage()), // Navigate to the profile page
      );
    }
  }

  void _socialLogin(String platform) {
    // Function to handle social media login
    print('Logging in with $platform'); // Print the selected platform
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            // Background image covering the whole screen
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            // Allow vertical scrolling
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Container(
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'), // App logo
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'اسم المستخدم', // "Username" label
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _usernameController,
                            style: TextStyle(color: Colors.white),
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              hintText:
                                  'أدخل اسم المستخدم', // "Enter username" hint
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              filled: true,
                              fillColor: Color(0xFF1B0452).withOpacity(0.2),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFF5333A1), width: 0.3),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFF5333A1), width: 0.3),
                              ),
                              suffixIcon:
                                  Icon(Icons.person, color: Colors.white),
                              errorStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال اسم المستخدم'; // Error if empty
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'كلمة المرور', // "Password" label
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _passwordController,
                            obscureText:
                                !_isPasswordVisible, // Hide/show password
                            style: TextStyle(color: Colors.white),
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              hintText:
                                  'أدخل كلمة المرور', // "Enter password" hint
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              filled: true,
                              fillColor: Color(0xFF1B0452).withOpacity(0.2),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFF5333A1), width: 0.3),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFF5333A1), width: 0.3),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible =
                                        !_isPasswordVisible; // Toggle password visibility
                                  });
                                },
                              ),
                              suffixIcon:
                                  Icon(Icons.vpn_key, color: Colors.white),
                              errorStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال كلمة المرور'; // Error if empty
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                print('Forgot password clicked');
                              },
                              child: Text(
                                'هل نسيت كلمة المرور؟', // "Forgot password?" text
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                      ),
                      child: Text(
                        'تسجيل الدخول', // "Login" button text
                        style: TextStyle(
                            color: Color(0xFF5D3670),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'أو', // "Or" text
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => _socialLogin('Google'),
                          child: Image.asset(
                            'assets/google_icon.png',
                            width: 55,
                            height: 55,
                          ),
                        ),
                        InkWell(
                          onTap: () => _socialLogin('Facebook'),
                          child: Image.asset(
                            'assets/facebook_icon.png',
                            width: 55,
                            height: 55,
                          ),
                        ),
                        InkWell(
                          onTap: () => _socialLogin('Apple'),
                          child: Image.asset(
                            'assets/apple_icon.png',
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        print('Navigate to registration screen');
                      },
                      child: Text(
                        'ليس لديك حساب ؟ تسجيل', // "No account? Register" text
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
