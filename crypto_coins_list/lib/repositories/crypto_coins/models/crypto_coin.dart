import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
  });

  final String name;
  final double priceInUSD;
  final String imageUrl;

  @override
  List<Object> get props => [name, priceInUSD, imageUrl];
}
