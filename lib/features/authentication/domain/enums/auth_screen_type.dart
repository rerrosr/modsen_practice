enum AuthScreenType {
  signIn,
  signUp;

  bool get isSignIn => this == AuthScreenType.signIn;
  bool get isSignUp => this == AuthScreenType.signUp;
}
