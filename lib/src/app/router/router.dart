import 'package:auto_route/auto_route_annotations.dart';
import 'package:udemy1/src/ui/views/log_in/log_in_view.dart';
import 'package:udemy1/src/ui/views/log_out/log_out_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: LogInView, initial: true),
  MaterialRoute(page: LogOutView)
])
class $Router {}