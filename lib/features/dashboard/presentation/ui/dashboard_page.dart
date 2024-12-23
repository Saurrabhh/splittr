import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splittr/core/base/base_page/base_page.dart';
import 'package:splittr/core/global/presentation/blocs/global_bloc.dart';
import 'package:splittr/features/dashboard/presentation/blocs/dashboard_bloc.dart';
import 'package:splittr/utils/bloc_utils/bloc_utils.dart';

part 'dashboard_form.dart';

class DashboardPage extends BasePage<DashboardBloc> {
  const DashboardPage({
    super.key,
    required super.args,
  });

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: _handleState,
        builder: _handleWidget,
      ),
    );
  }

  void _handleState(BuildContext context, DashboardState state) {}

  Widget _handleWidget(BuildContext context, DashboardState state) {
    return const _DashboardForm();
  }
}
