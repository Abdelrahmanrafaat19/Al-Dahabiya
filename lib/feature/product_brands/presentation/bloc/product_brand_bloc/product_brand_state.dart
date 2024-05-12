abstract class ProductBrandState {}

class ProductBrandInitState extends ProductBrandState {}

class ProductBrandIsLoadingState extends ProductBrandState {}

class ProductBrandIsEmptyState extends ProductBrandState {}

class ProductBrandSuccessState extends ProductBrandState {
  Map<String, dynamic> productBrandsModel;
  ProductBrandSuccessState(this.productBrandsModel);
}

class ProductBrandFailuretate extends ProductBrandState {
  dynamic message;
  ProductBrandFailuretate(this.message);
}
