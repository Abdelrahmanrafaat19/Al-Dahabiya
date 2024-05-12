import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/home/data/slider/slider_repo/slider_repo_imple.dart';
import 'package:secondwork/feature/home/presentation/bloc/slider_bloc/slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderRepoImple sliderRepoImple;
  SliderCubit(this.sliderRepoImple) : super(SliderInitState());
  Future<void> getSliderImage() async {
    emit(SliderISLoadingState());
    var response = await sliderRepoImple.getSliderImages();
    response.fold(
      (failure) => emit(SliderFailureState(failure.message)),
      (data) => emit(
        SliderSaccussState(data),
      ),
    );
  }
}
