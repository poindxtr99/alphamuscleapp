import 'package:alphamuscle/src/models/exercise.dart';
import 'package:alphamuscle/src/models/exercise_category.dart';
import 'package:alphamuscle/src/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'src/app.dart';
import 'package:provider/provider.dart' as net_provider;
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:alphamuscle/src/realm/app_services.dart';


void main() async{
  await Hive.initFlutter(); // this isn't needed in the browser
  Hive.registerAdapter<Workout>(WorkoutAdapter());
  Hive.registerAdapter<Exercise>(ExerciseAdapter());
  Hive.registerAdapter<ExerciseCategory>(ExerciseCategoryAdapter());
  await Hive.openBox<Workout>('favorites_workouts');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Config realmConfig = await Config.getConfig('assets/config/atlasConfig.json');
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(net_provider.MultiProvider(providers: [
    net_provider.ChangeNotifierProvider<AppServices>(create: (_) => AppServices(realmConfig.appId, realmConfig.baseUrl)),
  ], child: const ProviderScope(child: App())));
  Future.delayed(const Duration(seconds: 5),() {
    FlutterNativeSplash.remove();
  });
}

// This class gets app info from `atlasConfig.json`.
class Config extends ChangeNotifier {
  late String appId;
  late String atlasUrl;
  late Uri baseUrl;

  Config._create(dynamic realmConfig) {
    appId = realmConfig['appId'];
    atlasUrl = realmConfig['dataExplorerLink'];
    baseUrl = Uri.parse(realmConfig['baseUrl']);
  }

  static Future<Config> getConfig(String jsonConfigPath) async {
    dynamic realmConfig = json.decode(await rootBundle.loadString(jsonConfigPath));
    var config = Config._create(realmConfig);

    return config;
  }
}
