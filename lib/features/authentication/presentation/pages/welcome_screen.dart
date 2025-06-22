import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../../core_ui/core_ui.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _buttonsOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );
    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _textSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _buttonsOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSignIn() {
    // TODO: Navigate to sign in
  }

  void _onSignUp() {
    // TODO: Navigate to sign up
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: CryptoCoinDimens.PADDING_220,
          left: CryptoCoinDimens.PADDING_30,
          right: CryptoCoinDimens.PADDING_30,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeTransition(
                    opacity: _logoOpacityAnimation,
                    child: ScaleTransition(
                      scale: _logoScaleAnimation,
                      child: SvgPicture.asset(
                        AppConstants.logoSvgAsset,
                        width: 107,
                        height: 94,
                      ),
                    ),
                  ),
                  const SizedBox(height: CryptoCoinDimens.HEIGHT_50),
                  SlideTransition(
                    position: _textSlideAnimation,
                    child: FadeTransition(
                      opacity: _buttonsOpacityAnimation,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Welcome to Coinapp',
                            style: context.theme.textTheme.displayLarge
                                ?.copyWith(color: CryptoCoinColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: CryptoCoinDimens.HEIGHT_10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CryptoCoinDimens.PADDING_4,
                            ),
                            child: Text(
                              'All your crypto transactions in one place! Track coins, add portfolios, buy & sell.',
                              style: context.theme.textTheme.bodyLarge
                                  ?.copyWith(
                                    color: CryptoCoinColors.whiteSecondaryColor,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: CryptoCoinDimens.HEIGHT_54),
                ],
              ),
            ),
            FadeTransition(
              opacity: _buttonsOpacityAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: CryptoCoinDimens.WIDTH_187,
                    height: CryptoCoinDimens.HEIGHT_50,
                    child: FilledButton(
                      onPressed: _onSignIn,
                      child: Text(
                        'Sign In',
                        style: context.theme.textTheme.labelLarge?.copyWith(
                          color: CryptoCoinColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: CryptoCoinDimens.HEIGHT_16),
                  SizedBox(
                    width: CryptoCoinDimens.WIDTH_187,
                    height: CryptoCoinDimens.HEIGHT_50,
                    child: OutlinedButton(
                      onPressed: _onSignUp,
                      child: Text(
                        'Sign Up',
                        style: context.theme.textTheme.labelLarge?.copyWith(
                          color: CryptoCoinColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
