import 'package:secondwork/feature/home/data/slider/slider_model/slider_model.dart';

abstract class SliderState {}

class SliderInitState extends SliderState {}

class SliderISLoadingState extends SliderState {}

class SliderSaccussState extends SliderState {
  SliderModel sliderModel;
  SliderSaccussState(this.sliderModel);
}

class SliderFailureState extends SliderState {
  dynamic message;
  SliderFailureState(this.message);
}
