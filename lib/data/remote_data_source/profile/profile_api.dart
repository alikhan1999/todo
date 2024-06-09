// class ProfileApi implements IProfileApi {
//   ProfileApi(IApiService api) {
//     api.setIsTokenRequired(true);
//     _dio = api.get();
//   }
//
//   @override
//   Future<ProfileModel> uploadPicProfile(FormData map) async {
//     try {
//       final responseData = await _dio.post("api/profile-update", data: map);
//
//       return ProfileModel.fromJson(responseData.data);
//     } on DioError catch (e) {
//       final exception = getException(e);
//       throw exception;
//     } catch (e) {
//       throw ResponseException(msg: e.toString());
//     }
//   }
//
//   late Dio _dio;
// }
