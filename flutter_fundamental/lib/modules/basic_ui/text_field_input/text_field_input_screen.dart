import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class TextFieldInputScreen extends StatefulWidget {
  const TextFieldInputScreen({super.key});

  @override
  State<TextFieldInputScreen> createState() => _TextFieldInputScreenState();
}

class _TextFieldInputScreenState extends State<TextFieldInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _simpleController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  bool _obscurePassword = true;
  String _liveInputText = '';

  @override
  void dispose() {
    _simpleController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field & Input'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Basic TextField with Live Mirror
          DemoSectionCard(
            title: '1. Standard TextField & Controller',
            subtitle: 'Membaca input teks langsung (real-time) menggunakan TextEditingController.',
            codeSnippet: 'TextField(controller: _controller, onChanged: (v) {})',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _simpleController,
                  decoration: InputDecoration(
                    hintText: 'Ketik sesuatu di sini...',
                    prefixIcon: const Icon(Icons.edit_note_rounded),
                    suffixIcon: _simpleController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded),
                            onPressed: () {
                              _simpleController.clear();
                              setState(() => _liveInputText = '');
                            },
                          )
                        : null,
                  ),
                  onChanged: (val) {
                    setState(() => _liveInputText = val);
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  'Output Live: ${_liveInputText.isEmpty ? "(belum ada teks)" : _liveInputText}',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
              ],
            ),
          ),

          // 2. Form with Validation (TextFormField)
          DemoSectionCard(
            title: '2. Form Validation & Password Toggle',
            subtitle: 'TextFormField dengan validator email, password toggle obscure, dan FormKey.',
            codeSnippet: 'TextFormField(validator: (val) => ...)',
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukkan nama Anda',
                      prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Alamat Email',
                      hintText: 'contoh@domain.com',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Kata sandi minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Form Berhasil Divalidasi!'),
                              backgroundColor: AppColors.secondary,
                            ),
                          );
                        }
                      },
                      child: const Text('Validasi Form'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Multi-line TextArea
          DemoSectionCard(
            title: '3. Multiline Input / Catatan',
            subtitle: 'Input teks panjang dengan baris fleksibel (maxLines / minLines).',
            codeSnippet: 'TextField(maxLines: 3, keyboardType: TextInputType.multiline)',
            child: TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Tulis catatan atau instruksi khusus di sini...',
                alignLabelWithHint: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
