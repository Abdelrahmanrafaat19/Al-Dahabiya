import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import 'package:secondwork/feature/cart/data/cart_model/cart_model.dart';

part 'get_cart_data_state.dart';

class GetCartDataCubit extends Cubit<GetCartDataState> {
  GetCartDataCubit() : super(GetCartDataInitial());
  static List<CartProductData> notes = [];
  static late List<dynamic> data;
  static dynamic totalPrice;
  fetchAllNotes() {
    data = [];
    totalPrice = 0;
    emit(GetCartDataIsLoading());
    var notesBox = Hive.box<CartProductData>("cart_box");

    notes = notesBox.values.toList();
    notes.forEach(
      (element) {
        totalPrice += (element.price! * element.quality.toDouble());
        data.add({
          "product_id": element.id,
          "option1": -1,
          "option2": -1,
          "q": element.quality
        });
      },
    );
    print(data);
    emit(GetCartDataSuccess());
  }
}
