import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../../assets/svg/logo.svg';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showButtons = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward().whenComplete(() {
      setState(() {
        _showButtons = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSignUp() {
    // TODO: Navigate to sign up
  }

  void _onSignIn() {
    // TODO: Navigate to sign in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation,
              child: ScaleTransition(
                scale: _animation,
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            const SizedBox(height: 40),
            AnimatedOpacity(
              opacity: _showButtons ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: _showButtons
                  ? Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: _onSignUp,
                            child: const Text('Sign Up'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 200,
                          child: OutlinedButton(
                            onPressed: _onSignIn,
                            child: const Text('Sign In'),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
