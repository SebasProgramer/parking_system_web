import 'package:parking_web/Models/api_service.dart';

class DashboardController {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAutos() async {
    return await _apiService.fetchData('autos/getAllAutos');
  }

  Future<List<dynamic>> getGarajes() async {
    return await _apiService.fetchData('garajes/getAllGarajes');
  }

  Future<List<dynamic>> getReservaciones() async {
    return await _apiService.fetchData('reservaciones/getAllReservaciones');
  }
}
