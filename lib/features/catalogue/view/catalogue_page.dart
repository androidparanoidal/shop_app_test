import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_test/features/catalogue/bloc/items_list_bloc.dart';
import 'package:shop_test/repository/shop_app/abstract_shop_repository.dart';
import 'package:shop_test/theme/app_colors.dart';

import '../../../repository/shop_app/shop_app_repository.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  var items = ['Новинки', 'Платья', 'Юбки', 'Обувь'];
  String dropdownValue = 'Новинки';

  final _itemsListBloc = ItemsListBloc(GetIt.I<AbstractShopRepository>());

  @override
  void initState() {
    _itemsListBloc.add(LoadItemsList());
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
      backgroundColor: AppColors.whiteColor,
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _itemsListBloc.add(LoadItemsList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<ItemsListBloc, ItemsListState>(
          bloc: _itemsListBloc,
          builder: (BuildContext context, state) {
            if (state is ItemsListLoaded) {
              return ListView(
                children: [
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/product', arguments: productId);
                        },
                        child: Column(
                          children: [
                            Image.network(
                                state.itemsList.aProduct[index].photos[0].big),
                            Text(
                                '${state.itemsList.aProduct[index].price} руб.'),
                            Text(state.itemsList.aProduct[index].name),
                            //colors
                          ],
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
                        _itemsListBloc.add(LoadItemsList());
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

      // body: SafeArea(
      //   child: ListView(
      //     children: [
      //       // Container(
      //       //   color: AppColors.whiteColor,
      //       //   child: const Padding(
      //       //     padding: EdgeInsets.all(8.0),
      //       //     child: Text(
      //       //       'Каждый день тысячи девушек распаковывают пакеты \nс новинками Lichi и становятся счастливее, ведь \nочевидно, что новое платье может \nизменить день, а с ним и всю жизнь!',
      //       //       textAlign: TextAlign.center,
      //       //       style: TextStyle(
      //       //         fontFamily: 'OpenSans_Light',
      //       //         fontSize: 13,
      //       //         color: AppColors.darkColor,
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //       // DropdownButtonHideUnderline(
      //       //   child: DropdownButton(
      //       //     value: dropdownValue,
      //       //     icon: const Icon(Icons.expand_more),
      //       //     style: const TextStyle(
      //       //       fontSize: 13,
      //       //       color: AppColors.darkColor,
      //       //       fontFamily: 'OpenSans_Regular',
      //       //     ),
      //       //     items: items.map((String items) {
      //       //       return DropdownMenuItem(
      //       //         value: items,
      //       //         child: Text(items),
      //       //       );
      //       //     }).toList(),
      //       //     onChanged: (String? newValue) {
      //       //       setState(() {
      //       //         dropdownValue = newValue!;
      //       //       });
      //       //     },
      //       //   ),
      //       // ),
      //       // Row(
      //       //   mainAxisAlignment: MainAxisAlignment.center,
      //       //   children: [
      //       //     Container(
      //       //       width: 170,
      //       //       height: 86,
      //       //       decoration: BoxDecoration(
      //       //           color: AppColors.lightColor,
      //       //           borderRadius: BorderRadius.circular(20)),
      //       //       child: const Center(child: Text('Темная тема')),
      //       //     ),
      //       //     const SizedBox(width: 10),
      //       //     Container(
      //       //       width: 170,
      //       //       height: 86,
      //       //       decoration: BoxDecoration(
      //       //           color: AppColors.lightColor,
      //       //           borderRadius: BorderRadius.circular(20)),
      //       //       child: const Center(child: Text('Светлая тема')),
      //       //     ),
      //       //   ],
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
