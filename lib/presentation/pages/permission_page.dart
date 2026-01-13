import 'package:flutter/material.dart';
import '../../core/services/permission_service.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import '../screens/main_screen.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final hasAll = await PermissionService.hasAllPermissions();
    if (hasAll) {
      _navigateToHome();
    } else {
      if (mounted) {
        setState(() {
          _isChecking = false;
        });
      }
    }
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  Future<void> _handleGrantPermissions() async {
    // 1. Xin quyền thông báo và overlay
    await PermissionService.requestBasicPermissions();
    
    // 2. Xin quyền Notification Listener (mở cài đặt hệ thống)
    await PermissionService.requestNotificationListenerPermission();
    
    // 3. Đợi người dùng quay lại và kiểm tra lại
    _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    if (_isChecking) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.amberAccent)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.security, size: 80, color: Colors.amberAccent),
              const SizedBox(height: 32),
              const Text(
                'CẤP QUYỀN TRỢ LÝ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Để VanFlow có thể tự động phân tích đơn hàng từ thông báo, bạn cần cấp các quyền sau:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 40),
              _buildPermissionItem(Icons.notifications_active, 'Thông báo', 'Để hiển thị trợ lý chạy ngầm'),
              const SizedBox(height: 16),
              _buildPermissionItem(Icons.layers, 'Hiển thị trên ứng dụng khác', 'Để hiện thẻ phân tích đơn hàng'),
              const SizedBox(height: 16),
              _buildPermissionItem(Icons.visibility, 'Truy cập thông báo', 'Để đọc nội dung đơn hàng từ Grab/Lalamove'),
              const Spacer(),
              ElevatedButton(
                onPressed: _handleGrantPermissions,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 70),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text(
                  'CẤP QUYỀN NGAY',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _checkPermissions,
                child: const Text('TÔI ĐÃ CẤP QUYỀN, THỬ LẠI', style: TextStyle(color: Colors.white38)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionItem(IconData icon, String title, String desc) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.amberAccent, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(desc, style: const TextStyle(color: Colors.white38, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
