import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OrderOverlayWidget extends StatefulWidget {
  const OrderOverlayWidget({super.key});

  @override
  State<OrderOverlayWidget> createState() => _OrderOverlayWidgetState();
}

class _OrderOverlayWidgetState extends State<OrderOverlayWidget> {
  Map<String, dynamic>? _data;

  @pragma('vm:entry-point')
  @override
  void initState() {
    super.initState();
    FlutterOverlayWindow.overlayListener.listen((data) {
      if (data is Map<String, dynamic>) {
        setState(() {
          _data = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_data == null) return const SizedBox.shrink();

    final score = (_data!['score'] as num? ?? 0).toDouble();
    final decision = _data!['decision'] as String? ?? 'consider';
    final fee = (_data!['fee'] as num? ?? 0).toDouble();
    final target = _data!['target'] as String? ?? 'N/A';
    final distance = (_data!['distance'] as num? ?? 0).toDouble();
    final isVanFriendly = _data!['isVanFriendly'] as bool? ?? true;

    // Tính toán lợi nhuận ròng hiển thị nhanh
    final netProfit = fee - (distance * 3500);

    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (score >= 40000) {
      statusColor = Colors.greenAccent;
      statusText = 'NHẬN NGAY';
      statusIcon = Icons.bolt;
    } else if (score >= 0) {
      statusColor = Colors.orangeAccent;
      statusText = 'CÂN NHẮC';
      statusIcon = Icons.priority_high;
    } else {
      statusColor = Colors.redAccent;
      statusText = 'BỎ QUA';
      statusIcon = Icons.close;
    }

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: statusColor, width: 4),
            boxShadow: [
              BoxShadow(color: statusColor.withOpacity(0.4), blurRadius: 25, spreadRadius: 5)
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                    child: Icon(statusIcon, color: Colors.black, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusText,
                          style: TextStyle(color: statusColor, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -1),
                        ),
                        Text(
                          'ĐIỂM HỆ THỐNG: ${score.toStringAsFixed(0)}',
                          style: TextStyle(color: statusColor.withOpacity(0.7), fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white24),
                    onPressed: () => FlutterOverlayWindow.closeOverlay(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildLargeMetric('LỢI NHUẬN DỰ TÍNH', '${netProfit.toStringAsFixed(0)}đ', Colors.white),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    _buildMiniRow(Icons.location_on, 'ĐIỂM ĐẾN:', target, Colors.blueAccent),
                    const SizedBox(height: 10),
                    _buildMiniRow(Icons.straighten, 'QUÃNG ĐƯỜNG:', '${distance}km', Colors.white70),
                  ],
                ),
              ),
              if (!isVanFriendly) ...[
                const SizedBox(height: 16),
                _buildWarning('CẢNH BÁO: ĐƯỜNG CẤM/HẸP'),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => FlutterOverlayWindow.closeOverlay(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: statusColor,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 65),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  elevation: 0,
                ),
                child: const Text('XÁC NHẬN', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLargeMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontSize: 42, fontWeight: FontWeight.bold, letterSpacing: -1)),
      ],
    );
  }

  Widget _buildMiniRow(IconData icon, String label, String value, Color iconColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 16),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white30, fontSize: 12, fontWeight: FontWeight.bold)),
        const Spacer(),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildWarning(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Colors.redAccent.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 16),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.redAccent, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
