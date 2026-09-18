import 'package:flutter/material.dart';

import 'models/course.dart';
import 'widgets/course_card.dart';
import 'widgets/header_banner.dart';

class AcademicDashboardScreen extends StatefulWidget {
  const AcademicDashboardScreen({super.key});

  @override
  State<AcademicDashboardScreen> createState() =>
      _AcademicDashboardScreenState();
}

class _AcademicDashboardScreenState
    extends State<AcademicDashboardScreen> {
  // Data jadwal praktikum hari ini.
  // Kita tetap menggunakan model Course yang sudah ada,
  // jadi tidak perlu membuat file/model baru.
  final List<Course> _practicums = const [
    Course(
      code: '08.00 – 10.00',
      name: 'Mobile Programming',
      lecturer: 'Sedang digunakan',
      sks: 0,
      progress: 0,
      room: 'Lab 1',
    ),
    Course(
      code: '10.00 – 12.00',
      name: 'Rekayasa Perangkat Lunak',
      lecturer: 'Belum dimulai',
      sks: 0,
      progress: 0,
      room: 'Lab 2',
    ),
    Course(
      code: '13.00 – 15.00',
      name: 'Basis Data',
      lecturer: 'Selesai',
      sks: 0,
      progress: 0,
      room: 'Lab 3',
    ),
    Course(
      code: '15.00 – 17.00',
      name: 'Lab 2',
      lecturer: 'Belum dimulai',
      sks: 0,
      progress: 0,
      room: 'Lab Komputer',
    ),
  ];

  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness:
              _isDarkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ruang Praktikum Hari Ini',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                _isDarkMode
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
              ),
              tooltip: _isDarkMode
                  ? 'Mode Terang'
                  : 'Mode Gelap',
              onPressed: _toggleDarkMode,
            ),
          ],
        ),

        body: LayoutBuilder(
          builder: (context, constraints) {
            // ==================================
            // TABLET / DESKTOP
            // ==================================
            if (constraints.maxWidth >= 600) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const HeaderBanner(),

                    const SizedBox(height: 16),

                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.65,
                        ),
                        itemCount: _practicums.length,
                        itemBuilder: (context, index) {
                          return CourseCard(
                            course: _practicums[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            // ==================================
            // SMARTPHONE
            // ==================================
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const HeaderBanner(),

                const SizedBox(height: 16),

                ..._practicums.map(
                  (practicum) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: CourseCard(
                      course: practicum,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}