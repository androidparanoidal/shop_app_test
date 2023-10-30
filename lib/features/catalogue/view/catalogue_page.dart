import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
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
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Каталог товаров',
          style: TextStyle(
            fontFamily: 'OpenSans_Regular',
            fontSize: 14,
            color: AppColors.darkColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {},
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Каждый день тысячи девушек распаковывают пакеты \nс новинками Lichi и становятся счастливее, ведь \nочевидно, что новое платье может \nизменить день, а с ним и всю жизнь!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'OpenSans_Light',
                        fontSize: 13,
                        color: AppColors.darkColor,
                      ),
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
                              .toggleTheme();
                        },
                      ),
                      const SizedBox(width: 10),
                      ThemeButton(
                        title: 'Светлая тема',
                        icon: const Icon(Icons.sunny),
                        onTapMethod: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
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
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.darkColor,
                          fontFamily: 'OpenSans_Regular',
                        ),
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
                      childAspectRatio: 0.5,
                      crossAxisCount: 2,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.itemsList.aProduct.length,
                    itemBuilder: (context, index) {
                      final productId = state.itemsList.aProduct[index].id;
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(ProductDetailRoute(id: productId));
                          },
                          child: Column(
                            children: [
                              Image.network(state
                                  .itemsList.aProduct[index].photos[0].big),
                              Text(
                                  '${state.itemsList.aProduct[index].price} руб.'),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  state.itemsList.aProduct[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 13),
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
                  children: [
                    const Text(
                      'Товары в данной категории отсутствуют,пожалуйста, выберите другую :(',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'OpenSans_Light',
                        fontSize: 13,
                        color: AppColors.darkColor,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextButton(
                      onPressed: () {
                        _itemsListBloc.add(LoadItemsList(
                            category: dropdownValue.toLowerCase()));
                      },
                      child: const Text('Повторить'),
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
