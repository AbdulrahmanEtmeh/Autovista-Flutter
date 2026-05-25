import 'package:get/get.dart';
import 'package:graduation_project/core/network/api_response.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../data/model/car_parts_items_model.dart';
import '../../data/source/remote/carParts/car_parts_data.dart';

abstract class CarPartsItemsController extends GetxController {
  initialData();
  getData();
}

class CarPartsItemsControllerImp extends CarPartsItemsController {
  int? brandId;
  int? categoryId;
  String? brandName;
  CarPartsData carPartsData = CarPartsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<CarPartsItemsModel> carPartsItems = [];

  void _readArgs() {
    int? parseId(dynamic value) {
      if (value == null) return null;
      return int.tryParse(value.toString());
    }

    final args = Get.arguments;
    if (args is Map) {
      brandId = parseId(args['brandId']);
      categoryId = parseId(args['categoryId']);
      brandName = args['brandName']?.toString();
    }

    // ignore: avoid_print
    print(
      'CarPartsItems args => brandId: $brandId, categoryId: $categoryId, brandName: $brandName',
    );
  }

  @override
  initialData() {
    _readArgs();
    getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    _readArgs();
    statusRequest = StatusRequest.loading;
    update();
    var response = await carPartsData.getCarPartsItems(brandId, categoryId);
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          carPartsItems.clear();
          final itemsList = responseData['data'];
          if (itemsList is List) {
            int? parseId(dynamic value) =>
                value == null ? null : int.tryParse(value.toString());

            final normalizedBrandName = brandName?.trim().toLowerCase();

            for (final item in itemsList) {
              if (item is Map<String, dynamic>) {
                final itemBrandId =
                    parseId((item['brand'] as Map<String, dynamic>?)?['id']);
                final itemCategoryId =
                    parseId((item['category'] as Map<String, dynamic>?)?['id']);

                final fitsCars = (item['fits_cars'] ?? item['fits_car'])
                    ?.toString()
                    .toLowerCase();
                final matchesBrandByCarFit = normalizedBrandName != null &&
                    normalizedBrandName.isNotEmpty &&
                    (fitsCars?.contains(normalizedBrandName) ?? false);

                final matchesCategory =
                    categoryId == null || itemCategoryId == categoryId;
                final matchesByIds = brandId != null &&
                    itemBrandId == brandId &&
                    matchesCategory;

                if ((matchesByIds ||
                    (matchesBrandByCarFit && matchesCategory))) {
                  try {
                    carPartsItems.add(CarPartsItemsModel.fromJson(item));
                  } catch (e) {
                    // ignore: avoid_print
                    print('Skipped invalid part payload: $e');
                  }
                }
              }
            }
          }
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }
}
