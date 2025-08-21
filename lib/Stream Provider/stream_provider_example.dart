import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 24,
        title: Text(
          'Stream provider',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: streamData.when(
        data:
            ((data) => Center(
              child: Text(data.toString(), style: TextStyle(fontSize: 25)),
            )),
        error: ((error, stateTrace) => Text(error.toString())),
        loading: (()=> Center(child: CircularProgressIndicator(),)),
      ),
    );
  }
}
