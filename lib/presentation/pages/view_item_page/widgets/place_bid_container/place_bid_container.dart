import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/view_item_page/bloc/view_item_bloc_bloc.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceBidContainer extends StatefulWidget {
  const PlaceBidContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<PlaceBidContainer> createState() => _PlaceBidContainerState();
}

class _PlaceBidContainerState extends State<PlaceBidContainer> {
  late TextEditingController amountTextFieldController;

  @override
  void initState() {
    final state = context.read<ViewItemBlocBloc>().state;

    amountTextFieldController =
        TextEditingController(text: state.currentBid.toString());

    super.initState();
  }

  @override
  void dispose() {
    amountTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewItemBlocBloc, ViewItemBlocState>(
      listener: (context, state) {
        if (state.placeBidStatus == PlacebidStatus.success) {
          Navigator.pop(context);
          BlocProvider.of<ViewItemBlocBloc>(context)
              .add(OnFetchBidders(productId: state.product.id));
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Place a Bid',
                    style: TextStyle(
                        fontSize: 30,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            amountTextFieldController.text =
                                (int.parse(amountTextFieldController.text) - 1)
                                    .toString();
                          });
                        },
                        child: CustomContainer(
                          hideShadow: true,
                          color: primaryColor,
                          //alignment: Alignment.center,
                          child: Icon(
                            Icons.remove,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            r"FCFA",
                            style: TextStyle(
                              fontSize: 35,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: amountTextFieldController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.w900,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your bid',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.001,
                          ),
                          BlocBuilder<ViewItemBlocBloc, ViewItemBlocState>(
                            builder: (context, state) {
                              return Text(
                                'Current Bid: FCFA ${state.currentBid}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            amountTextFieldController.text =
                                (int.parse(amountTextFieldController.text) + 1)
                                    .toString();
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            amountTextFieldController.text =
                                (int.parse(amountTextFieldController.text) + 1)
                                    .toString();
                          });
                        },
                        child: CustomContainer(
                          hideShadow: true,
                          color: primaryColor,
                          //alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<ViewItemBlocBloc, ViewItemBlocState>(
                builder: (context, state) {
                  return CustomButton(onPressed: () {
                    BlocProvider.of<ViewItemBlocBloc>(context).add(OnPlaceBid(
                      price: int.parse(
                        amountTextFieldController.value.text,
                      ),
                      productId: state.product.id,
                      userId: BlocProvider.of<AuthenticationBloc>(context)
                              .state
                              .user
                              ?.id ??
                          "",
                    ));
                  }, child: BlocBuilder<ViewItemBlocBloc, ViewItemBlocState>(
                    builder: (context, state) {
                      switch (state.placeBidStatus) {
                        case PlacebidStatus.loading:
                          return CircularProgressIndicator(
                            backgroundColor: primaryColor,
                            color: secondaryColor,
                          );
                        default:
                          return Text(
                            "Place a Bid!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          );
                      }
                    },
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
