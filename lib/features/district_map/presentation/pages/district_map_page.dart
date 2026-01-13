import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/models/order_entity.dart';
import '../../../../features/order_monitor/domain/repositories/order_repository.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/utils/district_utils.dart'; // Import utility chung

class DistrictMapPage extends StatefulWidget {
  final bool showAppBar;
  const DistrictMapPage({super.key, this.showAppBar = true});

  @override
  State<DistrictMapPage> createState() => _DistrictMapPageState();
}

class _DistrictMapPageState extends State<DistrictMapPage> {
  List<MapFeature> _features = [];
  bool _isLoading = true;
  Map<String, List<OrderEntity>> _districtOrders = {};

  @override
  void initState() {
    super.initState();
    _loadMapData();
  }

  Future<void> _loadMapData() async {
    try {
      final geojsonString = await rootBundle.loadString('assets/data/diaphanhuyen.geojson');
      final features = await compute(_parseGeoJson, geojsonString);

      final repository = sl<OrderRepository>();
      final allOrders = await repository.getAllOrders();
      
      final grouped = <String, List<OrderEntity>>{};
      for (var order in allOrders) {
        if (order.targetDistrictId != null) {
          grouped.putIfAbsent(order.targetDistrictId!, () => []).add(order);
        }
      }

      if (mounted) {
        setState(() {
          _features = features;
          _districtOrders = grouped;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("GEOJSON ERROR: $e");
      if (mounted) setState(() => _isLoading = false);
    }
  }

  static List<MapFeature> _parseGeoJson(String data) {
    final decoded = jsonDecode(data);
    final features = <MapFeature>[];
    
    if (decoded['features'] == null) return [];

    for (var item in decoded['features']) {
      final props = item['properties'] ?? {};
      final geometry = item['geometry'];
      if (geometry == null) continue;

      final rawName = props['Ten_Huyen'] ?? props['NAME_2'] ?? 'Unknown';
      final name = rawName.toString();
      
      // Sử dụng DistrictUtils tập trung
      final id = DistrictUtils.normalizeId(name);

      if (geometry['type'] == 'Polygon') {
        final coords = _parseRing(geometry['coordinates'][0]);
        if (coords.isNotEmpty) {
          features.add(MapFeature(id: id, name: name, points: coords));
        }
      } else if (geometry['type'] == 'MultiPolygon') {
        for (var poly in geometry['coordinates']) {
          final coords = _parseRing(poly[0]);
          if (coords.isNotEmpty) {
            features.add(MapFeature(id: id, name: name, points: coords));
          }
        }
      }
    }
    return features;
  }

  static List<LatLng> _parseRing(List ring) {
    try {
      return ring.map<LatLng>((c) {
        return LatLng(
          (c[1] as num).toDouble(), 
          (c[0] as num).toDouble()
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }

  Color _getDistrictColor(String districtId) {
    final count = _districtOrders[districtId]?.length ?? 0;
    if (count == 0) return Colors.green.withOpacity(0.2);
    if (count < 3) return Colors.orange.withOpacity(0.4);
    return Colors.red.withOpacity(0.6);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator(color: Colors.amber));

    final mapWidget = FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(10.7626, 106.6601),
        initialZoom: 10.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.vanflow.app',
        ),
        PolygonLayer(
          polygons: _features.map((feature) {
            return Polygon(
              points: feature.points,
              color: _getDistrictColor(feature.id),
              borderColor: Colors.white30,
              borderStrokeWidth: 0.5,
              isFilled: true,
            );
          }).toList(),
        ),
      ],
    );

    if (!widget.showAppBar) return mapWidget;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BẢN ĐỒ NHIỆT ĐƠN HÀNG', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: Colors.black,
      ),
      body: mapWidget,
    );
  }
}

class MapFeature {
  final String id;
  final String name;
  final List<LatLng> points;

  MapFeature({required this.id, required this.name, required this.points});
}
