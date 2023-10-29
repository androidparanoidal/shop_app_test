part of 'items_list_bloc.dart';

abstract class ItemsListEvent extends Equatable {}

class LoadItemsList extends ItemsListEvent {
  LoadItemsList({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
