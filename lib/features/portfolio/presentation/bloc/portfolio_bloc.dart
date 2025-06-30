import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(const PortfolioInitial()) {
    on<GetCryptoListEvent>(_onGetCryptoListEvent);
  }

  FutureOr<void> _onGetCryptoListEvent(
    GetCryptoListEvent event,
    Emitter<PortfolioState> emit,
  ) {}
}
