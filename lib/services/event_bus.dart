import 'dart:async';

class EventBus {
  // Singleton pattern to ensure a single instance of EventBus
  static final EventBus _instance = EventBus._internal();

  factory EventBus() {
    return _instance;
  }

  EventBus._internal();

  // A map to store stream controllers for different event types
  final Map<Type, List<StreamController>> _streamControllers = {};

  // Subscribe to events of type T
  Stream<T> on<T>() {
    if (!_streamControllers.containsKey(T)) {
      _streamControllers[T] = [];
    }
    final StreamController<T> controller = StreamController<T>.broadcast();
    _streamControllers[T]?.add(controller);
    return controller.stream;
  }

  // Emit events of type T
  void emit<T>(T event) {
    if (_streamControllers.containsKey(T)) {
      for (var controller in _streamControllers[T]!) {
        controller.add(event);
      }
    }
  }

  // Dispose of the event bus and close all streams
  void dispose() {
    for (var controllers in _streamControllers.values) {
      for (var controller in controllers) {
        controller.close();
      }
    }
    _streamControllers.clear();
  }
}
