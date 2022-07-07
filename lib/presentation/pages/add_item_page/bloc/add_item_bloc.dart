import 'package:bidder/data/model/models.dart';
import 'package:bidder/data/repository/bidder_repository.dart';
import 'package:bidder/presentation/pages/authentication/bloc/authentication_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc({
    required this.bidderRepository,
    required this.authenticationBloc,
  }) : super(AddItemState()) {
    on<AddItemCategoryChanged>(_onCategoryChanged);
    on<AddItemNameChanged>(_onNameChanged);
    on<AddItemDescriptionChanged>(_onDescriptionChanged);
    //on<AddItemPhoneChanged>(_onPhoneChanged);
    on<AddItemPriceChanged>(_onPriceChanged);
    on<AddItemAddBidTimeChanged>(_onAddBidTimeChanged);
    on<AddItemBidStartTimeChanged>(_onBidStartTimeChanged);
    on<AddItemBidEndTimeChanged>(_onBidEndTimeChanged);
    on<AddItemSubmitted>(_onSubmitted);
    on<SelectImages>(_onSelectImages);
    on<CategoriesFetched>(_onCategoriesFetched);
  }

  final BidderRepository bidderRepository;
  final AuthenticationBloc authenticationBloc;

  void _onCategoriesFetched(
    CategoriesFetched event,
    Emitter<AddItemState> emit,
  ) async {
    emit(state.copyWith(addItemstatus: AddItemStatus.loading));
    try {
      var categories = await bidderRepository.fetcheCategories();
      emit(state.copyWith(
        categories: categories,
        addItemstatus: AddItemStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(addItemstatus: AddItemStatus.failure));
    }
  }

  void _onCategoryChanged(
    AddItemCategoryChanged event,
    Emitter<AddItemState> emit,
  ) {
    final category = event.category;
    emit(state.copyWith(
      category: category,
    ));
  }

  void _onNameChanged(
    AddItemNameChanged event,
    Emitter<AddItemState> emit,
  ) {
    final name = Name.dirty(event.name);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([
        name,
        state.description,
        state.price,
      ]),
    ));
  }

  void _onDescriptionChanged(
    AddItemDescriptionChanged event,
    Emitter<AddItemState> emit,
  ) {
    final description = Description.dirty(event.description);
    emit(state.copyWith(
      description: description,
      status: Formz.validate([
        state.name,
        description,
        state.price,
      ]),
    ));
  }

  void _onPriceChanged(
    AddItemPriceChanged event,
    Emitter<AddItemState> emit,
  ) {
    final price = Price.dirty(event.price);
    emit(state.copyWith(
      price: price,
      status: Formz.validate([
        state.name,
        state.description,
        price,
      ]),
    ));
  }

  void _onAddBidTimeChanged(
    AddItemAddBidTimeChanged event,
    Emitter<AddItemState> emit,
  ) {
    emit(state.copyWith(
      addBidTime: event.addBidTime,
    ));
  }

  void _onBidStartTimeChanged(
    AddItemBidStartTimeChanged event,
    Emitter<AddItemState> emit,
  ) {
    emit(state.copyWith(
      bidStartTime: DateTime.parse(event.time),
    ));
  }

  void _onBidEndTimeChanged(
    AddItemBidEndTimeChanged event,
    Emitter<AddItemState> emit,
  ) {
    emit(state.copyWith(
      bidEndTime: DateTime.parse(event.time),
    ));
  }

  void _onSubmitted(
    AddItemSubmitted event,
    Emitter<AddItemState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final addNewItem = {
          "images": state.pickedFile,
          'productName': state.name.value,
          'productDescription': state.description.value,
          'productPrice': int.parse(state.price.value),
          if (state.addBidTime == true) ...{
            'bidStartTime': state.bidStartTime.toString(),
            'bidEndTime': state.bidEndTime.toString()
          },
          'category_id': state.category.toString(),
          'user_id': authenticationBloc.state.user!.id.toString(),
        };

        //print(addNewItem);

        await bidderRepository.addItem(addNewItem);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  void _onSelectImages(
    SelectImages event,
    Emitter<AddItemState> emit,
  ) async {
    selectImage();
  }

  void selectImage() async {
    try {
      var pickedFile = (await ImagePicker().pickMultiImage())!;
      emit(state.copyWith(pickedFile: pickedFile));
    } finally {
      print("Unable to open images");
    }
  }
}
