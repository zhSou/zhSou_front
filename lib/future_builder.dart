import 'package:flutter/material.dart';

typedef MyWidgetBuilder<T> = Widget Function(BuildContext context, T data);

class MyFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final MyWidgetBuilder<T>? builder;
  final MyWidgetBuilder? onErrorBuilder;
  const MyFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
    this.onErrorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return builder == null
                ? Text(data.toString())
                : builder!(context, snapshot.data as T);
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            if (onErrorBuilder != null) {
              return onErrorBuilder!(context, error);
            }

            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(error.toString()),
                  ],
                ),
              ),
            );
          } else {
            throw Exception('snapshot has no data or error');
          }
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
