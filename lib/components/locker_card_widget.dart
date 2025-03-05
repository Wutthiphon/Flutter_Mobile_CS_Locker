import 'package:flutter/material.dart';
import 'package:flutter_cs_locker_project/components/dialog/confirmation_dialog.dart';

// Data Type
import 'package:flutter_cs_locker_project/services/data_type.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/dialog/alert_dialog.dart';
import 'package:flutter_cs_locker_project/components/custom_elevated_button.dart';

class LockerCard extends StatefulWidget {
  final Locker lockerData;
  final bool? isLogin;

  const LockerCard({
    super.key,
    required this.lockerData,
    this.isLogin,
  });

  @override
  State<LockerCard> createState() => _LockerCardState();
}

class _LockerCardState extends State<LockerCard> {
  void onReserveLocker() {
    if (widget.isLogin == null || widget.isLogin == false) {
      showAlertDialog(
        context: context,
        title: 'คำเตือน',
        content: 'กรุณาเข้าสู่ระบบก่อนจองล็อคเกอร์',
      );
      return;
    }

    showConfirmationDialog(
      context: context,
      title: "ยืนยันการจองล็อคเกอร์",
      content:
          "คุณต้องการจองล็อคเกอร์ ${widget.lockerData.lockerNumber} ใช่หรือไม่?",
      onConfirm: () {
        // Call API to reserve locker
      },
    );
  }

  void onEndReserveLocker() {
    showConfirmationDialog(
      context: context,
      title: "ยืนยันการสิ้นสุดการใช้งานล็อคเกอร์",
      content:
          "คุณต้องการสิ้นสุดการใช้งานล็อคเกอร์ ${widget.lockerData.lockerNumber} ใช่หรือไม่?",
      onConfirm: () {
        // Call API to end reserve locker
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'ล็อคเกอร์ ${widget.lockerData.lockerNumber}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blueGrey,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.lockerData.isInUse &&
                        widget.lockerData.reserveDate != null &&
                        widget.lockerData.endReserveDate == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เริ่มใช้งานวันที่: ${widget.lockerData.getDateFormat(widget.lockerData.reserveDate!)}',
                          ),
                          Row(
                            children: [
                              const Text('รหัสผ่าน: '),
                              Text(
                                widget.lockerData.passCode!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : !widget.lockerData.isInUse &&
                            widget.lockerData.reserveDate != null &&
                            widget.lockerData.endReserveDate != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'เริ่มใช้งานวันที่: ${widget.lockerData.getDateFormat(widget.lockerData.reserveDate!)}',
                              ),
                              Text(
                                'สิ้นสุดวันที่: ${widget.lockerData.getDateFormat(widget.lockerData.endReserveDate!)}',
                              ),
                            ],
                          )
                        : const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('สถานะ: ว่าง'),
                            ],
                          )
              ],
            ),
            trailing: const Icon(Icons.lock),
          ),
          widget.lockerData.endReserveDate == null
              ? Padding(
                  padding: const EdgeInsets.all(6),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      widget.lockerData.isInUse
                          ? CustomElevatedButton(
                              onPressed: () => onEndReserveLocker(),
                              size: 'small',
                              color: 'secondary',
                              label: 'สิ้นสุดการใช้งาน',
                            )
                          : CustomElevatedButton(
                              onPressed: () => onReserveLocker(),
                              size: 'small',
                              color: 'primary',
                              label: 'ใช้งาน',
                            )
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
