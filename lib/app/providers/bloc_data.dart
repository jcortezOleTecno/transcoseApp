import 'dart:async';

class BlocData {
  var patronController = StreamController<Map<String,dynamic>>.broadcast();
  Stream<Map<String,dynamic>> get outList => patronController.stream;
  Sink<Map<String,dynamic>> get inList => patronController.sink;

  void dispose() {
    patronController.close();
  }
}