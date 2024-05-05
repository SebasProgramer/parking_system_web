import 'package:flutter/material.dart';
import 'package:parking_web/Controllers/dashboard_controller.dart';
import 'package:parking_web/Views/Components/Widgets/dynamic_list_widget.dart';
import 'package:parking_web/Views/Components/Widgets/header_widget.dart';
import 'package:parking_web/Views/Components/Widgets/sidebar_widget.dart';

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
  List<dynamic> _reservaciones = [];

  //Lo que esta en los requerimientos
  List<dynamic> _topClientes = [];
  List<dynamic> _topOfertantes = [];
  List<dynamic> _peoresClientes = [];
  List<dynamic> _peoresOfertantes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    _autos = await _controller.getAutos();
    _garajes = await _controller.getGarajes();
    _reservaciones = await _controller.getReservaciones();

    //Loque esta en los requerimientos
    _topClientes = await _controller.getTopClientes();
    _topOfertantes = await _controller.getTopOfertantes();
    _peoresClientes = await _controller.getTopClientesMalos();
    _peoresOfertantes = await _controller.getTopOfertantesMalos();
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
                    Row(
                      children: [
                        Expanded(
                          child: DynamicListWidget(
                            title: 'Autos',
                            items: _autos,
                            displayFunction: (auto) =>
                                'Placa: ${auto['placa']}',
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: DynamicListWidget(
                            title: 'Garajes',
                            items: _garajes,
                            displayFunction: (garaje) =>
                                'Dirección: ${garaje['direccion']}',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: DynamicListWidget(
                            title: 'Reservaciones',
                            items: _reservaciones,
                            displayFunction: (reservacion) =>
                                'ID: ${reservacion['id']}',
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                    //Parte de los requerimientos
                    DynamicListWidget(
                      title: 'Top 20 Clientes',
                      items: _topClientes,
                      displayFunction: (cliente) =>
                          '${cliente['nombre_cliente']} - ${cliente['promedio_calificacion_clientes']}',
                    ),
                    DynamicListWidget(
                      title: 'Top 20 Ofertantes',
                      items: _topOfertantes,
                      displayFunction: (ofertante) =>
                          '${ofertante['nombre_ofertante']} - ${ofertante['promedio_calificacion_garajes']}',
                    ),
                    DynamicListWidget(
                      title: 'Peores Clientes',
                      items: _peoresClientes,
                      displayFunction: (cliente) =>
                          '${cliente['nombre_cliente']} - ${cliente['promedio_calificacion_clientes']}',
                    ),
                    DynamicListWidget(
                      title: 'Peores Ofertantes',
                      items: _peoresOfertantes,
                      displayFunction: (ofertante) =>
                          '${ofertante['nombre_ofertante']} - ${ofertante['promedio_calificacion_garajes']}',
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
