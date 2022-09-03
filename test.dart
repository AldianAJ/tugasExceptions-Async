import 'dart:io';

void main() async {
  parfumRascal();
  parfumParma();

  try {
    var hasil = await parfum(10);
    print("hasil dari await");
    print(hasil);
  } catch (error) {
    print(error);
  } finally {
    parfumRoyal();
    print("                                        ");
    print("Pesanan anda akan kami proses, untuk pembelian barang :");
  }

  try {
    var dataBeli = await createOrderMessage();
    print(dataBeli);
  } catch (error) {
    print(error);
  }
}

void parfumRoyal() {
  Future.delayed(Duration(seconds: 2), () {
    print("Parfum Royal");
  });
}

void parfumRascal() {
  Future(() {
    print("Parfum Rascal");
  });
}

void parfumParma() {
  Future(() {
    print("Parfum Parma");
  });
}

Future<String> parfum(int jumlahBeli) {
  var stok = 4;
  return Future(() {
    if (stok > jumlahBeli) {
      return 'Berhasil membeli barang sebanyak $jumlahBeli';
    } else {
      throw 'Tidak Berhasil ter-order, karena stok barang tersebut belum ada';
    }
  });
}

Future<String> createOrderMessage() async {
  var beli = await fetchUserOrder();
  return 'Status Barang : $beli';
}

Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 5), () {
    return 'Sudah Dibeli';
  });
}
