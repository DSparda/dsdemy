import 'package:auto_route/auto_route_annotations.dart';
import 'package:udemy1/src/ui/views/log_in/log_in_view.dart';

import 'package:udemy1/src/ui/views/register/register_view.dart';
import 'package:udemy1/src/ui/views/user_home/user_home_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: LogInView, initial: true),
  MaterialRoute(page: RegisterView),
  MaterialRoute(page: UserHomeView)
])
class $Router {}