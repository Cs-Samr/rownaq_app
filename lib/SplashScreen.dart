import 'package:flutter/material.dart'; // Import Flutter Material library
import 'login_page.dart'; // Ensure that login_page.dart is available

// Define the SplashScreen class
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() =>
      _SplashScreenState(); // Create the state for SplashScreen
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Animation controllers and animations for logo and text
  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<double> _fadeAnimation; // Fade animation for logo
  late Animation<Offset> _textSlideAnimation; // Slide animation for text

  @override
  void initState() {
    super.initState();

    // Initialize the logo animation controller
    _logoController = AnimationController(
      vsync: this, // Required for animations
      duration: Duration(seconds: 2),
    );

    // Set up fade animation for logo
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
    );

    // Initialize the text animation controller
    _textController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Set up slide animation for text
    _textSlideAnimation =
        Tween<Offset>(begin: Offset(0, 1.0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    // Start the animations
    _logoController.forward();
    _textController.forward();

    // Navigate to LoginPage after a delay
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var fadeTween =
                Tween(begin: 0.0, end: 1.5); // Fade effect on transition
            return FadeTransition(
                opacity: animation.drive(fadeTween), child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image2 = Image.asset(
      'assets/splache_txt.png', // Load splash text image
      width: 329,
      height: 45,
      fit: BoxFit.contain,
    );

    return Scaffold(
      body: Stack(
        children: [
          // Background image for the splash screen
          Positioned.fill(
            child: Image.asset(
              'assets/background3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Center content (logo and text)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo with fade animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 280), // Space between logo and text
                // Slide transition for the text
                SlideTransition(
                  position: _textSlideAnimation,
                  child: image2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
