import 'package:flutter/material.dart';
import 'package:flutter_burc/burc_item.dart';
import 'package:flutter_burc/data/strings.dart';
import 'package:flutter_burc/model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazir();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burclar Listesi'),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(listelenenBurc: tumBurclar[index]);
        },
        itemCount: tumBurclar.length,
      )),
    );
  }

  List<burc> veriKaynaginiHazir() {
    List<burc> gecici = [];

    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          // koc1.png to create Kocc --> koc --> koc1.png
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      //koc_buyuk1.png
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      burc eklenecekBurc =
          burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
