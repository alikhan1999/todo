// import 'package:dartz/dartz.dart';
// import 'package:mindshifttherapist/application/core/exception/exception.dart';
// import 'package:mindshifttherapist/application/core/failure/failure.dart';
// import 'package:mindshifttherapist/application/network/error_handler/error_handler.dart';
// import 'package:mindshifttherapist/data/models/service/service_model.dart';
// import 'package:mindshifttherapist/data/models/service_book/service_book_model.dart';
// import 'package:mindshifttherapist/data/models/therapist_service_model/therapist_service.dart';
// import 'package:mindshifttherapist/data/remote_data_source/service_api/i_service_api.dart';
// import 'package:mindshifttherapist/domain/interfaces/i_service_repo_.dart';
// import 'package:mindshifttherapist/domain/use_cases/update_therapist_service.dart';
//
// class ServiceRepo implements IServiceRepo {
//   ServiceRepo({required this.api});
//
//   IServiceApi api;
//
//   @override
//   Future<Either<Failure, List<ServiceModel>>> getService() async {
//     try {
//       final result = await api.getService();
//       return Right(result);
//     } catch (error) {
//       return Left(getFailure(error as Exception));
//     }
//   }
//
//   @override
//   Future<Either<Failure, ServiceBook>> addTherapistService(Map<String, dynamic> map) async {
//     try {
//       final result = await api.addTherapistService(map);
//       return Right(result);
//     } catch (error) {
//       return Left(getFailure(error as Exception));
//     }
//   }
//
//   @override
//   Future<Either<Failure, TherapistService>> getTherapistService() async {
//     try {
//       final result = await api.getTherapistService();
//       return Right(result);
//     } catch (error) {
//       return Left(getFailure(error as Exception));
//     }
//   }
//
//   @override
//   Future<Either<Failure, UpdateTherapistServiceModel>> updateTherapistService(Map<String, dynamic> map, String serviceId) async {
//     try {
//       final result = await api.updateTherapistService(map, serviceId);
//       return Right(result);
//     } catch (error) {
//       if (error is Exception) {
//         return Left(getFailure(error));
//       } else {
//         return Left(getFailure(DefaultException()));
//       }
//     }
//   }
// }
