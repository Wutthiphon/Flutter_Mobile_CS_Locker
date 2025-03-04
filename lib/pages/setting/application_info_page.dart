import 'package:flutter/material.dart';

class ApplicationInfoPage extends StatelessWidget {
  const ApplicationInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'เกี่ยวกับแอปพลิเคชัน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              './assets/background/page-top-right.png',
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 180.0,
              left: 10.0,
              right: 10.0,
            ),
            width: MediaQuery.of(context).size.width,
            child: const Column(
              children: [
                Text(
                  'Lock!Lock! Application',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'พัฒนาโดย',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "นายวุฒิพร ทัศนา",
                ),
                Text(
                  "นายอชิรวิชญ์ บุญแต่ง",
                ),
                SizedBox(height: 20),
                Text(
                  "วิชาการพัฒนา Mobile Application",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "สาขาวิทยาการคอมพิวเตอร์ คณะวิทยาศาสตร์ประยุกต์ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 121, 40, 3),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
