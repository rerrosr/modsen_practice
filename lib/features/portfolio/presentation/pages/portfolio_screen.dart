import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../features.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortfolioBloc>(
      create: (BuildContext context) => PortfolioBloc(
        getCryptoListUseCase: appLocator<GetCryptoListUseCase>(),
      )..add(const GetCryptoListEvent()),
      child: const PortfolioContent(),
    );
  }
}
