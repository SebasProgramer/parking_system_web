import 'package:flutter/material.dart';
import 'package:parking_web/Controllers/dashboard_controller.dart';
import 'package:parking_web/Views/Components/Widgets/custom_row_widget.dart';
import 'package:parking_web/Views/Components/Widgets/dynamic_list_widget.dart';
import 'package:parking_web/Views/Components/Widgets/header_widget.dart';
import 'package:parking_web/Views/Components/Widgets/sidebar_widget.dart';
import 'package:parking_web/Views/Components/Widgets/stadistic_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController _controller = DashboardController();
  List<dynamic> _autos = [];
  List<dynamic> _garajes = [];

  //Lo que esta en los requerimientos
  List<dynamic> _topClientes = [];
  List<dynamic> _topOfertantes = [];
  List<dynamic> _peoresClientes = [];
  List<dynamic> _peoresOfertantes = [];

  List<dynamic> _confirmadas = [];
  List<dynamic> _rechazadas = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    _autos = await _controller.getAutos();
    _garajes = await _controller.getGarajes();

    //Loque esta en los requerimientos
    _topClientes = await _controller.getTopClientes();
    _topOfertantes = await _controller.getTopOfertantes();
    _peoresClientes = await _controller.getTopClientesMalos();
    _peoresOfertantes = await _controller.getTopOfertantesMalos();

    _confirmadas = await _controller.getTotalConfirmadas();
    _rechazadas = await _controller.getTotalRechazadas();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SidebarWidget(),
          const SizedBox(width: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderWidget(
                        title: 'Hello, Bro 👋',
                        subtitle: 'Bienvenido al Dashboard de Parking System'),
                    CustomRowWidget(
                      dynamicWidget: DynamicListWidget(
                        title: 'Autos',
                        items: _autos,
                        displayFunction: (auto) => 'Placa: ${auto['placa']}',
                      ),
                      statisticWidget: DynamicListWidget(
                        title: 'Garajes',
                        items: _garajes,
                        displayFunction: (garaje) =>
                            'Dirección: ${garaje['direccion']}',
                      ),
                    ),
                    //Parte de los requerimientos
                    //Totales
                    CustomRowWidget(
                      dynamicWidget: StatisticWidget(
                        title: 'Total Garajes Disponibles',
                        fetchDataFunction:
                            _controller.getTotalGarajesDisponibles,
                      ),
                      statisticWidget: StatisticWidget(
                        title: 'Total Garajes Ocupados',
                        fetchDataFunction: _controller.getTotalGarajesOcupados,
                      ),
                    ),

                    CustomRowWidget(
                      dynamicWidget: DynamicListWidget(
                        title: 'Reservaciones Confirmadas',
                        items: _confirmadas,
                        displayFunction: (item) =>
                            '${item['nombre']} - Confirmadas: ${item['total_reservaciones_confirmadas']}',
                      ),
                      statisticWidget: DynamicListWidget(
                        title: 'Reservaciones Rechazadas',
                        items: _rechazadas,
                        displayFunction: (item) =>
                            '${item['nombre']} - Rechazadas: ${item['total_reservaciones_rechazadas']}',
                      ),
                    ),
                    //Rechazos
                    CustomRowWidget(
                      dynamicWidget: StatisticWidget(
                        title: 'Total Rechazados por Cliente',
                        fetchDataFunction: _controller.getRechazosPorCliente,
                      ),
                      statisticWidget: StatisticWidget(
                        title: 'Total Rechazados por Ofertante',
                        fetchDataFunction: _controller.getRechazosPorOfertantes,
                      ),
                    ),
                    //Tops
                    CustomRowWidget(
                      dynamicWidget: DynamicListWidget(
                        title: 'Top 20 Clientes',
                        items: _topClientes,
                        displayFunction: (cliente) =>
                            '${cliente['nombre_cliente']} - ${cliente['promedio_calificacion_clientes']}',
                      ),
                      statisticWidget: DynamicListWidget(
                        title: 'Top 20 Ofertantes',
                        items: _topOfertantes,
                        displayFunction: (ofertante) =>
                            '${ofertante['nombre_ofertante']} - ${ofertante['promedio_calificacion_garajes']}',
                      ),
                    ),
                    CustomRowWidget(
                      dynamicWidget: DynamicListWidget(
                        title: 'Peores Clientes',
                        items: _peoresClientes,
                        displayFunction: (cliente) =>
                            '${cliente['nombre_cliente']} - ${cliente['promedio_calificacion_clientes']}',
                      ),
                      statisticWidget: DynamicListWidget(
                        title: 'Peores Ofertantes',
                        items: _peoresOfertantes,
                        displayFunction: (ofertante) =>
                            '${ofertante['nombre_ofertante']} - ${ofertante['promedio_calificacion_garajes']}',
                      ),
                    ),
                    DynamicListWidget(
                      title: 'Promedio precio garajes',
                      items: _garajes,
                      displayFunction: (garaje) =>
                          'Dirección: ${garaje['direccion']} - Promedio: ${garaje['promedio_precio_confirmado']}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
