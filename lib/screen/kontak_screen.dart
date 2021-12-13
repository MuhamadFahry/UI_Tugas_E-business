import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_ebusiness/model/kontak_admin.dart';
import 'package:project_ebusiness/model/kontak_url.dart';

class KontakScreen extends StatefulWidget {
  const KontakScreen({Key? key}) : super(key: key);

  @override
  _KontakScreenState createState() => _KontakScreenState();
}

class _KontakScreenState extends State<KontakScreen> {
  @override
  Widget build(BuildContext context) {
    double tinggiLayar = MediaQuery.of(context).size.height;
    double lebarLayar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFEAEAEA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            size: 25,
          ),
        ),
      ),
      body: Stack(
        children: [
          //--------- start bagian gambar bluder ---------
          Container(
            height: 180,
            child: Column(
              children: [
                Image.asset(
                  'assets/image/cokro bluder round.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            height: tinggiLayar,
            width: lebarLayar,
            margin: EdgeInsets.only(
              top: 150,
            ),
            decoration: BoxDecoration(
              color: Color(0XFFEAEAEA),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kontak Admin Roti Bluder',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //--------- end bagian gambar utama ---------
                  SizedBox(
                    height: 12,
                  ),
                  //--------- start bagian gambar kontak admin ---------
                  Expanded(
                    child: Container(
                      height: tinggiLayar,
                      width: lebarLayar,
                      child: ListView.builder(
                        itemCount: admins.length,
                        itemBuilder: (context, index) {
                          Admin data = admins[index];
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: 15,
                            ),
                            width: lebarLayar,
                            decoration: BoxDecoration(
                              color: Color(0XFF26AE60),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0XAA26AE60),
                                  offset: Offset(3, 3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () => Kontak.openWhatsapp(
                                phoneNumber: data.kontak,
                              ),
                              leading: FaIcon(
                                FontAwesomeIcons.whatsapp,
                                size: 30,
                                color: Colors.white,
                              ),
                              trailing: FaIcon(
                                FontAwesomeIcons.angleDoubleRight,
                                size: 28,
                                color: Colors.white,
                              ),
                              title: Text(
                                data.nama.toString(),
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //--------- end bagian gambar utama ---------
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
