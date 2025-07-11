import 'package:flutter/material.dart';
import '../../models/profile_info.dart';

class ProfileInfoSection extends StatelessWidget {
  final ProfileInfo profileInfo;
  const ProfileInfoSection({Key? key, required this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Enhance UI for profile info section
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final result in profileInfo.results ?? [])
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (result.title != null)
                Text(result.title!, style: const TextStyle(fontWeight: FontWeight.bold)),
              if (result.desc != null)
                Text(result.desc!),
              const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }
} 