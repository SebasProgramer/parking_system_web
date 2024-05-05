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

  Future<List<dynamic>> getTotalConfirmadas() async {
    var data = await _apiService.fetchData('dashboard/getTotalConfirmadas');
    return List<dynamic>.from(data.map((item) => {
      "id": item['id'],
      "nombre": item['nombre'],
      "total_reservaciones_confirmadas": int.parse(item['total_reservaciones_confirmadas'])
    }));
  }

  Future<List<dynamic>> getTotalRechazadas() async {
    var data = await _apiService.fetchData('dashboard/getTotalRechazadas');
    return List<dynamic>.from(data.map((item) => {
      "id": item['id'],
      "nombre": item['nombre'],
      "total_reservaciones_rechazadas": int.parse(item['total_reservaciones_rechazadas'])
    }));
  }

  Future<int> getTotalGarajesDisponibles() async {
    var data =
        await _apiService.fetchData('dashboard/getTotalGarajesDisponibles');
    return int.parse(data['cantidad_disponibles'].toString());
  }

  Future<int> getTotalGarajesOcupados() async {
    var data = await _apiService.fetchData('dashboard/getTotalGarajesOcupados');
    return int.parse(data['cantidad_ocupados'].toString());
  }

  Future<int> getRechazosPorOfertantes() async {
    var data = await _apiService.fetchData('dashboard/getRechazosPorOfertantes');
    return int.parse(data['rechazos_ofertantes'].toString()); 
  }

  Future<int> getRechazosPorCliente() async {
    var data = await _apiService.fetchData('dashboard/getRechazosPorCliente');
    return int.parse(data['rechazos_cliente'].toString());  
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
