part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState();
  @override
  List<Object?> get props => [];
}

//class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  const ProductDetailLoaded(this.item);
  final AData item;

  @override
  List<Object?> get props => [item];
}

class ProductDetailLoadingFailure extends ProductDetailState {
  const ProductDetailLoadingFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
