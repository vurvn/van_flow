import 'package:flutter/material.dart';
import '../../core/injection/injection.dart';
import '../../core/services/analytics_service.dart';

class OrderCompletionPage extends StatefulWidget {
  final String districtId;
  final String districtName;
  final double revenue;
  final double distance;

  const OrderCompletionPage({
    super.key,
    required this.districtId,
    required this.districtName,
    required this.revenue,
    required this.distance,
  });

  @override
  State<OrderCompletionPage> createState() => _OrderCompletionPageState();
}

class _OrderCompletionPageState extends State<OrderCompletionPage> {
  bool? _wasChained;
  double _durationHours = 1.0;

  Future<void> _submit() async {
    if (_wasChained == null) return;

    await sl<AnalyticsService>().recordOrderExecution(
      districtId: widget.districtId,
      revenue: widget.revenue,
      distance: widget.distance,
      durationHours: _durationHours,
      wasChained: _wasChained!,
    );

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã cập nhật dữ liệu học máy!'), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('HOÀN THÀNH: ${widget.districtName}'), backgroundColor: Colors.grey[900]),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('THỜI GIAN THỰC HIỆN?', style: TextStyle(color: Colors.white70)),
            Slider(
              value: _durationHours,
              min: 0.5,
              max: 5.0,
              divisions: 9,
              label: '${_durationHours} giờ',
              onChanged: (v) => setState(() => _durationHours = v),
            ),
            const SizedBox(height: 30),
            const Text('BẠN CÓ ĐƠN MỚI NGAY LẬP TỨC KHÔNG?', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildChoiceButton('CÓ (NỐI ĐƠN)', true, Colors.greenAccent),
                const SizedBox(width: 16),
                _buildChoiceButton('KHÔNG (TRỐNG)', false, Colors.redAccent),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _wasChained != null ? _submit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text('CẬP NHẬT PHÂN TÍCH', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceButton(String label, bool value, Color color) {
    final isSelected = _wasChained == value;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _wasChained = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.2) : Colors.grey[900],
            border: Border.all(color: isSelected ? color : Colors.white10, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: isSelected ? color : Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
