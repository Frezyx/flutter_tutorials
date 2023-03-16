part of 'crypto_coin_details_bloc.dart';

class CryptoCoinDetailsState extends Equatable {
  const CryptoCoinDetailsState();

  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {
  const CryptoCoinDetailsLoading();
}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
  const CryptoCoinDetailsLoaded(this.coinDetails);

  final CryptoCoinDetail coinDetails;

  @override
  List<Object?> get props => [coinDetails];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailsState {
  const CryptoCoinDetailsLoadingFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
