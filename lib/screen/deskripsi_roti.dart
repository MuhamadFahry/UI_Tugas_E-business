import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_ebusiness/model/data_roti.dart';
import 'package:project_ebusiness/screen/kontak_screen.dart';

class DeskripsiScreen extends StatefulWidget {
  final Data datas;
  const DeskripsiScreen({Key? key, required this.datas}) : super(key: key);

  @override
  _DeskripsiScreenState createState() => _DeskripsiScreenState();
}

class _DeskripsiScreenState extends State<DeskripsiScreen> {
  @override
  Widget build(BuildContext context) {
    double tinggiLayar = MediaQuery.of(context).size.height;
    double lebarLayar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFEAEAEA),
      appBar: AppBar(
        titleSpacing: 3,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.datas.nama.toString().toUpperCase(),
          style: GoogleFonts.lato(
            letterSpacing: 1,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          //--------- start bagian gambar produk ---------
          Container(
            height: 250,
            width: lebarLayar,
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  widget.datas.image.toString(),
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          //--------- end bagian gambar produk ---------
          Container(
            margin: EdgeInsets.only(
              top: 230,
            ),
            height: tinggiLayar,
            width: lebarLayar,
            decoration: BoxDecoration(
              color: Color(0XFFEAEAEA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //--------- start bagian teks dekripsi ---------
                Container(
                  height: 55,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Deskripsi Produk',
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //--------- end bagian teks dekripsi ---------
                //--------- start bagian deskripsi produk ---------
                Container(
                  height: tinggiLayar * 0.45,
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.datas.deskripsi.toString(),
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Rp. ${widget.datas.harga.toString()}',
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Berat Produk : ${widget.datas.berat.toString()}/gram',
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Stock Produk : ${widget.datas.stock.toString()}',
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Penyimpanan : ${widget.datas.experied.toString()}/hari',
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Dikirim Dari : ${widget.datas.daerah.toString()}',
                          style: GoogleFonts.lato(
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //--------- end bagian deskripsi produk ---------
                //--------- start bagian button pemesanan ---------
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            left: 25,
                            right: 25,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KontakScreen(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.shoppingCart,
                                size: 30,
                                color: Colors.white,
                              ),
                              trailing: FaIcon(
                                FontAwesomeIcons.arrowRight,
                                size: 25,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Order Now',
                                style: GoogleFonts.lato(
                                  letterSpacing: 1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0XFF26AE60),
                              shape: StadiumBorder(),
                              elevation: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //--------- end bagian button pemesanan ---------
              ],
            ),
          ),
        ],
      ),
    );
  }
}
