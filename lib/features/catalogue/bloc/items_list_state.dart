part of 'items_list_bloc.dart';

abstract class ItemsListState extends Equatable {}

class ItemsListInitial extends ItemsListState {
  @override
  List<Object?> get props => [];
}

class ItemsListLoading extends ItemsListState {
  @override
  List<Object?> get props => [];
}

class ItemsListLoaded extends ItemsListState {
  ItemsListLoaded(this.itemsList);
  final ItemsList itemsList;

  @override
  List<Object?> get props => [itemsList];
}

class ItemsListLoadingFailure extends ItemsListState {
  ItemsListLoadingFailure(this.exception);
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
