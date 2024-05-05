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

  Future<int> getTotalConfirmadas() async {
    var data = await _apiService.fetchData('dashboard/getTotalConfirmadas');
    return data['totalConfirmadas'];
  }

  Future<int> getTotalRechazadas() async {
    var data = await _apiService.fetchData('dashboard/getTotalRechazadas');
    return data['totalRechazadas']; 
  }

  Future<int> getTotalGarajesDisponibles() async {
    var data = await _apiService.fetchData('dashboard/getTotalGarajesDisponibles');
    return data['totalDisponibles']; 
  }

  Future<int> getTotalGarajesOcupados() async {
    var data = await _apiService.fetchData('dashboard/getTotalGarajesOcupados');
    return data['totalOcupados']; 
  }

  Future<List<dynamic>> getRechazosPorCliente() async {
    return await _apiService.fetchData('dashboard/getRechazosPorCliente');
  }

  Future<List<dynamic>> getRechazosPorOfertantes() async {
    return await _apiService.fetchData('dashboard/getRechazosPorOfertantes');
  }

  Future<List<dynamic>> getTopClientes() async {
    return await _apiService.fetchData('tops/getTopClientes');
  }

  Future<List<dynamic>> getTopOfertantes() async {
    return await _apiService.fetchData('tops/getTopOfertantes');
  }

  Future<List<dynamic>> getTopClientesMalos() async {
    return await _apiService.fetchData('tops/getTopClientesMalos');
  }

  Future<List<dynamic>> getTopOfertantesMalos() async {
    return await _apiService.fetchData('tops/getTopOfertantesMalos');
  }
}
