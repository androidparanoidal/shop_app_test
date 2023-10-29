import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/repository/shop_app/abstract_shop_repository.dart';
import 'package:shop_test/repository/shop_app/models/models.dart';

part 'items_list_event.dart';
part 'items_list_state.dart';

class ItemsListBloc extends Bloc<ItemsListEvent, ItemsListState> {
  ItemsListBloc(this.shopRepository) : super(ItemsListInitial()) {
    on<LoadItemsList>((event, emit) async {
      try {
        if (state is! ItemsListLoaded) {
          emit(ItemsListLoading());
        }
        final itemsList = await shopRepository.getItemsList();
        emit(ItemsListLoaded(itemsList));
      } catch (e) {
        emit(ItemsListLoadingFailure(e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractShopRepository shopRepository;
}
