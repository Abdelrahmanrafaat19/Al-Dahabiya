import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:secondwork/feature/cart/data/cart_model/cart_model.dart';

part 'add_cart_data_state.dart';

class AddCartDataCubit extends Cubit<AddCartDataState> {
  AddCartDataCubit() : super(AddCartDataInitial());
  addNote(CartProductData note) async {
    emit(AddCartDataLoading());
    try {
      bool foundToggle = false;
      var notesBox = Hive.box<CartProductData>("cart_box").values.toList();
      if (notesBox.isNotEmpty) {
        for (int i = 0; i < notesBox.length; i++) {
          if (notesBox[i].id == note.id) {
            notesBox[i].quality += note.quality;
            foundToggle = true;
            notesBox[i].save();
            break;
          }
        }
        if (foundToggle == false) {
          await Hive.box<CartProductData>("cart_box").add(note);
        }
      } else {
        await Hive.box<CartProductData>("cart_box").add(note);
      }

      /* await notesBox
          .add(note)
          .then(
            (value) => print("value ${value} ${note.name}"),
          )
          .catchError(
            (value) => print("error value ${value} ${note.name}"),
          ); */
      emit(AddCartDataSuccess());
    } catch (e) {
      emit(AddCartDataFailure(e.toString()));
    }
  }
}
