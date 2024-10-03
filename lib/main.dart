import 'package:flutter/material.dart';
import 'package:test_1/pages/import.dart';
import 'package:test_1/services/event_bus.dart';
import 'package:test_1/services/events/countdown_complated_event.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      EventBus().on<CountdownCompletedEvent>().listen((event) {
      print('Countdown completed for item: ${event.itemId}');

    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OptimizedListView(),
    );
  }
}

