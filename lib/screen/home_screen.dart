import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_ebusiness/model/data_json_roti.dart';
import 'package:project_ebusiness/screen/deskripsi_roti.dart';
import 'package:project_ebusiness/utils/data_json_roti.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DataRoti>? dataRotiOnSearch;
  TextEditingController _controller = TextEditingController();
  List<DataRoti> listDataRoti = [];
  TarikData tarikdata = TarikData();
  var loading = false;

  //--------- start bagian tarik data json roti ---------
  Future getData() async {
    setState(() {
      loading = true;
    });
    listDataRoti = await tarikdata.getDataRoti();
    setState(() {
      loading = false;
    });
  }
  //--------- end bagian tarik data json roti ---------

  //--------- start bagian refresh data json roti ---------
  Future refershData() async {
    await Future.delayed(Duration(milliseconds: 2000));
    listDataRoti = await tarikdata.getDataRoti();
    setState(() {});
  }
  //--------- end bagian refresh data json roti ---------

  @override
  void initState() {
    getData();
    refershData();
    super.initState();
  }

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
                  // Container(
                  //   height: 30,
                  //   width: lebarLayar,
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         'Menu Roti',
                  //         style: GoogleFonts.lato(
                  //           letterSpacing: 1,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //--------- akhir bagian text menu roti ---------
                  //--------- start bagian pilih menu roti ---------
                  Expanded(
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: Color(0XFF9B4B26),
                            ),
                          )
                        : RefreshIndicator(
                            strokeWidth: 3,
                            color: Color(0XFF9B4B26),
                            onRefresh: refershData,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: _controller.text.isNotEmpty &&
                                      dataRotiOnSearch!.isEmpty
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.search_off, size: 40),
                                          SizedBox(height: 10),
                                          Text(
                                            'Roti tidak ditemukan',
                                            style: GoogleFonts.lato(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      itemCount: _controller.text.isNotEmpty
                                          ? dataRotiOnSearch!.length
                                          : listDataRoti.length,
                                      itemBuilder: (context, index) {
                                        DataRoti roti =
                                            _controller.text.isNotEmpty
                                                ? dataRotiOnSearch![index]
                                                : listDataRoti[index];
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DeskripsiScreen(
                                                        datas: roti),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Image.network(
                                                    roti.url.toString(),
                                                    width: 190,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                ListTile(
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Text(
                                                        roti.nama.toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                        controller: _controller,
                        onChanged: (String data) {
                          setState(() {
                            dataRotiOnSearch = listDataRoti
                                .where((element) => element.nama
                                    .toString()
                                    .toLowerCase()
                                    .contains(data.toLowerCase()))
                                .toList();
                          });
                        },
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Cari roti',
                          hintStyle: GoogleFonts.lato(
                            fontSize: 18,
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
                          suffixIcon: _controller.text.isNotEmpty
                              ? GestureDetector(
                                  child: Icon(Icons.close, color: Colors.red),
                                  onTap: () {
                                    _controller.clear();
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                )
                              : null,
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
