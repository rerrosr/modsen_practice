part of 'portfolio_bloc.dart';

@immutable
sealed class PortfolioEvent {
  const PortfolioEvent();
}

class GetCryptoListEvent extends PortfolioEvent {
  const GetCryptoListEvent();
}
