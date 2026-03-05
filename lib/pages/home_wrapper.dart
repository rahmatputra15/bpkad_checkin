import 'package:bpkad_checkin/pages/izin/izin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpkad_checkin/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:bpkad_checkin/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:bpkad_checkin/bloc/bottom_nav/bottom_nav_state.dart';
import 'package:bpkad_checkin/pages/home/home_page.dart';
import 'package:bpkad_checkin/pages/profile/profile_page.dart';
import 'package:bpkad_checkin/pages/history/history_page.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  static final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const IzinPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Scaffold(
        body: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return _pages[state.index];
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return SizedBox(
              height: 105,
              child: BottomNavigationBar(
                currentIndex: state.index,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  context.read<BottomNavBloc>().add(ChangeTabEvent(index));
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history_outlined),
                    label: 'Riwayat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.outbond_outlined),
                    label: 'Izin',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined),
                    label: 'Profile',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
