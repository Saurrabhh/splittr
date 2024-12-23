import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splittr/core/base/base_bloc/base_bloc.dart';
import 'package:splittr/di/injection.dart';
import 'package:splittr/utils/bloc_utils/bloc_utils.dart';

abstract class BasePage<B extends BaseBloc> extends StatelessWidget {
  final Map<String, dynamic>? args;

  const BasePage({
    super.key,
    required this.args,
  });

  bool get showFullScreenLoader => true;

  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (_) => getIt<B>()
        ..started(
          args: args,
        ),
      child: Stack(
        children: [
          buildScreen(context),
          if (showFullScreenLoader) ...[
            _FullScreenLoader<B>(),
          ],
        ],
      ),
    );
  }
}

class _FullScreenLoader<B extends BaseBloc> extends StatelessWidget {
  const _FullScreenLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getBloc<B>(context),
      builder: (context, state) {
        if (getBloc<B>(context).isLoading) {
          return ColoredBox(
            color: Colors.grey.withOpacity(0.4),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
