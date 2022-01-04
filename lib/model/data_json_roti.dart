class DataRoti {
  String? url;
  String? nama;
  String? harga;
  String? detail;
  String? beratP;
  String? stockP;
  String? penyimpanan;

  DataRoti({
    this.nama,
    this.url,
    this.harga,
    this.detail,
    this.beratP,
    this.stockP,
    this.penyimpanan,
  });

  factory DataRoti.fromJson(Map<String, dynamic> json) {
    return DataRoti(
      url: json['gambar'],
      nama: json['nama'],
      detail: json['detail'],
      harga: json['harga'],
      beratP: json['berat_produk'],
      stockP: json['stock_produk'],
      penyimpanan: json['masa_simpan'],
    );
  }
}
