import 'package:bidder/presentation/pages/add_item_page/bloc/add_item_bloc.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/header_user_info.dart';
import 'package:bidder/presentation/pages/user_profile_page/widgets/profile_user_item.dart';
import 'package:bidder/presentation/widgets/custom_button.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/presentation/widgets/custom_input.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:formz/formz.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddItemUserLoggedIn extends StatelessWidget {
  const AddItemUserLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "New item",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            BlocBuilder<AddItemBloc, AddItemState>(
              builder: (context, state) {
                return DropdownButton(
                  items: state.categories
                      .map(
                        (value) => DropdownMenuItem<String>(
                          child: Text(value.name),
                          value: value.id,
                        ),
                      )
                      .toList(),
                  value: state.category.toString(),
                  onChanged: (value) {
                    BlocProvider.of<AddItemBloc>(context)
                        .add(AddItemCategoryChanged(value as String));
                  },
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            BlocBuilder<AddItemBloc, AddItemState>(builder: (context, state) {
              return state.category != "0"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Add Photo",
                              style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            const Text(
                              "First picture - is the title picture.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<AddItemBloc>(context)
                                            .add(SelectImages());
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            child: Icon(
                                              Icons.add,
                                              size: 40,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          const Text(
                                            "Add photo",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ] +
                                  state.pickedFile!.map<Widget>((item) {
                                    return Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 80,
                                      width: 80,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Image(
                                        image: FileImage(
                                          File(item.path),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }).toList(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Text(
                              "Supported format are .jpg, .gif and .png . Picture may not exceed 5MB",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        CustomInput(
                          inputInitialValue: state.name.value,
                          inputHintText: "Name",
                          leading: const Icon(
                            Icons.text_fields,
                            size: 30,
                            color: primaryColor,
                          ),
                          onChanged: (name) =>
                              BlocProvider.of<AddItemBloc>(context)
                                  .add(AddItemNameChanged(name)),
                          inputErrorText:
                              state.name.invalid ? 'invalid Name' : null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        CustomInput(
                          inputMaxLines: 3,
                          inputInitialValue: state.description.value,
                          inputHintText: "Description",
                          leading: const Icon(
                            Icons.book,
                            size: 30,
                            color: primaryColor,
                          ),
                          onChanged: (description) =>
                              BlocProvider.of<AddItemBloc>(context)
                                  .add(AddItemDescriptionChanged(description)),
                          inputErrorText: state.description.invalid
                              ? 'invalid Description'
                              : null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        CustomInput(
                          key: const Key('AddItemForm_PriceInput_textField'),
                          inputInitialValue: state.price.value,
                          inputHintText: "Price*",
                          inputKeyBoardType: TextInputType.number,
                          leading: const Icon(
                            Icons.monetization_on,
                            size: 30,
                            color: primaryColor,
                          ),
                          onChanged: (price) =>
                              BlocProvider.of<AddItemBloc>(context)
                                  .add(AddItemPriceChanged(price)),
                          inputErrorText:
                              state.price.invalid ? 'invalid Price' : null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        Row(
                          children: [
                            Text("Add bid time"),
                            Checkbox(
                                value: state.addBidTime,
                                onChanged: (bool? value) {
                                  if (value != null) {
                                    BlocProvider.of<AddItemBloc>(context)
                                        .add(AddItemAddBidTimeChanged(value));
                                  }
                                })
                          ],
                        ),
                        if (state.addBidTime) ...[
                          Text("Start time"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          DateTimePicker(
                            type: DateTimePickerType.dateTimeSeparate,
                            dateMask: 'd MMM, yyyy',
                            initialValue: state.bidStartTime.toString(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Date',
                            timeLabelText: "Time",
                            onChanged: (val) =>
                                BlocProvider.of<AddItemBloc>(context)
                                    .add(AddItemBidStartTimeChanged(val)),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text("End time"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          DateTimePicker(
                            type: DateTimePickerType.dateTimeSeparate,
                            dateMask: 'd MMM, yyyy',
                            initialValue: state.bidEndTime.toString(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Date',
                            timeLabelText: "Time",
                            selectableDayPredicate: (date) {
                              // Disable weekend days to select from the calendar
                              // if (date.weekday == 6 || date.weekday == 7) {
                              //   return false;
                              // }

                              return true;
                            },
                            onChanged: (val) =>
                                BlocProvider.of<AddItemBloc>(context)
                                    .add(AddItemBidEndTimeChanged(val)),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          )
                        ],
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            backgroundColor: secondaryColor,
                            onPressed: state.status.isValidated
                                ? () {
                                    context
                                        .read<AddItemBloc>()
                                        .add(const AddItemSubmitted());
                                  }
                                : null,
                            child: state.status.isSubmissionInProgress
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "Post Item",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                      ],
                    )
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
