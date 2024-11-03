import 'package:flutter/material.dart'; // Import Flutter Material Design library
import 'login_page.dart'; // Import the login page file

// Define the Profile Page widget
class profilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE2F1), // Set background color
      body: SingleChildScrollView(
        // Allow vertical scrolling if content overflows
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column containing welcome text and cards (on the left)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Sara2024 أهلا بك',
                          style: TextStyle(
                            color: Color(0xFF51305B),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      // Row with Balance and Points cards
                      Row(
                        children: [
                          buildCard(
                            color: Color(0xFFFFFFFF),
                            icon: Icons.account_balance_wallet,
                            title: 'رصيدي',
                            value: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ر.س', style: TextStyle(fontSize: 16)),
                                Text('0.0',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            iconColor: Color(0xFFDDD0E3),
                          ),
                          SizedBox(width: 20), // Space between cards
                          buildCard(
                            color: Color(0xFF51305B),
                            icon: Icons.star,
                            title: 'نقاطي',
                            value: Text('5',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                            iconColor: Color(0xFFDDD0E3),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Profile image with edit button
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/profile_img_decore.png',
                            width: 150, height: 150, fit: BoxFit.cover),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFA381AD),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            icon: Icon(Icons.edit, color: Color(0xFFFBF6F6)),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30), // Space between sections

              // Settings widget
              SettingsWidget(),

              SizedBox(height: 30),

              // Button list
              buildButtonList(),

              // Logout button
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context); // Show confirmation dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC2247E),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Container(
          height: 75,
          margin: const EdgeInsets.symmetric(horizontal: 60.0),
          decoration: BoxDecoration(
            color: Color(0xFF8E71A5),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 4), blurRadius: 4)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home, color: Colors.white),
                  iconSize: 30),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.apps, color: Colors.white),
                  iconSize: 30),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications, color: Colors.white),
                  iconSize: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person, color: Color(0xFF8E71A5)),
                      iconSize: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              width: 362,
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.23),
                border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 0.78),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
                    style: TextStyle(
                        color: Color(0xFF54595E),
                        fontSize: 15.57,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:
                              BorderSide(color: Color(0xFF4F4F4F), width: 0.78),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.23)),
                        ),
                        child: Text('إلغاء',
                            style: TextStyle(
                                color: Color(0xFF4F4F4F),
                                fontSize: 10.90,
                                fontWeight: FontWeight.bold)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC2247E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.23)),
                        ),
                        child: Text('تسجيل الخروج',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.90,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Function to build cards for balance and points
  Widget buildCard({
    required Color color,
    required IconData icon,
    required String title,
    required Widget value,
    required Color iconColor,
  }) {
    return Container(
      width: 106,
      height: 83,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 4)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 24),
          value,
          Text(
            title,
            style: TextStyle(
                color: color == Color(0xFF51305B) ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Function to build button list for settings options
  Widget buildButtonList() {
    return Column(
      children: [
        buildButton('المعلومات الشخصية', Icons.person),
        buildButton('بيانات الدفع', Icons.payment),
        buildButton('الخصوصية و الأمان', Icons.lock),
        buildButton('إعدادات الإشعارات', Icons.notifications),
        buildButton('الأسئلة الشائعة', Icons.help),
        buildButton('تواصل معنا', Icons.phone),
      ],
    );
  }

  // Function to build individual button
  Widget buildButton(String title, IconData icon) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        color: Color(0xFFDDD0E3),
        border: Border(bottom: BorderSide(color: Color(0xFF8E71A5), width: 1)),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Color(0xFF51305B)),
        label: Align(
          alignment: Alignment.centerRight,
          child: Text(title,
              style: TextStyle(color: Color(0xFF51305B), fontSize: 16)),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 25),
          alignment: Alignment.centerRight,
        ),
      ),
    );
  }
}

// Settings widget for dropdown and settings options
class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  String? selectedCountry = 'السعودية';
  String? selectedCity = 'الرياض';
  String? selectedLanguage = 'العربية';
  String? selectedCurrency = 'ريال سعودي';
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xFFF3E7FB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDropdown(
                  'اللغة', ['العربية', 'الإنجليزية'], selectedLanguage,
                  (value) {
                setState(() {
                  selectedCountry = value;
                });
              }),
              buildDropdown(
                  'المدينة', ['الرياض', 'جدة', 'الدمام'], selectedCity,
                  (value) {
                setState(() {
                  selectedCity = value;
                });
              }),
              buildDropdown(
                  'الدولة', ['السعودية', 'الإمارات', 'مصر'], selectedCountry,
                  (value) {
                setState(() {
                  selectedLanguage = value;
                });
              }),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                    activeColor: Color(0xFFB59CC4),
                  ),
                  SizedBox(width: 10),
                  Text('الوضع الليلي',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      textAlign: TextAlign.right),
                ],
              ),
              buildDropdown('العملة', ['ريال سعودي', 'دولار أمريكي', 'يورو'],
                  selectedCurrency, (value) {
                setState(() {
                  selectedCurrency = value;
                });
              }),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Action for update settings
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB59CC4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(
              'تحديث',
              style: TextStyle(color: Color(0xFFFEFBFF), fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(label,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
              textAlign: TextAlign.right),
          SizedBox(height: 5),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            style: TextStyle(color: Colors.grey[600]),
            underline: Container(height: 1, color: Color(0xFFD3C7E5)),
            dropdownColor: Color(0xFFF7F1FA),
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(value, textAlign: TextAlign.right)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
