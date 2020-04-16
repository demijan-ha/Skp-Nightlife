import 'package:flutter/material.dart';
import 'package:nightlife/theme/style.dart';
import 'package:nightlife/routes.dart';
import 'package:nightlife/bloc/bloc-prov-tree.dart';
import 'package:nightlife/bloc/bloc-prov.dart';
import 'package:nightlife/blocs/blocs.dart';
import 'blocs/blocs.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: <BlocProvider>[
        BlocProvider<AuthBloc>(bloc: AuthBloc()),
        BlocProvider<PrefBloc>(bloc: PrefBloc()),
      ],
      child: MaterialApp(
        title: 'ExampleApp',
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
