import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shop_test/features/catalogue/bloc/items_list_bloc.dart';
import 'package:shop_test/repository/shop_app/abstract_shop_repository.dart';
import 'package:shop_test/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shop_test/theme/theme_provider.dart';
import '../../../router/router.dart';
import '../widgets/theme_button.dart';

@RoutePage()
class CataloguePage extends StatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  var items = ['New', 'Dresses', 'Skirts', 'Shoes'];
  String dropdownValue = 'New';

  final _itemsListBloc = ItemsListBloc(GetIt.I<AbstractShopRepository>());

  @override
  void initState() {
    _itemsListBloc.add(LoadItemsList(category: dropdownValue.toLowerCase()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Каталог товаров',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(CartRoute());
              },
              child: Container(
                width: 78,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: AppColors.darkColor),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 21,
                        fontFamily: 'OpenSans_Regular',
                      ),
                    ),
                    Icon(
                      Icons.shopping_bag_rounded,
                      color: AppColors.whiteColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _itemsListBloc.add(LoadItemsList(
              completer: completer, category: dropdownValue.toLowerCase()));
          return completer.future;
        },
        child: BlocBuilder<ItemsListBloc, ItemsListState>(
          bloc: _itemsListBloc,
          builder: (BuildContext context, state) {
            if (state is ItemsListLoaded) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: Text(
                      'Каждый день тысячи девушек распаковывают пакеты с новинками Lichi и становятся счастливее, ведь очевидно, что новое платье может изменить день, а с ним и всю жизнь!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ThemeButton(
                        title: 'Темная тема',
                        icon: const Icon(CupertinoIcons.moon_fill),
                        onTapMethod: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .turnDarkTheme();
                        },
                      ),
                      const SizedBox(width: 10),
                      ThemeButton(
                        title: 'Светлая тема',
                        icon: const Icon(Icons.sunny),
                        onTapMethod: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .turnLightTheme();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: const Icon(Icons.expand_more),
                        style: Theme.of(context).textTheme.labelMedium,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            _itemsListBloc.add(LoadItemsList(
                                category: dropdownValue.toLowerCase()));
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.48,
                      crossAxisCount: 2,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.itemsList.aProduct.length,
                    itemBuilder: (context, index) {
                      final productId = state.itemsList.aProduct[index].id;
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(ProductDetailRoute(id: productId));
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(state
                                    .itemsList.aProduct[index].photos[0].big),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                    '${state.itemsList.aProduct[index].price} руб.',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Text(
                                  state.itemsList.aProduct[index].name,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              //colors
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            }
            if (state is ItemsListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Произошла ошибка, пожалуйста повторите позднее',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        _itemsListBloc.add(LoadItemsList(
                            category: dropdownValue.toLowerCase()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 65,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Повторить',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
