import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/repository/shop_app/abstract_shop_repository.dart';
import '../../../repository/shop_app/models/product_model.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(this.shopRepository) : super(const ProductDetailState()) {
    on<LoadProductDetails>(_load);
  }

  final AbstractShopRepository shopRepository;

  Future<void> _load(
    LoadProductDetails event,
    Emitter<ProductDetailState> emit,
  ) async {
    try {
      if (state is! ProductDetailLoaded) {
        emit(const ProductDetailLoading());
      }

      final itemDetails = await shopRepository.getItemDetail(event.id);

      emit(ProductDetailLoaded(itemDetails));
    } catch (e) {
      emit(ProductDetailLoadingFailure(e));
    }
  }
}
