// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/activate_api.dart';
import '../../../services/api_helper.dart';
import '../../../services/feature_api.dart';
import '../../../ui/views/feature/feature_view_model.dart';
import '../../../services/login_api.dart';
import '../../../services/navigation_bundle.dart';
import '../../../services/register_api.dart';
import '../../../services/third_party_services_module.dart';
import '../../../services/user_api.dart';
import '../../../ui/views/user/user_view_model.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<ActivateService>(() => ActivateService());
  gh.lazySingleton<ApiHelper>(() => ApiHelper());
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<FeatureSerivce>(() => FeatureSerivce());
  gh.lazySingleton<LoginService>(() => LoginService());
  gh.lazySingleton<NavigationBundle>(() => NavigationBundle());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<RegisterService>(() => RegisterService());
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  gh.lazySingleton<UserService>(() => UserService());

  // Eager singletons must be registered in the right order
  gh.singleton<FeatureViewModel>(FeatureViewModel());
  gh.singleton<UserViewModel>(UserViewModel());
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
