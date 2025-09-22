// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/function/check_internet.dart';
import '../services/my_services.dart';
import 'status_request.dart';
import 'package:http/http.dart' as http;

class Crud {
  MyServices myServices = Get.find();
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        print(response.statusCode);
        // print(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          // return const Left(StatusRequest.serverFailure);
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkUrl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkUrl));
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
          // Map responseBody = jsonDecode(response.body);
          // print(responseBody);
          // return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postDataHeader(
      String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          body: data,
          headers: {
            'Authorization':
                'Bearer ${myServices.sharedPreferences.getString('token')}',
            'Accept': 'application/json',
          },
        );
        print(response.statusCode);
        // print(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          // return const Left(StatusRequest.serverFailure);
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getDataHeader(String linkUrl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(
          Uri.parse(linkUrl),
          headers: {
            'Authorization':
                'Bearer ${myServices.sharedPreferences.getString('token')}',
            'Accept': 'application/json',
          },
        );
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
          // Map responseBody = jsonDecode(response.body);
          // print(responseBody);
          // return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> deleteHeader(String linkUrl) async {
    try {
      if (await checkInternet()) {
        var response = await http.delete(
          Uri.parse(linkUrl),
          headers: {
            'Authorization':
                'Bearer ${myServices.sharedPreferences.getString('token')}',
            'Accept': 'application/json',
          },
        );
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
          // Map responseBody = jsonDecode(response.body);
          // print(responseBody);
          // return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postDataHeaderFilter(
    String linkUrl,
    Map data,
  ) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          headers: {
            'Authorization':
                'Bearer ${myServices.sharedPreferences.getString('token')}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        );

        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postDataHeaderFirebase(
      String linkUrl, Map data, String idToken) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          body: data,
          headers: {
            'Authorization': 'Bearer $idToken',
            'Accept': 'application/json',
          },
        );
        print(response.statusCode);
        // print(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          // return const Left(StatusRequest.serverFailure);
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
