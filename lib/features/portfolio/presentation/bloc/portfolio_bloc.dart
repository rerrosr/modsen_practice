import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetCryptoListUseCase _getCryptoListUseCase;

  PortfolioBloc({required GetCryptoListUseCase getCryptoListUseCase})
    : _getCryptoListUseCase = getCryptoListUseCase,
      super(const PortfolioInitial()) {
    on<GetCryptoListEvent>(_onGetCryptoListEvent);
  }

  FutureOr<void> _onGetCryptoListEvent(
    GetCryptoListEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(const PortfolioIsLoadingState());
    try {
      final List<CryptoCoinModel> cryptoList = await _getCryptoListUseCase
          .execute();
      emit(PortfolioIsLoadedState(cryptoList: cryptoList));
    } catch (e) {
      emit(PortfolioIsErrorState(error: e.toString()));
    }
  }
}
