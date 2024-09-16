import 'package:injectable/injectable.dart';
import 'di.config.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => getIt.init();