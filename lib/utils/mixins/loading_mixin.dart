import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum LoadingState { idle, loading, success, error }

mixin LoadingMixin on GetxController {
  LoadingState _state = LoadingState.idle;
  String? _errorMessage;

  LoadingState get state => _state;
  String? get errorMessage => _errorMessage;

  bool get isLoading => _state == LoadingState.loading;
  bool get isSuccess => _state == LoadingState.success;
  bool get isError => _state == LoadingState.error;
  bool get isIdle => _state == LoadingState.idle;

  void setLoading() {
    _state = LoadingState.loading;
    _errorMessage = null;
    update();
  }

  void setSuccess() {
    _state = LoadingState.success;
    _errorMessage = null;
    update();
  }

  void setError(String message) {
    _state = LoadingState.error;
    _errorMessage = message;
    update();
  }

  void resetState() {
    _state = LoadingState.idle;
    _errorMessage = null;
    update();
  }
}
