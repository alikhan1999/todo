import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/application/network/external_values/ExternalValues.dart';
import 'package:todo/application/network/external_values/iExternalValue.dart';
import 'package:todo/application/network/remote_client/api_service.dart';
import 'package:todo/application/network/remote_client/iApService.dart';
import 'package:todo/constant/constants.dart';
import 'package:todo/data/local_data_source/db/db.dart';
import 'package:todo/data/local_data_source/db/i_db.dart';
import 'package:todo/data/local_data_source/jwt/jwt_local_access_token.dart';
import 'package:todo/data/local_data_source/preference/i_pref_helper.dart';
import 'package:todo/data/local_data_source/preference/pref_helper.dart';
import 'package:todo/data/remote_data_source/auth/auth_api.dart';
import 'package:todo/data/remote_data_source/auth/i_auth_api.dart';
import 'package:todo/data/remote_data_source/jwt_remote_access_token.dart';
import 'package:todo/data/remote_data_source/todo/i_todo_api.dart';
import 'package:todo/data/remote_data_source/todo/todo_api.dart';
import 'package:todo/data/repo/homepage/allproduct.dart';
import 'package:todo/data/repo/jwt_access_repo.dart';
import 'package:todo/data/repo/todo/todo_repo.dart';
import 'package:todo/domain/interfaces/homepage/user_repo.dart';
import 'package:todo/domain/interfaces/todo/I_todo_repo.dart';
import 'package:todo/services/cache_manager_service/cache_manager_service.dart';
import 'package:todo/services/cache_manager_service/i_cache_manager_service.dart';
import 'package:todo/services/navService/i_navigation_service.dart';
import 'package:todo/services/navService/nav_service.dart';
import 'package:todo/ui/utils/overlay_helper.dart';
import 'package:todo/ui/utils/utils.dart';

final inject = GetIt.instance;

Future<void> setupLocator() async {
  inject.registerSingletonAsync(() => SharedPreferences.getInstance());
  inject.registerLazySingleton<IDb>(() => Db());
  // inject.registerLazySingleton<FlutterTts>(() => FlutterTts());
  // inject.registerLazySingleton<ITTSService>(() => TTSService(inject()));
  inject.registerLazySingleton<JwtLocalAccessToken>(() => JwtLocalAccessToken());
  inject.registerLazySingleton<JwtRemoteAccessToken>(() => JwtRemoteAccessToken(externalValues: ExternalValues()));
  inject.registerLazySingleton<JwtAccessRepo>(() => JwtAccessRepo(jwtLocalAccessToken: inject(), jwtRemoteAccessToken: inject()));
  inject.registerLazySingleton<IApiService>(() => ApiService.create(
        externalValues: ExternalValues(),
        jwtAccessRepo: inject(),
      ));
  inject.registerLazySingleton<IExternalValues>(() => ExternalValues());

  inject.registerLazySingleton<IAuthApi>(() => AuthApi(inject()));
  inject.registerLazySingleton<IAuthRepo>(() => AuthRepo(api: inject()));

  inject.registerLazySingleton<ITodoApi>(() => TodoApi(inject()));
  inject.registerLazySingleton<ITodoRepo>(() => TodoRepo(api: inject()));

  // inject.registerLazySingleton<IProfileApi>(() => ProfileApi(inject()));
  // inject.registerLazySingleton<IProfileRepo>(() => ProfileRepo(api: inject()));

  inject.registerLazySingleton<Px>(() => Px());
  inject.registerLazySingleton<Utils>(() => Utils());
  inject.registerLazySingleton<INavigationService>(() => NavigationService());
  inject.registerLazySingleton<ICacheManagerService>(() => CacheManagerService(DefaultCacheManager()));
  inject.registerLazySingleton<IPrefHelper>(() => PrefHelper(inject()));

  if (Platform.isIOS) {
    inject.registerLazySingleton<OverlayEntryHelper>(() => OverlayEntryHelper());
  }
}
