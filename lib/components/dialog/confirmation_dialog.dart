import 'package:flutter/material.dart';

// Components
import 'package:flutter_cs_locker_project/components/custom_elevated_button.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onConfirm,
  VoidCallback? onReject, // onReject เป็นตัวเลือกไม่จำเป็น
}) async {
  bool? result = await showDialog<bool>(
    context: context,
    barrierDismissible: false, // ไม่ให้ปิด Dialog โดยการคลิกนอก Dialog
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // ยกเลิก
              if (onReject != null) {
                onReject();
              }
            },
            child: const Text("ยกเลิก"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // ยืนยัน
              onConfirm(); // เรียกใช้ onConfirm
            },
            child: const Text("ยืนยัน"),
          ),
        ],
      );
    },
  );

  if (result == true) {
    onConfirm(); // เรียกใช้ onConfirm หากเลือก "ยืนยัน"
  }
}
