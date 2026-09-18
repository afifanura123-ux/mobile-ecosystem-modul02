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
  // Data praktikum hari ini
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
      lecturer: 'Akan datang',
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
      lecturer: 'Tersedia',
      sks: 0,
      progress: 0,
      room: 'Ruang tersedia',
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
        // ============================================
        // APP BAR
        // ============================================
        appBar: AppBar(
          title: const Text(
            'Ruang Praktikum Hari Ini',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: _toggleDarkMode,
              tooltip: _isDarkMode
                  ? 'Mode Terang'
                  : 'Mode Gelap',
              icon: Icon(
                _isDarkMode
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
              ),
            ),
          ],
        ),

        // ============================================
        // BODY RESPONSIVE
        // ============================================
        body: LayoutBuilder(
          builder: (context, constraints) {
            // ========================================
            // TABLET / DESKTOP
            // ========================================
           if (constraints.maxWidth >= 600) {
  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 1100,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          24,
          20,
          24,
          20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderBanner(),

            const SizedBox(height: 16),

            LayoutBuilder(
              builder: (context, gridConstraints) {
                final cardWidth =
                    (gridConstraints.maxWidth - 14) / 2;

                return Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: _practicums.map((practicum) {
                    return SizedBox(
                      width: cardWidth,
                      height: 200,
                      child: CourseCard(
                        course: practicum,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
            // ========================================
            // SMARTPHONE
            // ========================================
            return ListView(
              padding: const EdgeInsets.fromLTRB(
                16,
                20,
                16,
                20,
              ),
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