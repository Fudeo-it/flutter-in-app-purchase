import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudeo_tales/app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final storage = await getTemporaryDirectory();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storage);

  runApp(const App());
}


