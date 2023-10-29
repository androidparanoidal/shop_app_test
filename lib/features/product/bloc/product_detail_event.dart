part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDetails extends ProductDetailEvent {
  const LoadProductDetails({required this.id});

  final int id;

  @override
  List<Object> get props => super.props..add(id);
}
