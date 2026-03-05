import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime? _selectedFilter;

  String _getDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return 'Hari ini';
    } else if (dateToCheck == yesterday) {
      return 'Kemarin';
    } else {
      return DateFormat('dd MMMM yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Aktifitas Terakhir Saya",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    PopupMenuButton<DateTime?>(
                      icon: Icon(Icons.filter_list_outlined, size: 30),
                      offset: Offset(0, 40),
                      color: Colors.white,
                      onSelected: (DateTime? result) {
                        setState(() {
                          _selectedFilter = result;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<DateTime?>>[
                            PopupMenuItem<DateTime?>(
                              value: DateTime.now(),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Hari Ini')),
                                  if (_selectedFilter != null &&
                                      DateTime(
                                            _selectedFilter!.year,
                                            _selectedFilter!.month,
                                            _selectedFilter!.day,
                                          ) ==
                                          DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            DateTime.now().day,
                                          ))
                                    Icon(Icons.check, color: Colors.blue),
                                ],
                              ),
                            ),
                            PopupMenuItem<DateTime?>(
                              value: DateTime.now().subtract(Duration(days: 1)),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Kemarin')),
                                  if (_selectedFilter != null &&
                                      DateTime(
                                            _selectedFilter!.year,
                                            _selectedFilter!.month,
                                            _selectedFilter!.day,
                                          ) ==
                                          DateTime(
                                            DateTime.now()
                                                .subtract(Duration(days: 1))
                                                .year,
                                            DateTime.now()
                                                .subtract(Duration(days: 1))
                                                .month,
                                            DateTime.now()
                                                .subtract(Duration(days: 1))
                                                .day,
                                          ))
                                    Icon(Icons.check, color: Colors.blue),
                                ],
                              ),
                            ),
                            PopupMenuItem<DateTime?>(
                              value: DateTime.now().subtract(Duration(days: 7)),
                              child: Row(
                                children: [
                                  Expanded(child: Text('7 Hari Terakhir')),
                                  if (_selectedFilter != null &&
                                      DateTime(
                                            _selectedFilter!.year,
                                            _selectedFilter!.month,
                                            _selectedFilter!.day,
                                          ) ==
                                          DateTime(
                                            DateTime.now()
                                                .subtract(Duration(days: 7))
                                                .year,
                                            DateTime.now()
                                                .subtract(Duration(days: 7))
                                                .month,
                                            DateTime.now()
                                                .subtract(Duration(days: 7))
                                                .day,
                                          ))
                                    Icon(Icons.check, color: Colors.blue),
                                ],
                              ),
                            ),
                            PopupMenuItem<DateTime?>(
                              value: DateTime.now().subtract(
                                Duration(days: 30),
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: Text('30 Hari Terakhir')),
                                  if (_selectedFilter != null &&
                                      DateTime(
                                            _selectedFilter!.year,
                                            _selectedFilter!.month,
                                            _selectedFilter!.day,
                                          ) ==
                                          DateTime(
                                            DateTime.now()
                                                .subtract(Duration(days: 30))
                                                .year,
                                            DateTime.now()
                                                .subtract(Duration(days: 30))
                                                .month,
                                            DateTime.now()
                                                .subtract(Duration(days: 30))
                                                .day,
                                          ))
                                    Icon(Icons.check, color: Colors.blue),
                                ],
                              ),
                            ),
                            PopupMenuDivider(),
                            PopupMenuItem<DateTime?>(
                              value: null,
                              child: Row(
                                children: [
                                  Expanded(child: Text('Tampilkan Semua')),
                                  if (_selectedFilter == null)
                                    Icon(Icons.check, color: Colors.blue),
                                ],
                              ),
                            ),
                          ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildActivityList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityList() {
    // Sample data grouped by date
    final now = DateTime.now();
    final allActivityGroups = {
      now: [
        _ActivityItem(
          title: 'Masuk wilayah kantor',
          time: '10:30 AM',
          icon: Icons.location_on,
          color: Colors.green,
        ),
        _ActivityItem(
          title: 'Masuk wilayah kantor (Jam Pulang)',
          time: '16:27',
          icon: Icons.check_circle,
          color: Colors.blue,
        ),
      ],
      now.subtract(Duration(days: 1)): [
        _ActivityItem(
          title: 'Masuk wilayah kantor',
          time: '13:07',
          icon: Icons.location_on,
          color: Colors.green,
        ),
        _ActivityItem(
          title: 'Keluar wilayah kantor',
          time: '12:00',
          icon: Icons.location_off,
          color: Colors.red,
        ),
        _ActivityItem(
          title: 'Masuk wilayah kantor',
          time: '10:05',
          icon: Icons.location_on,
          color: Colors.green,
        ),
        _ActivityItem(
          title: 'Keluar wilayah kantor',
          time: '09:45',
          icon: Icons.location_off,
          color: Colors.red,
        ),
      ],
      now.subtract(Duration(days: 4)): [
        _ActivityItem(
          title: 'Masuk wilayah kantor',
          time: '08:01',
          icon: Icons.location_on,
          color: Colors.green,
        ),
      ],
    };

    // Filter activity groups based on selected filter
    Map<DateTime, List<_ActivityItem>> filteredGroups;

    if (_selectedFilter == null) {
      filteredGroups = allActivityGroups;
    } else {
      final filterDate = DateTime(
        _selectedFilter!.year,
        _selectedFilter!.month,
        _selectedFilter!.day,
      );

      filteredGroups = {};
      allActivityGroups.forEach((date, activities) {
        final dateOnly = DateTime(date.year, date.month, date.day);
        if (dateOnly.isAfter(filterDate) ||
            dateOnly.isAtSameMomentAs(filterDate)) {
          filteredGroups[date] = activities;
        }
      });
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredGroups.keys.length,
      itemBuilder: (context, index) {
        final date = filteredGroups.keys.toList()[index];
        final activities = filteredGroups[date]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                _getDateLabel(date),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
            ...activities.map((activity) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: activity.color.withValues(alpha: 0.15),
                        ),
                        child: Icon(
                          activity.icon,
                          size: 28,
                          color: activity.color,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              activity.time,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

class _ActivityItem {
  final String title;
  final String time;
  final IconData icon;
  final Color color;

  _ActivityItem({
    required this.title,
    required this.time,
    required this.icon,
    required this.color,
  });
}
