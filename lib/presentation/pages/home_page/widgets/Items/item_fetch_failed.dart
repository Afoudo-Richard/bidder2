import 'package:bidder/presentation/pages/home_page/widgets/Items/bloc/homeitems_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemFetchFailed extends StatelessWidget {
  const ItemFetchFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Failed to Fetch Products",
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<HomeitemsBloc>(context)
                  .add(const FetchAll(choice: SelectionType.all));
            },
            child: const Text("Reload"),
          ),
        ],
      ),
    );
  }
}
