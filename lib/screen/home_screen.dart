import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_ebusiness/model/data_roti.dart';
import 'package:project_ebusiness/screen/deskripsi_roti.dart';
import 'package:project_ebusiness/screen/kontak_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double tinggiLayar = MediaQuery.of(context).size.height;
    double lebarLayar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFEAEAEA),
      body: SafeArea(
        child: Stack(
          children: [
            //--------- start bagian gambar utama ---------
            Container(
              height: 180,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/image/cokro bluder round.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            //--------- end bagian gambar utama ---------
            Container(
              margin: EdgeInsets.only(
                top: 210,
              ),
              height: tinggiLayar,
              width: lebarLayar,
              child: Column(
                children: [
                  //--------- start bagian text menu roti ---------
                  Container(
                    height: 30,
                    width: lebarLayar,
                    child: Column(
                      children: [
                        Text(
                          'Menu Roti',
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //--------- akhir bagian text menu roti ---------
                  //--------- start bagian pilih menu roti ---------
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: datas.length,
                        itemBuilder: (context, index) {
                          Data roti = datas[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DeskripsiScreen(datas: roti),
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      roti.image.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          roti.nama.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: GoogleFonts.lato(
                                            letterSpacing: 1,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Rp. ${roti.harga}',
                                          style: GoogleFonts.lato(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //--------- akhir bagian pilih menu roti ---------
                ],
              ),
            ),
            //--------- start bagian search ---------
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 140,
                ),
                height: 65,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextField(
                        style: GoogleFonts.lato(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 3,
                            ),
                          ),
                          hintText: 'Cari roti',
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: 20,
                              end: 10,
                            ),
                            child: Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //--------- akhir bagian search ---------
          ],
        ),
      ),
    );
  }
}
