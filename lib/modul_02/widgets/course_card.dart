import 'package:flutter/material.dart';

import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final status = course.lecturer;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Color(0xFFDDE3EA),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // JUDUL + STATUS
            // =========================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    course.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                _StatusBadge(status: status),
              ],
            ),

            const SizedBox(height: 12),

            // =========================
            // WAKTU
            // =========================
            _DetailRow(
              icon: Icons.access_time_outlined,
              text: course.code,
            ),

            const SizedBox(height: 7),

            // =========================
            // RUANGAN
            // =========================
            _DetailRow(
              icon: Icons.location_on_outlined,
              text: course.room,
            ),

            const SizedBox(height: 12),

            // =========================
            // STATUS DETAIL
            // =========================
            _StatusBox(status: status),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// STATUS BADGE
// ======================================================

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color background;
    Color textColor;
    String text;

    if (status == 'Sedang digunakan') {
      background = const Color(0xFF168BD2);
      textColor = Colors.white;
      text = 'Berlangsung';
    } else if (status == 'Selesai') {
      background = const Color(0xFFE3E6EA);
      textColor = const Color(0xFF374151);
      text = 'Selesai';
    } else if (status == 'Tersedia') {
      background = const Color(0xFF38A879);
      textColor = Colors.white;
      text = 'Tersedia';
    } else {
      background = const Color(0xFFFFE7B0);
      textColor = const Color(0xFF8A5700);
      text = 'Akan datang';
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ======================================================
// DETAIL ROW
// ======================================================

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DetailRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 24,
          child: Icon(
            Icons.access_time_outlined,
            size: 20,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF374151),
            ),
          ),
        ),
      ],
    );
  }
}

// ======================================================
// STATUS BOX
// ======================================================

class _StatusBox extends StatelessWidget {
  final String status;

  const _StatusBox({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color background;
    Color iconColor;
    IconData icon;
    String text;

    if (status == 'Sedang digunakan') {
      background = const Color(0xFFE3F2FD);
      iconColor = const Color(0xFF1479B8);
      icon = Icons.groups_outlined;
      text = 'Sedang digunakan\noleh praktikan';
    } else if (status == 'Selesai') {
      background = const Color(0xFFF0F3F6);
      iconColor = const Color(0xFF374151);
      icon = Icons.check_circle_outline;
      text = 'Sesi telah selesai';
    } else if (status == 'Tersedia') {
      background = const Color(0xFFE1F5EB);
      iconColor = const Color(0xFF23845E);
      icon = Icons.meeting_room_outlined;
      text = 'Siap digunakan\nuntuk praktikum lain';
    } else {
      background = const Color(0xFFFFF5DD);
      iconColor = const Color(0xFF795000);
      icon = Icons.access_time_outlined;
      text = 'Sesi akan dimulai\nsebentar lagi';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
            color: iconColor,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: iconColor,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}