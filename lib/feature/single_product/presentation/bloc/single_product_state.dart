import 'package:secondwork/feature/single_product/data/single_product_model/single_product_model.dart';

abstract class SingleProductState {}

class SingleProductInitState extends SingleProductState {}

class SingleProductIsLoadingState extends SingleProductState {}

class SingleProductSuccessState extends SingleProductState {
  SingleProductModel singleProductModel;
  SingleProductSuccessState(this.singleProductModel);
}

class SingleProductFailureState extends SingleProductState {
  dynamic message;
  SingleProductFailureState(this.message);
}
