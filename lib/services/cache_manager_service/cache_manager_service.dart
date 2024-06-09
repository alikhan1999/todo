import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:todo/services/cache_manager_service/i_cache_manager_service.dart';

class CacheManagerService extends ICacheManagerService {
  late final DefaultCacheManager cacheManager;

  CacheManagerService(this.cacheManager);

  @override
  Future<File> getSingleCacheFile({required String url}) async {
    return await cacheManager.getSingleFile(url);
  }
}
