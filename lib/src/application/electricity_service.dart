import 'package:amc_2024/src/domain/electricity/hydro_model.dart';
import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:amc_2024/src/infra/electricity/hydro_api.dart';

class HydroService {
  final HydroApi hydroApi;

  HydroService({required this.hydroApi});

  Future<HydroModel> getHydroData() async {
    try {
      return await hydroApi.getHydroData();
    } on ApiException {
      rethrow; //TODO display error message
    }
  }
}
