import 'dart:io';

abstract class ICacheManagerService{
  Future<File> getSingleCacheFile({required String url});
}