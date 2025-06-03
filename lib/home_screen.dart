import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return "Subscribe";
});
final age = Provider<int>((ref) {
  return 25;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final subscribe = ref.watch(hello);
    final tempAge = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$subscribe $tempAge")),
    );
  }
}
