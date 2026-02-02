import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC107),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kehadiran Anak',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF3B0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: ListView(
                  children: const [
                    AttendanceCard(
                      nama: "M. Ra'uf W.",
                      kelas: "X PPLG 2",
                      tanggal: "02-02-2026",
                      status: AttendanceStatus.hadir,
                    ),
                    AttendanceCard(
                      nama: "M. Ra'uf W.",
                      kelas: "X PPLG 2",
                      tanggal: "03-02-2026",
                      status: AttendanceStatus.izin,
                    ),
                    AttendanceCard(
                      nama: "M. Ra'uf W.",
                      kelas: "X PPLG 2",
                      tanggal: "04-02-2026",
                      status: AttendanceStatus.alpha,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum AttendanceStatus { hadir, izin, alpha }

class AttendanceCard extends StatelessWidget {
  final String nama;
  final String kelas;
  final String tanggal;
  final AttendanceStatus status;

  const AttendanceCard({
    super.key,
    required this.nama,
    required this.kelas,
    required this.tanggal,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statusStyle = _statusStyle(status);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _infoRow(label: 'Nama', value: nama),
          const SizedBox(height: 6),
          _infoRow(label: 'Tanggal', value: tanggal),
          const SizedBox(height: 6),
          _infoRow(label: 'Kelas', value: kelas),

          const SizedBox(height: 12),

          Row(
            children: [
              const Text(
                'Keterangan : ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusStyle.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  statusStyle.label,
                  style: TextStyle(
                    color: statusStyle.text,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow({required String label, required String value}) {
    return Row(
      children: [
        SizedBox(
          width: 70, // menjaga alignment rapi
          child: Text(
            '$label :',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }

  _StatusStyle _statusStyle(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.hadir:
        return _StatusStyle(
          label: "Hadir",
          background: const Color(0xFFE6F4EA),
          text: Colors.green,
        );
      case AttendanceStatus.izin:
        return _StatusStyle(
          label: "Izin",
          background: const Color(0xFFFFF4E5),
          text: Colors.orange,
        );
      case AttendanceStatus.alpha:
        return _StatusStyle(
          label: "Alpha",
          background: const Color(0xFFFDECEC),
          text: Colors.red,
        );
    }
  }
}

class _StatusStyle {
  final String label;
  final Color background;
  final Color text;

  _StatusStyle({
    required this.label,
    required this.background,
    required this.text,
  });
}
