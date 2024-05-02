import 'package:flutter/material.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime _selectedDate = DateTime.now();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _selectedDate.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF942222),
        title: Center(
          child: Text(
            'Parking System Dashboard',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Color(0xFFFaf5e6),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: Color(0xFFFaf5e6),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8.0),
                Text(
                  'Selecciona la Fecha',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 450.0),
                  child: TextField(
                    controller: _controller,
                    readOnly: true,
                    onTap: () async {
                      final pickedDate = await showWebDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2010),
                        lastDate:
                            DateTime.now().add(const Duration(days: 14000)),
                        width: 300,
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate = pickedDate;
                          _controller.text = pickedDate.toString();
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fecha',
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Color(0xFFFaf5e6),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      DashboardCard(
                        title: 'Estadísticas de uso',
                        value: '...',
                        percentage: '',
                      ),
                      DashboardCard(
                        title: 'Uso actual',
                        value: '...',
                        percentage: '',
                      ),
                      DashboardCard(
                        title: 'Promedios de precios',
                        value: '...',
                        percentage: '',
                      ),
                      _buildRejectionsCard(
                        title: 'Rechazos por cliente',
                        value: '...',
                        percentage: '',
                      ),
                      _buildRejectionsCard(
                        title: 'Rechazos por ofertantes',
                        value: '...',
                        percentage: '',
                      ),
                      DashboardCard(
                        title: 'Top 20 Ofertantes',
                        value: '...',
                        percentage: '',
                      ),
                      DashboardCard(
                        title: 'Top 20 Clientes',
                        value: '...',
                        percentage: '',
                      ),
                      DashboardCard(
                        title: 'Ofertantes con peores calificaciones',
                        value: '...',
                        percentage: '',
                      ),
                      DashboardCard(
                        title: 'Clientes con peores calificaciones',
                        value: '...',
                        percentage: '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRejectionsCard({
    required String title,
    required String value,
    required String percentage,
  }) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  percentage,
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'vs 30 días anteriores',
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0), // Espacio entre el contenido y el botón
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón "Ver más"
              },
              child: Text('Ver más'),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;

  DashboardCard({
    required this.title,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'vs 30 días anteriores',
              style: TextStyle(fontSize: 10.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
