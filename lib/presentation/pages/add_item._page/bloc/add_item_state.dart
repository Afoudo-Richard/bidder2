part of 'add_item_bloc.dart';

class AddItemState extends Equatable {
  AddItemState({
    this.status = FormzStatus.pure,
    this.category = 0,
    this.name = const Name.pure(),
    this.description = const Description.pure(),
    this.addBidTime = false,
    this.price = const Price.pure(),
    this.pickedFile = const <XFile>[],
    this.categoryItems = const <Map<String, dynamic>>[
      {'id': 0, 'name': "Select category"},
      {'id': 1, 'name': "Shoes"},
      {'id': 2, 'name': "Phone"}
    ],
  })  : bidStartTime = DateTime.now(),
        bidEndTime = DateTime.now();

  AddItemState.all({
    required FormzStatus status,
    required int category,
    required Name name,
    required Description description,
    required bool addBidTime,
    required Price price,
    DateTime? bidStartTime,
    DateTime? bidEndTime,
    required List categoryItems,
    required List<XFile>? pickedFile,
  })  : status = status,
        category = category,
        name = name,
        description = description,
        addBidTime = addBidTime,
        price = price,
        bidStartTime = bidStartTime,
        bidEndTime = bidEndTime,
        categoryItems = categoryItems,
        pickedFile = pickedFile;

  final FormzStatus status;
  final int category;
  final Name name;
  final Description description;
  final bool addBidTime;
  final Price price;
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  final List categoryItems;
  final List<XFile>? pickedFile;

  AddItemState copyWith({
    FormzStatus? status,
    int? category,
    Name? name,
    Description? description,
    bool? addBidTime,
    Price? price,
    DateTime? bidStartTime,
    DateTime? bidEndTime,
    List? categoryItems,
    List<XFile>? pickedFile,
  }) {
    return AddItemState.all(
      status: status ?? this.status,
      category: category ?? this.category,
      name: name ?? this.name,
      description: description ?? this.description,
      addBidTime: addBidTime ?? this.addBidTime,
      price: price ?? this.price,
      bidStartTime: bidStartTime ?? this.bidStartTime,
      bidEndTime: bidEndTime ?? this.bidEndTime,
      categoryItems: categoryItems ?? this.categoryItems,
      pickedFile: pickedFile ?? this.pickedFile,
    );
  }

  @override
  List<Object?> get props => [
        status,
        category,
        name,
        description,
        addBidTime,
        price,
        bidStartTime,
        bidEndTime,
        categoryItems,
        pickedFile,
      ];
}
