import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/presentation/pages/view_item_page/view_item_page_layout.dart';
import 'package:flutter/material.dart';

class ViewItemPage extends StatelessWidget {
  final Product product;
  const ViewItemPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewItemPageLayout(
      product: product,
    );
  }
}
