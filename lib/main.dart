import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/Future%20Provider/api_service.dart';
import 'package:riverpod_learning/Future%20Provider/employee_model.dart';
// import 'package:riverpod_learning/Future%20Provider/users_screen.dart';
import 'package:riverpod_learning/State%20Notifier%20Provider/counter_demo.dart';
import 'package:riverpod_learning/Stream%20Provider/stream_provider_example.dart';

final counterProvider = StateNotifierProvider<CounterDemo, int>(
  (ref) => CounterDemo(),
);
final apiProvider = Provider<ApiService>((ref) => ApiService());
final userDataProvider = FutureProvider<List<Employee>>((ref) {
  return ref.read(apiProvider).getUsers();
});
final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 4),
    ((compulationCount) => compulationCount),
  );
});
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamProviderExample(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Full Screen is builded........');
    final counter = ref.watch(counterProvider);
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 24,
        title: Text(
          'State Notifier Provider',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
