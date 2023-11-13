import 'package:belin_zayy/app/bindings/layout_binding.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initModule() async {
  getIt.registerLazySingleton<LayoutBinding>(() => LayoutBinding());
}
