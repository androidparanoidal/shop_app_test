part of 'items_list_bloc.dart';

abstract class ItemsListEvent extends Equatable {}

class LoadItemsList extends ItemsListEvent {
  LoadItemsList({required this.category, this.completer});
  final Completer? completer;
  final String category;

  @override
  List<Object?> get props => [completer, category];

}
