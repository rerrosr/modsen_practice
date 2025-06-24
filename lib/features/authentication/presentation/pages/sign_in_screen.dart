import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core_ui/theme/crypto_coin_dimens.dart';
import '../bloc/auth/auth_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle hintStyle = TextStyle(color: Color(0xFF9E9E9E));
    const TextStyle textStyle = TextStyle(color: Colors.white);
    const TextStyle headlineStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 36,
      height: 1.2,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            }
            if (state is AuthSuccess) {
              // Navigate after successful authentication.
              context.go(AppRoutes.welcome);
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => context.go(AppRoutes.signUp),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                SvgPicture.asset(
                                  AppConstants.logoSvgAsset,
                                  width: 24,
                                  height: 24,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  context.go(AppRoutes.welcome);
                                }
                              },
                              icon: const Icon(Icons.close, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        const Text("Let's sign\nyou in", style: headlineStyle),
                        const SizedBox(height: 60),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                style: textStyle,
                                cursorColor: Colors.blueAccent,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email address',
                                  hintStyle: hintStyle,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueAccent),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null ||
                                      !RegExp(
                                        r'^[^@]+@[^@]+\.[^@]+',
                                      ).hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordController,
                                style: textStyle,
                                cursorColor: Colors.blueAccent,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                  hintStyle: hintStyle,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueAccent),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null || value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: CryptoCoinDimens.HEIGHT_50,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFF2655FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(
                                  SignInRequested(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                            child: isLoading
                                ? const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                            )
                                : const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
