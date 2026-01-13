import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import '../../core/models/district_profile.dart';
import '../../core/services/district_service.dart';
import '../../core/services/background_service.dart'; // Import NotificationHandler
import '../../core/utils/score_engine.dart';
import '../../core/utils/profit_calculator.dart';
import '../../core/utils/app_constants.dart';
import 'evaluation_result_page.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  double _fee = 150000;
  double _emptyKm = 2.0;
  double _deliveryKm = 10.0;
  
  DistrictData? _startDistrict;
  DistrictData? _targetDistrict;
  List<DistrictData> _districts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDistricts();
  }

  Future<void> _loadDistricts() async {
    final districts = await DistrictService.loadDistricts();
    setState(() {
      _districts = districts;
      if (districts.isNotEmpty) {
        _startDistrict = districts[0];
        _targetDistrict = districts[1 % districts.length];
      }
      _isLoading = false;
    });
  }

  void _simulateNotification(String content) async {
    bool hasOverlayPermission = await FlutterOverlayWindow.isPermissionGranted();
    if (!hasOverlayPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng cấp quyền "Hiển thị trên ứng dụng khác" trước!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      await FlutterOverlayWindow.requestPermission();
      return;
    }

    NotificationHandler.simulate(content);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🚀 Giả lập: ${content.split('-').first}'),
        backgroundColor: Colors.blueGrey[800],
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _evaluate() {
    if (_targetDistrict == null) return;

    final order = OrderInput(
      fee: _fee,
      emptyKm: _emptyKm,
      trafficMinutes: 15,
    );

    final score = ScoreEngine.calculateScore(order, _targetDistrict!.profile);
    final decision = ScoreEngine.decisionFromScore(score);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EvaluationResultPage(
          score: score,
          decision: decision,
          profile: _targetDistrict!.profile,
          revenue: _fee,
          distance: _emptyKm + _deliveryKm,
          pickupKm: _emptyKm,
          deliveryKm: _deliveryKm,
          startDistrictName: _startDistrict?.district.districtName,
          targetDistrictName: _targetDistrict?.district.districtName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.amberAccent)),
      );
    }

    final double totalKm = _emptyKm + _deliveryKm;
    final double netProfit = ProfitCalculator.calculateNetProfit(_fee, totalKm);
    final double totalCost = ProfitCalculator.calculateTotalCost(totalKm);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    _buildLiveProfitCard(netProfit, totalCost),
                    const SizedBox(height: 20),
                    
                    _buildSectionTitle('GIÁ CƯỚC: ${_fee.toStringAsFixed(0)} VND'),
                    Slider(
                      value: _fee,
                      min: 0,
                      max: 1000000,
                      divisions: 100,
                      activeColor: Colors.amberAccent,
                      onChanged: (val) => setState(() => _fee = val),
                    ),

                    _buildSectionTitle('ĐI TRỐNG: ${_emptyKm.toStringAsFixed(1)} KM'),
                    Slider(
                      value: _emptyKm,
                      min: 0,
                      max: 20,
                      activeColor: Colors.blueAccent,
                      onChanged: (val) => setState(() => _emptyKm = val),
                    ),
                    _buildSectionTitle('GIAO HÀNG: ${_deliveryKm.toStringAsFixed(1)} KM'),
                    Slider(
                      value: _deliveryKm,
                      min: 0,
                      max: 50,
                      activeColor: Colors.greenAccent,
                      onChanged: (val) => setState(() => _deliveryKm = val),
                    ),

                    const SizedBox(height: 10),
                    _buildSectionTitle('QUẬN ĐI (BẮT ĐẦU)'),
                    _buildDistrictScroll(true),
                    
                    const SizedBox(height: 15),
                    _buildSectionTitle('QUẬN ĐẾN (KẾT THÚC)'),
                    _buildDistrictScroll(false),
                    
                    const SizedBox(height: 30),
                    _buildSectionTitle('SIMULATE NOTIFICATIONS'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildSimButton('ĐƠN TỐT', 'Đơn mới: 520.000đ - Q7 -> Q1 - 5km', Colors.greenAccent),
                        _buildSimButton('ĐƠN LỖ', 'Đơn mới: 45.000đ - Q1 -> Hóc Môn - 35km', Colors.redAccent),
                        _buildSimButton('ĐƠN XA', 'Đơn mới: 820.000đ - Q12 -> Nhà Bè - 28km', Colors.blueAccent),
                        _buildSimButton('ĐƠN NHỎ', 'Đơn mới: 120.000đ - Q10 -> Q3 - 3km', Colors.orangeAccent),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildEvaluateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSimButton(String label, String content, Color color) {
    return ActionChip(
      onPressed: () => _simulateNotification(content),
      label: Text(label),
      backgroundColor: color.withOpacity(0.1),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
      side: BorderSide(color: color.withOpacity(0.3)),
    );
  }

  Widget _buildLiveProfitCard(double profit, double cost) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: profit > 50000 ? Colors.greenAccent : (profit > 0 ? Colors.amberAccent : Colors.redAccent),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('LỢI NHUẬN DỰ TÍNH', style: TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold)),
              Text('CHI PHÍ: -${cost.toStringAsFixed(0)}đ', style: const TextStyle(color: Colors.redAccent, fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${profit.toStringAsFixed(0)} VND',
            style: TextStyle(
              color: profit > 0 ? Colors.white : Colors.redAccent,
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            profit > 0 ? "ĐỊNH MỨC: ${AppConstants.kmPerLiter.toStringAsFixed(0)}KM/LÍT + KHẤU HAO" : "CẢNH BÁO: CHUYẾN ĐI LỖ VỐN",
            style: TextStyle(color: profit > 0 ? Colors.white24 : Colors.redAccent.withOpacity(0.5), fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildDistrictScroll(bool isStart) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _districts.length,
        itemBuilder: (context, index) {
          final d = _districts[index];
          final isSelected = isStart 
              ? _startDistrict?.district.districtId == d.district.districtId
              : _targetDistrict?.district.districtId == d.district.districtId;
          
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(d.district.districtName),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    if (isStart) _startDistrict = d;
                    else _targetDistrict = d;
                  });
                }
              },
              selectedColor: isStart ? Colors.blueAccent : Colors.amberAccent,
              backgroundColor: Colors.grey[900],
              showCheckmark: false,
              labelStyle: TextStyle(
                color: isSelected ? Colors.black : Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEvaluateButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: _evaluate,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amberAccent,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 70),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
        ),
        child: const Text('ĐÁNH GIÁ ĐƠN HÀNG', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.bold),
    );
  }
}
