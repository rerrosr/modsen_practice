import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({super.key});

  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio')),
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (BuildContext context, PortfolioState state) {
          return switch (state) {
            PortfolioInitial() => const LoadingIndicator(),
            PortfolioIsLoadingState() => const LoadingIndicator(),
            PortfolioIsLoadedState() => LoadedPortfolioScreen(state: state),
            PortfolioIsErrorState() => ErrorScreen(onPressed: () {}),
          };
        },
      ),
    );
  }
}
