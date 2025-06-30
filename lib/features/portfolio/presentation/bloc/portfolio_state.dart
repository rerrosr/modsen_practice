part of 'portfolio_bloc.dart';

@immutable
sealed class PortfolioState {
  const PortfolioState();
}

class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

class PortfolioIsLoadingState extends PortfolioState {
  const PortfolioIsLoadingState();
}

class PortfolioIsLoadedState extends PortfolioState {
  final List<CryptoCoinModel> cryptoList;

  const PortfolioIsLoadedState({required this.cryptoList});
}

class PortfolioIsErrorState extends PortfolioState {
  final Object? error;

  const PortfolioIsErrorState({required this.error});
}
