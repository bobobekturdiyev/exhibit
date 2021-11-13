import 'package:dio/dio.dart';
import 'package:exhibit/data/singletons/dio_settings.dart';
import 'package:exhibit/data/util/service_locator.dart';
import 'package:exhibit/models/exhibit/exhibit.dart';

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}

var locator = serviceLocator<DioSettings>();

class RestExhibitsLoader extends ExhibitsLoader {
  @override
  Future<List<Exhibit>> getExhibitList() async {
    Dio _dio = Dio(locator.dioBaseOptions);
    print("list/");

    final Response response = await _dio.get("list/");

    print(response.data);
    print(response.statusCode);

    List<Exhibit> exhibitList =
        (response.data as List).map((e) => Exhibit.fromJson(e)).toList();

    return exhibitList;
  }
}
