import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core_ui/core_ui.dart';

import '../../domain/domain.dart';
import '../bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.screenType});

  final AuthScreenType screenType;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is AuthFailure) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: CryptoCoinColors.snackBarErrorColor,
                  ),
                );
              }
            }
            if (state is AuthSuccess) {
              context.go(AppRoutes.welcome);
            }
          },
          builder: (BuildContext context, AuthState state) {
            final bool isLoading = state is AuthLoading;
            return CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CryptoCoinDimens.PADDING_24,
                    vertical: CryptoCoinDimens.PADDING_12,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  widget.screenType.isSignIn
                                      ? 'Sign In'
                                      : 'Sign Up',
                                  style: context.theme.textTheme.titleSmall
                                      ?.copyWith(
                                        color: CryptoCoinColors.whiteColor,
                                      ),
                                ),
                                const SizedBox(
                                  width: CryptoCoinDimens.WIDTH_16,
                                ),
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
                              icon: const Icon(
                                Icons.close,
                                color: CryptoCoinColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: CryptoCoinDimens.HEIGHT_50),
                        Text(
                          widget.screenType.isSignIn
                              ? "Let's sign\nyou in"
                              : "Let's create\nyour account",
                          style: context.theme.textTheme.headlineSmall
                              ?.copyWith(color: CryptoCoinColors.whiteColor),
                        ),
                        const SizedBox(height: CryptoCoinDimens.HEIGHT_60),
                        Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                style: context.theme.textTheme.labelLarge,
                                cursorColor: CryptoCoinColors.blueAccentColor,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email address',
                                  hintStyle: context.theme.textTheme.bodyMedium
                                      ?.copyWith(
                                        color: CryptoCoinColors
                                            .greyBackgroundColor,
                                      ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CryptoCoinColors.white24Color,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CryptoCoinColors.blueAccentColor,
                                    ),
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
                              const SizedBox(
                                height: CryptoCoinDimens.HEIGHT_20,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                style: context.theme.textTheme.labelLarge,
                                cursorColor: CryptoCoinColors.blueAccentColor,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  hintStyle: context.theme.textTheme.bodyMedium
                                      ?.copyWith(
                                        color: CryptoCoinColors
                                            .greyBackgroundColor,
                                      ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CryptoCoinColors.white24Color,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CryptoCoinColors.blueAccentColor,
                                    ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: CryptoCoinDimens.PADDING_24,
                      vertical: CryptoCoinDimens.PADDING_12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (!widget.screenType.isSignIn)
                          Text(
                            'By signing up you accept the Terms of Service & Privacy Policy.',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: CryptoCoinColors.whiteSecondaryColor,
                            ),
                          ),
                        const SizedBox(height: CryptoCoinDimens.HEIGHT_16),
                        SizedBox(
                          width: double.infinity,
                          height: CryptoCoinDimens.HEIGHT_50,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  CryptoCoinColors.blueButtonColorDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  CryptoCoinDimens.BORDER_RADIUS_15,
                                ),
                              ),
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      if (widget.screenType.isSignIn) {
                                        context.read<AuthBloc>().add(
                                          SignInRequested(
                                            email: _emailController.text.trim(),
                                            password: _passwordController.text
                                                .trim(),
                                          ),
                                        );
                                      } else {
                                        context.read<AuthBloc>().add(
                                          SignUpRequested(
                                            email: _emailController.text.trim(),
                                            password: _passwordController.text
                                                .trim(),
                                          ),
                                        );
                                      }
                                    }
                                  },
                            child: isLoading
                                ? const Center(
                                    child: SizedBox(
                                      width: CryptoCoinDimens.HEIGHT_24,
                                      height: CryptoCoinDimens.HEIGHT_24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              CryptoCoinColors.whiteColor,
                                            ),
                                      ),
                                    ),
                                  )
                                : Text(
                                    widget.screenType.isSignIn
                                        ? 'Sign In'
                                        : 'Sign Up',
                                    style: context.theme.textTheme.labelLarge
                                        ?.copyWith(
                                          color: CryptoCoinColors.whiteColor,
                                        ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: CryptoCoinDimens.HEIGHT_20),
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
