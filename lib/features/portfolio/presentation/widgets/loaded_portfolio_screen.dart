import 'package:flutter/material.dart';
import '../../domain/models/crypto_coin.dart';
import '../presentation.dart';

class LoadedPortfolioScreen extends StatelessWidget {
  const LoadedPortfolioScreen({super.key, required this.state});

  final PortfolioIsLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: state.cryptoList.length,
            itemBuilder: (BuildContext context, int index) {
              final CryptoCoinModel crypto = state.cryptoList[index];
              return ListTile(
                title: Text(crypto.name),
                subtitle: Text('Price: \$${crypto.name}'),
                trailing: Text('Market Cap: \$${crypto.priceUsd}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
