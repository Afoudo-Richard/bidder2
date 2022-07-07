import 'package:bidder/presentation/pages/add_item_page/bloc/add_item_bloc.dart';
import 'package:bidder/presentation/pages/home_page/widgets/Items/bloc/homeitems_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailedToFetch extends StatelessWidget {
  const FailedToFetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Failed to fetch data",
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<AddItemBloc>(context).add(CategoriesFetched());
            },
            child: const Text("Reload"),
          ),
        ],
      ),
    );
  }
}
