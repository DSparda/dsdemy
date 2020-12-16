import 'package:auto_route/auto_route_annotations.dart';
import 'package:udemy1/src/ui/views/activate/activate_view.dart';
import 'package:udemy1/src/ui/views/activate_success/activate_success_view.dart';
import 'package:udemy1/src/ui/views/feature/feature_view.dart';
import 'package:udemy1/src/ui/views/login/login_view.dart';
import 'package:udemy1/src/ui/views/register/register_view.dart';
import 'package:udemy1/src/ui/views/user/user_view.dart';
import 'package:udemy1/src/ui/widgets/smart/bottom_bar_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: RegisterView),
  MaterialRoute(page: UserView),
  MaterialRoute(page: ActivateView),
  MaterialRoute(page: ActivateSuccessView),
  MaterialRoute(page: FeatureView),
  MaterialRoute(page: BottomBarView)
])
class $Router {}
