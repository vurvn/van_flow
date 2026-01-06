import 'package:flutter/material.dart';
import '../../core/models/district_profile.dart';
import '../../core/utils/score_engine.dart';
import 'order_completion_page.dart';

class EvaluationResultPage extends StatelessWidget {
  final double score;
  final Decision decision;
  final DistrictProfile profile;
  final double revenue;
  final double distance;

  const EvaluationResultPage({
    super.key,
    required this.score,
    required this.decision,
    required this.profile,
    required this.revenue,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (decision) {
      case Decision.accept:
        statusColor = Colors.greenAccent;
        statusText = 'CHẤP NHẬN';
        statusIcon = Icons.check_circle_outline;
        break;
      case Decision.consider:
        statusColor = Colors.orangeAccent;
        statusText = 'CÂN NHẮC';
        statusIcon = Icons.help_outline;
        break;
      case Decision.reject:
        statusColor = Colors.redAccent;
        statusText = 'TỪ CHỐI';
        statusIcon = Icons.cancel_outlined;
        break;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(statusIcon, size: 100, color: statusColor),
            Text(
              statusText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: statusColor,
                fontSize: 64,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'ĐIỂM SỐ: ${score.toStringAsFixed(0)}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            _buildWarningSection(),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _showReadyDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white10,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 80),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text('TIẾP THEO', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ),
    );
  }

  void _showReadyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('LƯU CHUYẾN ĐI?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: const Text(
          'Bạn có chấp nhận đơn này không? Lưu lại để hệ thống học (Learning Engine) và phân tích thu nhập.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Đóng dialog
              Navigator.pop(context); // Quay lại màn hình Eval
            },
            child: const Text('KHÔNG LƯU', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Đóng dialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderCompletionPage(
                    districtId: profile.districtId,
                    districtName: "Đơn vừa đánh giá",
                    revenue: revenue,
                    distance: distance,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent, foregroundColor: Colors.black),
            child: const Text('CHẤP NHẬN & LƯU', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningSection() {
    final List<Widget> warnings = [];

    if (!profile.isVanFriendly) {
      warnings.add(_WarningTag(label: 'XE TẢI KHÓ ĐI', icon: Icons.local_shipping, color: Colors.redAccent));
    }
    if (profile.hasTimeRestriction) {
      warnings.add(_WarningTag(label: 'CẤM GIỜ', icon: Icons.access_time_filled, color: Colors.orangeAccent));
    }
    if (profile.avgWaitingMinutes > 8) {
      warnings.add(_WarningTag(label: 'KẸT XE', icon: Icons.traffic, color: Colors.amberAccent));
    }

    if (warnings.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        const Text('CẢNH BÁO KHU VỰC', style: TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: warnings,
        ),
      ],
    );
  }
}

class _WarningTag extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _WarningTag({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
