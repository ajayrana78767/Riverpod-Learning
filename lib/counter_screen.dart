import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen1 extends ConsumerStatefulWidget {
  const CounterScreen1({super.key});

  @override
  ConsumerState<CounterScreen1> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen1> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    debugPrint('Build');
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final switchValue=ref.watch(switchProvider);
          return Column(
            children: [
              Switch(
                value: switchValue ,
                onChanged: (value) {
                  debugPrint('Build2');
                  ref.read(switchProvider.notifier).state = value;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class CounterScreen2 extends ConsumerWidget {
  const CounterScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final count = ref.watch(counter);
    debugPrint('Build');
    return Scaffold(
      appBar: AppBar(title: Text('Counter App'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                debugPrint('Build2');
                return Center(child: Text(count.toString()));
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(switchProvider);
                debugPrint('Build3');
                return Center(
                  child: Switch(
                    value: count,
                    onChanged: (value) {
                      ref.read(switchProvider.notifier).state = value;
                    },
                  ),
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state++;
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final counter = StateProvider<int>((ref) {
  return 0;
});
final switchProvider = StateProvider<bool>((ref) {
  return false;
});
