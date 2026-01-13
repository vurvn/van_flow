import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OrderOverlayWidget extends StatefulWidget {
  const OrderOverlayWidget({super.key});

  @override
  State<OrderOverlayWidget> createState() => _OrderOverlayWidgetState();
}

class _OrderOverlayWidgetState extends State<OrderOverlayWidget> {
  Map<String, dynamic>? _data;

  @override
  void initState() {
    super.initState();
    // Lắng nghe dữ liệu từ Background Service
    FlutterOverlayWindow.overlayListener.listen((data) {
      setState(() {
        _data = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_data == null) return const SizedBox.shrink();

    final score = _data!['score'] as double;
    final decision = _data!['decision'] as String;
    final fee = _data!['fee'] as double;
    final target = _data!['target'] as String;
    final distance = _data!['distance'] as double;
    final isVanFriendly = _data!['isVanFriendly'] as bool;

    Color statusColor;
    String statusText;

    switch (decision) {
      case 'accept':
        statusColor = Colors.greenAccent;
        statusText = 'CHẤP NHẬN';
        break;
      case 'consider':
        statusColor = Colors.orangeAccent;
        statusText = 'CÂN NHẮC';
        break;
      default:
        statusColor = Colors.redAccent;
        statusText = 'TỪ CHỐI';
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: statusColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: statusColor.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'ĐIỂM: ${score.toStringAsFixed(0)}',
                      style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => FlutterOverlayWindow.closeOverlay(),
                ),
              ],
            ),
            const Divider(color: Colors.white10, height: 24),
            _buildInfoRow(Icons.monetization_on, 'CƯỚC:', '${fee.toStringAsFixed(0)}đ', Colors.amberAccent),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.location_on, 'ĐẾN:', target, Colors.blueAccent),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.route, 'QUÃNG ĐƯỜNG:', '${distance.toStringAsFixed(1)}km', Colors.white70),
            if (!isVanFriendly) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning, color: Colors.redAccent, size: 16),
                    SizedBox(width: 8),
                    Text('KHU VỰC KHÓ ĐI CHO XE VAN', style: TextStyle(color: Colors.redAccent, fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => FlutterOverlayWindow.closeOverlay(),
              style: ElevatedButton.styleFrom(
                backgroundColor: statusColor,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('OK, ĐÃ HIỂU', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
