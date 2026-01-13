class DistrictUtils {
  /// Loại bỏ dấu tiếng Việt và ký tự đặc biệt để chuẩn hóa
  static String _removeAccents(String str) {
    const withSolo = "àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ";
    const withoutSolo = "aaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyd";
    
    // Đảm bảo không bị RangeError bằng cách lấy độ dài tối thiểu
    int length = withSolo.length < withoutSolo.length ? withSolo.length : withoutSolo.length;
    
    String result = str;
    for (int i = 0; i < length; i++) {
      result = result.replaceAll(withSolo[i], withoutSolo[i]);
    }
    return result;
  }

  static String normalizeId(String name) {
    // 1. Chuyển về chữ thường, bỏ dấu, bỏ khoảng trắng và chấm/phẩy
    String n = _removeAccents(name.toLowerCase())
        .replaceAll(' ', '')
        .replaceAll('.', '')
        .replaceAll('-', '');
    
    if (n.contains('q12') || n.contains('quan12')) return 'hcm_q12';
    if (n.contains('q10') || n.contains('quan10')) return 'hcm_q10';
    if (n.contains('q11') || n.contains('quan11')) return 'hcm_q11';
    if (n.contains('q1') || n.contains('quan1')) return 'hcm_q1';
    if (n.contains('q2') || n.contains('quan2')) return 'hcm_q2';
    if (n.contains('q3') || n.contains('quan3')) return 'hcm_q3';
    if (n.contains('q4') || n.contains('quan4')) return 'hcm_q4';
    if (n.contains('q5') || n.contains('quan5')) return 'hcm_q5';
    if (n.contains('q6') || n.contains('quan6')) return 'hcm_q6';
    if (n.contains('q7') || n.contains('quan7')) return 'hcm_q7';
    if (n.contains('q8') || n.contains('quan8')) return 'hcm_q8';
    if (n.contains('q9') || n.contains('quan9')) return 'hcm_q9';
    
    if (n.contains('thuduc')) return 'hcm_tp_thu_duc';
    if (n.contains('binhtan')) return 'hcm_binh_tan';
    if (n.contains('binhthanh')) return 'hcm_binh_thanh';
    if (n.contains('govap')) return 'hcm_go_vap';
    if (n.contains('phunhuan')) return 'hcm_phu_nhuan';
    if (n.contains('tanbinh')) return 'hcm_tan_binh';
    if (n.contains('tanphu')) return 'hcm_tan_phu';
    if (n.contains('binhchanh')) return 'hcm_binh_chanh';
    if (n.contains('cangio')) return 'hcm_can_gio';
    if (n.contains('cuchi')) return 'hcm_cu_chi';
    if (n.contains('hocmon')) return 'hcm_hoc_mon';
    if (n.contains('nhabe')) return 'hcm_nha_be';
    
    return name;
  }
}
