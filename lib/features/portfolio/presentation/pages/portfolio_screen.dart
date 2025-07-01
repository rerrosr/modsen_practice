import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortfolioBloc>(
      create: (BuildContext context) => PortfolioBloc(),
      child: const PortfolioContent(),
    );
  }
}
