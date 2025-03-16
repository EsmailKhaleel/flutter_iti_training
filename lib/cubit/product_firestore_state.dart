abstract class ProductFirestoreState {}

class ProductsFirestoreInitaialState extends ProductFirestoreState {}

// GetProducts
class ProductsFirestoreLoadingState extends ProductFirestoreState {}

class ProductsFirestoreSuccsessState extends ProductFirestoreState {}

class ProductsFirestoreErrorState extends ProductFirestoreState {}

// AddProduct
class AddProductLoadingState extends ProductFirestoreState {}

class AddProductSuccessState extends ProductFirestoreState {}

class AddProductErrorState extends ProductFirestoreState {}
