import 'package:flutter/material.dart';

// Custom Components
import 'package:flutter_cs_locker_project/components/custom_elevated_button.dart';

class LockerCard extends StatelessWidget {
  final int lockerNumber;
  final bool isInUse;
  final String? passCode;
  final DateTime? reserveDate;
  final DateTime? endReserveDate;

  const LockerCard({
    super.key,
    required this.lockerNumber,
    required this.isInUse,
    this.passCode,
    this.reserveDate,
    this.endReserveDate,
  });

  String getDateFormat(DateTime date) {
    return '${date.day}/${date.month}/${date.year + 543}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'ล็อคเกอร์ $lockerNumber',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blueGrey,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isInUse && reserveDate != null && endReserveDate == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เริ่มใช้งานวันที่: ${getDateFormat(reserveDate!)}',
                          ),
                          Row(
                            children: [
                              const Text('รหัสผ่าน: '),
                              Text(
                                passCode!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : !isInUse && reserveDate != null && endReserveDate != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'เริ่มใช้งานวันที่: ${getDateFormat(reserveDate!)}',
                              ),
                              Text(
                                'สิ้นสุดวันที่: ${getDateFormat(endReserveDate!)}',
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
          endReserveDate == null
              ? Padding(
                  padding: const EdgeInsets.all(6),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      isInUse
                          ? CustomElevatedButton(
                              onPressed: () {},
                              size: 'small',
                              color: 'secondary',
                              label: 'สิ้นสุดการใช้งาน',
                            )
                          : CustomElevatedButton(
                              onPressed: () {},
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
