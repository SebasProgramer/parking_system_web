import 'package:flutter/material.dart';
import 'package:parking_web/Controllers/dashboard_controller.dart';
import 'package:parking_web/Views/Components/Widgets/dynamic_list_widget.dart';
import 'package:parking_web/Views/Components/Widgets/header_widget.dart';
import 'package:parking_web/Views/Components/Widgets/sidebar_widget.dart';
import 'package:parking_web/Views/Components/dashboard_card.dart';


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

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    _autos = await _controller.getAutos();
    _garajes = await _controller.getGarajes();
    _reservaciones = await _controller.getReservaciones();
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
                    const HeaderWidget(title: 'Hello, Bro 👋', subtitle: 'Bienvenido al Dashboard de Parking System'),
                    Row(
                      children: [
                        Expanded(
                          child: DynamicListWidget(
                            title: 'Autos',
                            items: _autos,
                            displayFunction: (auto) => 'Placa: ${auto['placa']}',
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: DynamicListWidget(
                            title: 'Garajes',
                            items: _garajes,
                            displayFunction: (garaje) => 'Dirección: ${garaje['direccion']}',
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
                            displayFunction: (reservacion) => 'ID: ${reservacion['id']}',
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Expanded(
                          child: DashboardCard(
                            title: 'Otro Dashboard Card',
                            backgroundColor: Color(0xFF11151A),
                            textColor: Colors.white,
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contenido de otro Dashboard Card',
                                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
