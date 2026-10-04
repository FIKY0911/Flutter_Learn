import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';
import 'detail_page_example.dart';

class PushBackScreen extends StatefulWidget {
  const PushBackScreen({super.key});

  @override
  State<PushBackScreen> createState() => _PushBackScreenState();
}

class _PushBackScreenState extends State<PushBackScreen> {
  String _returnedResult = 'Belum ada data kembalian';
  final TextEditingController _inputController = TextEditingController(text: 'Halo dari Halaman Awal!');

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Future<void> _navigateToDetailAndAwaitResult() async {
    // 1. PUSH TO NEW ROUTE & WAIT FOR RESULT
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPageExample(
          passedMessage: _inputController.text,
        ),
      ),
    );

    // 2. RECEIVE POPPED RESULT
    if (result != null) {
      setState(() {
        _returnedResult = result;
      });
    } else {
      setState(() {
        _returnedResult = 'Pengguna menekan tombol back tanpa membawa data.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push & Back Navigation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Push with Parameter & Await Result
          DemoSectionCard(
            title: '1. Navigator.push & Navigator.pop',
            subtitle: 'Membuka route baru dengan passing parameter dan menerima data balikan saat di-pop.',
            codeSnippet: 'final result = await Navigator.push(context, MaterialPageRoute(...))',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _inputController,
                  decoration: const InputDecoration(
                    labelText: 'Pesan yang akan dikirim ke halaman detail',
                    prefixIcon: Icon(Icons.send_rounded),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _navigateToDetailAndAwaitResult,
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Push ke Halaman Detail (Await Result)'),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.outline),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hasil Balikan (Return Data from Pop):',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textMuted),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _returnedResult,
                        style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
