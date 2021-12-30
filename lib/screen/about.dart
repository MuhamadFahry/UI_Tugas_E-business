import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double lebarLayar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFEAEAEA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Informasi',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        titleSpacing: 2,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: lebarLayar,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Tentang Bluder :',
                          style: GoogleFonts.lato(
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Bluder Cokro merupakan produk roti legendaris yang berasal dari Madiun, Jawa Timur. Kelembutan dari roti Bluder Cokro memiliki tempat spesial tersendiri di hati masyarakat. Rasa istimewa yang dipertahankan sejak dari dulu membuatnya tetap diburu khalayak ramai sampai saat ini. Berdiri pada tahun 1989 di Jalan Cokroaminoto no 36 Madiun, Bluder Cokro tetap berproduksi hingga saat kini dan terus berinovasi dengan menambah varian dan produk baru yang sesuai dengan lidah masyarakat Indonesia.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Seiring berjalannya waktu dan meningkatnya pesanan dari konsumen, Bluder Cokro terus berkembang dengan mendirikan pabrik-pabrik baru untuk memenuhi banyaknya permintaan pelanggan. Dengan pem-bangunan pabrik-pabrik barunya pula, Bluder Cokro ikut andil untuk menggerakkan perekonomian rakyat dengan terbukanya lapangan kerja. Penggunaan teknologi canggih berstandar food grade internasional juga dimanfaatkan untuk memenuhi target produksi setiap harinya.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  color: Colors.white,
                  width: lebarLayar,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Pemesanan Bluder :',
                          style: GoogleFonts.lato(
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '1. Pelanggan memilih menu roti bluder yang di inginkan.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '2. Setelah memilih, pelanggan bisa langsung klik menu yang telah di pilih.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '3. Kemudian, pelanggan bisa klik button order now untuk melakukan pemesanan.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '4. Pelanggan bisa memilih salah satu admin untuk melakukan pemesanan.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '5. Kemudian, lakukan pemesanan melalui chat whatsapp.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '6. Pelanggan menunggu barang pesanan dan selamat menikmati.',
                          style: GoogleFonts.lato(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
