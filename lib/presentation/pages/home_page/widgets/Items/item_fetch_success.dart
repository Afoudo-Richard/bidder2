import 'package:bidder/presentation/pages/home_page/widgets/Items/bloc/homeitems_bloc.dart';
import 'package:bidder/presentation/pages/home_page/widgets/Items/item.dart';
import 'package:bidder/presentation/pages/view_item_page/view_item_page.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemFetchSuccess extends StatelessWidget {
  const ItemFetchSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeitemsBloc, HomeitemsState>(
        builder: (context, state) {
      return state.products.length == 0
          ? Center(
              child: Text("No products found"),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: paddingSize),
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Item(
                  product: state.products[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ViewItemPage(product: state.products[index]);
                      }),
                    );
                  },
                );
              },
            );
    });
  }
}
