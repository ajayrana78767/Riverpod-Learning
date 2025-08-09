import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 24,
        title: Text(
          'Future Provider - Users',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: userData.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              // ignore: unused_result
              await ref.refresh(userDataProvider.future);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('User list refreshed')));
            },
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${data[index].name},${data[index].address}",
                  ),
                  subtitle: Text(data[index].email),
                );
              },
            ),
          );
        },
        error: ((error, stackTrace) {
          return Center(child: Text(error.toString()));
        }),
        loading: () {
          return Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          );
        },
      ),
    );
  }
}
