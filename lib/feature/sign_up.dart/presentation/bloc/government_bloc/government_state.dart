import 'package:secondwork/feature/sign_up.dart/data/get_government/model/governmernt_model.dart';

abstract class GovernmentState {}

class GovernmentInitState extends GovernmentState {}

class GovernmentIsLoadingState extends GovernmentState {}

class GovernmentSuccessState extends GovernmentState {
  GovernmentModel governmentModel;
  GovernmentSuccessState(this.governmentModel);
}

class GovernmentFailureState extends GovernmentState {
  dynamic message;
  GovernmentFailureState(this.message);
}
