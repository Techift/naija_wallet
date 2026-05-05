import 'package:naija_wallet/app/app.dart';
import 'package:naija_wallet/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
