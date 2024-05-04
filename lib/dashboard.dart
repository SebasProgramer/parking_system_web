import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://parkingsystem-hjcb.onrender.com';

  Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ApiService _apiService = ApiService();
  List<dynamic> _autos = [];
  List<dynamic> _garajes = [];
  List<dynamic> _reservaciones = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final autos = await _apiService.fetchData('autos/getAllAutos');
      final garajes = await _apiService.fetchData('garajes/getAllGarajes');
      final reservaciones = await _apiService.fetchData('reservaciones/getAllReservaciones');
      setState(() {
        _autos = autos;
        _garajes = garajes;
        _reservaciones = reservaciones;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              width: 200.0,
              color: Color.fromARGB(255, 156, 44, 44),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    'Parking System',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  NavItem(icon: '🏠', title: 'Dashboard'),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      'Hello, Bro 👋',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Text(
                      'Bienvenido al Dashboard de Parking System',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: 'Autos',
                            backgroundColor: Color(0xFF11151A),
                            textColor: Colors.white,
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                SizedBox(height: 10.0),
                                ..._autos.map((auto) => Text('Placa: ${auto['placa']}', style: TextStyle(color: Colors.white)))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: DashboardCard(
                            title: 'Garajes',
                            backgroundColor: Color(0xFF11151A),
                            textColor: Colors.white,
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [                                
                                SizedBox(height: 10.0),
                                ..._garajes.map((garaje) => Text('Dirección: ${garaje['direccion']}', style: TextStyle(color: Colors.white)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: 'Reservaciones',
                            backgroundColor: Color(0xFF11151A),
                            textColor: Colors.white,
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [                               
                                SizedBox(height: 10.0),
                                ..._reservaciones.map((reservacion) => Text('ID: ${reservacion['id']}', style: TextStyle(color: Colors.white)))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
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
                        SizedBox(width: 10.0),
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

class DashboardCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Widget content;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(height: 10.0),
          content,
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String icon;
  final String title;

  const NavItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            icon,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
