part of 'add_item_bloc.dart';

enum AddItemStatus { initial, success, failure, loading }

class AddItemState extends Equatable {
  AddItemState({
    this.status = FormzStatus.pure,
    this.category = '0',
    this.name = const Name.pure(),
    this.description = const Description.pure(),
    this.addBidTime = false,
    this.price = const Price.pure(),
    this.pickedFile = const <XFile>[],
    this.categories = const [],
    this.addItemstatus = AddItemStatus.initial,
    // this.categoryItems = const <Map<String, dynamic>>[
    //   {'id': 0, 'name': "Select category"},
    //   {'id': 1, 'name': "Shoes"},
    //   {'id': 2, 'name': "Phone"}
    // ],
  })  : bidStartTime = DateTime.now(),
        bidEndTime = DateTime.now();

  AddItemState.all(
      {required FormzStatus status,
      required String category,
      required Name name,
      required Description description,
      required bool addBidTime,
      required Price price,
      DateTime? bidStartTime,
      DateTime? bidEndTime,
      required List<Category> categories,
      required List<XFile>? pickedFile,
      required AddItemStatus addItemstatus})
      : status = status,
        category = category,
        name = name,
        description = description,
        addBidTime = addBidTime,
        price = price,
        bidStartTime = bidStartTime,
        bidEndTime = bidEndTime,
        categories = categories,
        addItemstatus = addItemstatus,
        pickedFile = pickedFile;

  final FormzStatus status;
  final AddItemStatus addItemstatus;
  final String category;
  final Name name;
  final Description description;
  final bool addBidTime;
  final Price price;
  final DateTime? bidStartTime;
  final DateTime? bidEndTime;
  final List<Category> categories;
  final List<XFile>? pickedFile;

  AddItemState copyWith({
    FormzStatus? status,
    AddItemStatus? addItemstatus,
    String? category,
    Name? name,
    Description? description,
    bool? addBidTime,
    Price? price,
    DateTime? bidStartTime,
    DateTime? bidEndTime,
    List<Category>? categories,
    List<XFile>? pickedFile,
  }) {
    return AddItemState.all(
      status: status ?? this.status,
      addItemstatus: addItemstatus ?? this.addItemstatus,
      category: category ?? this.category,
      name: name ?? this.name,
      description: description ?? this.description,
      addBidTime: addBidTime ?? this.addBidTime,
      price: price ?? this.price,
      bidStartTime: bidStartTime ?? this.bidStartTime,
      bidEndTime: bidEndTime ?? this.bidEndTime,
      categories: categories ?? this.categories,
      pickedFile: pickedFile ?? this.pickedFile,
    );
  }

  @override
  List<Object?> get props => [
        status,
        addItemstatus,
        category,
        name,
        description,
        addBidTime,
        price,
        bidStartTime,
        bidEndTime,
        categories,
        pickedFile,
      ];
}
