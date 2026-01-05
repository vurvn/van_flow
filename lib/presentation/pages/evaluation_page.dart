import 'package:flutter/material.dart';
import '../../core/models/district_profile.dart';
import '../../core/services/district_service.dart';
import '../../core/utils/score_engine.dart';
import 'evaluation_result_page.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  double _fee = 100000;
  double _emptyKm = 2.0;
  DistrictData? _selectedDistrict;
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
      _selectedDistrict = districts.isNotEmpty ? districts.first : null;
      _isLoading = false;
    });
  }

  void _evaluate() {
    if (_selectedDistrict == null) return;

    final order = OrderInput(
      fee: _fee,
      emptyKm: _emptyKm,
      trafficMinutes: 15,
    );

    final score = ScoreEngine.calculateScore(order, _selectedDistrict!.profile);
    final decision = ScoreEngine.decisionFromScore(score);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EvaluationResultPage(
          score: score,
          decision: decision,
          profile: _selectedDistrict!.profile,
          revenue: _fee,
          distance: _emptyKm,
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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              _buildSectionTitle('ORDER FEE (VND)'),
              Text(
                '${_fee.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Slider(
                value: _fee,
                min: 0,
                max: 1000000,
                divisions: 100,
                activeColor: Colors.amberAccent,
                inactiveColor: Colors.white12,
                onChanged: (val) => setState(() => _fee = val),
              ),
              const SizedBox(height: 10),
              _buildSectionTitle('EMPTY KM (PICKUP)'),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: _emptyKm,
                      min: 0,
                      max: 20,
                      divisions: 40,
                      activeColor: Colors.blueAccent,
                      onChanged: (val) => setState(() => _emptyKm = val),
                    ),
                  ),
                  Text(
                    '${_emptyKm.toStringAsFixed(1)} km',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildSectionTitle('TARGET DISTRICT'),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: _districts.map((d) {
                        final isSelected = _selectedDistrict?.district.districtId == d.district.districtId;
                        return ChoiceChip(
                          label: Text(d.district.districtName),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) setState(() => _selectedDistrict = d);
                          },
                          selectedColor: Colors.amberAccent,
                          backgroundColor: Colors.grey[900],
                          showCheckmark: false,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.black : Colors.white70,
                            fontWeight: isSelected ? FontWeight.w900 : FontWeight.bold,
                            fontSize: 13,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _evaluate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 70),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 8,
                ),
                child: const Text(
                  'EVALUATE ORDER',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white54,
        fontSize: 11,
        letterSpacing: 1.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
