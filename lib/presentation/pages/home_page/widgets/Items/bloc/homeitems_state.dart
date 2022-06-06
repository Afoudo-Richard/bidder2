part of 'homeitems_bloc.dart';

enum HomeitemsStatus { initial, success, failure, loading }

class HomeitemsState extends Equatable {


  final List<Product> products;
  final HomeitemsStatus status;

  const HomeitemsState({
    this.products = const [],
    this.status = HomeitemsStatus.initial,
  });

  HomeitemsState copyWith({
    List<Product>? products,
    HomeitemsStatus? status,
  }){
    return HomeitemsState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object> get props => [products, status];
}

