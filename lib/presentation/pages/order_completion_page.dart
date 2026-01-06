import 'package:flutter/material.dart';
import '../../core/injection/injection.dart';
import '../../core/services/analytics_service.dart';

class OrderCompletionPage extends StatefulWidget {
  final int? orderId;
  final String? startDistrictName;
  final String? targetDistrictName;
  final String districtId;
  final double revenue;
  final double distance;

  const OrderCompletionPage({
    super.key,
    this.orderId,
    this.startDistrictName,
    this.targetDistrictName,
    required this.districtId,
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
      orderId: widget.orderId,
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
      appBar: AppBar(
        title: const Text('XÁC NHẬN HOÀN THÀNH', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTripSummaryCard(),
            const SizedBox(height: 32),
            _buildSectionTitle('THỜI GIAN THỰC HIỆN'),
            const SizedBox(height: 8),
            _buildDurationPicker(),
            const SizedBox(height: 40),
            _buildSectionTitle('TRẠNG THÁI NỐI ĐƠN'),
            const SizedBox(height: 16),
            _buildChainSelection(),
            const SizedBox(height: 40),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTripSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildLocationInfo('ĐIỂM ĐI', widget.startDistrictName ?? 'N/A', Icons.radio_button_checked, Colors.blueAccent),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
              ),
              _buildLocationInfo('ĐIỂM ĐẾN', widget.targetDistrictName ?? 'N/A', Icons.location_on, Colors.amberAccent),
            ],
          ),
          const Divider(height: 32, color: Colors.white10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetric('QUÃNG ĐƯỜNG', '${widget.distance.toStringAsFixed(1)} km'),
              _buildMetric('CƯỚC PHÍ', '${widget.revenue.toStringAsFixed(0)}đ'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo(String label, String name, IconData icon, Color color) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(icon, color: color, size: 14),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildDurationPicker() {
    return Column(
      children: [
        Slider(
          value: _durationHours,
          min: 0.5,
          max: 5.0,
          divisions: 9,
          activeColor: Colors.blueAccent,
          label: '${_durationHours} giờ',
          onChanged: (v) => setState(() => _durationHours = v),
        ),
        Text(
          'Tổng thời gian: ${_durationHours} giờ',
          style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildChainSelection() {
    return Row(
      children: [
        _buildChoiceButton('CÓ (NỐI ĐƠN)', true, Colors.greenAccent, Icons.link),
        const SizedBox(width: 16),
        _buildChoiceButton('KHÔNG (TRỐNG)', false, Colors.redAccent, Icons.link_off),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _wasChained != null ? _submit : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
        disabledBackgroundColor: Colors.white10,
        minimumSize: const Size(double.infinity, 70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: const Text('XÁC NHẬN & CẬP NHẬT AI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 1.5, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildChoiceButton(String label, bool value, Color color, IconData icon) {
    final isSelected = _wasChained == value;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _wasChained = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.15) : Colors.grey[900],
            border: Border.all(color: isSelected ? color : Colors.white10, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, color: isSelected ? color : Colors.white24, size: 24),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(color: isSelected ? color : Colors.white70, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
