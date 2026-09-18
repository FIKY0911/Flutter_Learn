import 'package:flutter/material.dart';
import 'package:omni_pos/core/constants/app_colors.dart';
import 'package:omni_pos/presentation/components/atoms/status_chip.dart';

class PosHeader extends StatelessWidget {
  final String storeName;
  final String standName;

  const PosHeader({
    super.key,
    this.storeName = 'CampusPOS',
    this.standName = 'Kantin Esa Unggul',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        children: [
          // Logo Toko / Kantin
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.storefront_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),

          // Jarak pemisah antara logo dan teks judul
          const SizedBox(width: 10),

          // Informasi Toko & Status Offline
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      storeName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const StatusChip(),
                  ],
                ),
                const SizedBox(height: 2), // Jarak vertikal antara nama toko dan stand
                Text(
                  standName,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          // Jarak sebelum avatar profil
          const SizedBox(width: 10),

          // Avatar Profil
          const CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}