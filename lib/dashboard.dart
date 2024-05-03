import 'package:flutter/material.dart';

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

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height, // Establece la altura del Container igual a la altura de la pantalla
            child: Container(
              width: 200.0, 
              color: Color.fromARGB(255, 156, 44, 44), // Color de fondo bg-zinc-900
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255), // Cambio de color a blanco
                    ),
                  ),
                  Text(
                    'Parking System',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white, // Cambio de color a blanco
                    ),
                  ),
                  SizedBox(height: 20.0),
                  NavItem(icon: '🏠', title: 'Dashboard'),
                  // Agrega más elementos de navegación aquí si es necesario
                ],
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                          title: 'Recent Candidates',
                          backgroundColor: Color(0xFF11151A), // Color de fondo bg-zinc-700
                          textColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent Candidates',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para los candidatos recientes si es necesario
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: DashboardCard(
                          title: 'Recent Open Positions',
                          backgroundColor: Color(0xFF11151A), // Color de fondo bg-zinc-700
                          textColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent Open Positions',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para las posiciones abiertas recientes si es necesario
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
                          title: 'Estadísticas de Uso',
                          backgroundColor: Color(0xFF11151A),
                          textColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Estadísticas de Uso',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para las estadísticas de uso si es necesario
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: DashboardCard(
                          title: 'Uso Actual',
                          backgroundColor: Color(0xFF11151A),
                          textColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Uso Actual',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para el uso actual si es necesario
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: DashboardCard(
                          title: 'Top 20 Clientes',
                          backgroundColor: Color(0xFF11151A),
                          textColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top 20 Clientes',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para los top 20 clientes si es necesario
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
                          title: 'Top 20 Ofertantes',
                          backgroundColor: Color(0xFF11151A),
                          textColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top 20 Ofertantes',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para los top 20 ofertantes si es necesario
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
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para otro dashboard card si es necesario
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
                                style: TextStyle(fontSize: 16.0),
                              ),
                              // Agrega contenido para otro dashboard card si es necesario
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
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String icon;
  final String title;

  NavItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Text(icon, style: TextStyle(fontSize: 20.0)),
            SizedBox(width: 10.0),
            Text(title, style: TextStyle(color: Colors.white)), // Cambio de color a blanco
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final Color backgroundColor;
  final Color textColor;
  final Widget content;

  DashboardCard({
    this.icon = '',
    required this.title,
    this.value = '',
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0), // Redondea los bordes del card
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: TextStyle(fontSize: 20.0, color: textColor)),
              SizedBox(width: 10.0),
              Text(title, style: TextStyle(color: textColor)),
            ],
          ),
          SizedBox(height: 10.0),
          content,
        ],
      ),
    );
  }
}
