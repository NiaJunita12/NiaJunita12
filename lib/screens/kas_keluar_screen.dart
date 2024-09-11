import 'package:flutter/material.dart';
import 'package:kas_personsl/models/kas.dart';
import 'package:kas_personsl/widgets/card_kas_info_keluar.dart';
import 'package:kas_personsl/widgets/kas_item_keluar.dart';

class KasKeluarScreen extends StatefulWidget {
  const KasKeluarScreen({super.key});

  @override
  State<KasKeluarScreen> createState() => _KasKeluarScreenState();
}

class _KasKeluarScreenState extends State<KasKeluarScreen> {
  var itemKeluar = <Kas>[
    Kas.keluar(
        keterangan: "Beli Rumah", nominal: 20000, dateTime: DateTime.now()),
    Kas.keluar(
        keterangan: "Beli Mobil", nominal: 40000, dateTime: DateTime.now()),
    Kas.keluar(
        keterangan: "Beli MacBook", nominal: 10000, dateTime: DateTime.now()),
  ];

  void lama() async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: LamaDialog(onSimpan: tambah),
          );
        });
  }

  void hapus_keluar(Kas kas) {
    setState(() {
      itemKeluar.remove(kas);
    });
  }

  void tambah(Kas kas) {
    setState(() {
      itemKeluar.add(kas);
    });
  }

  void onItemTap(Kas kas) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text("Hapus"),
              content: Text("Apakah anda ingin menghapus?"),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {
                      hapus_keluar(kas);
                      Navigator.of(context).pop();
                    },
                    child: Text("YA")),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Tidak")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kas Keluar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: lama,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          CardKasInfoKeluar(items: itemKeluar, jenis: JenisKas.kasKeluar),
          Flexible(
            child: ListView.separated(
                itemCount: itemKeluar.length,
                separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: const Color.fromARGB(184, 245, 140, 228),
                    ),
                itemBuilder: (context, index) {
                  var kas = itemKeluar[index];
                  return KasItemKeluar(kas: kas, onTap: () => onItemTap(kas));
                }),
          ),
        ],
      ),
    );
  }
}

class LamaDialog extends StatefulWidget {
  const LamaDialog({super.key, required this.onSimpan});
  final void Function(Kas kas) onSimpan;
  @override
  State<LamaDialog> createState() => _LamaDialogState();
}

class _LamaDialogState extends State<LamaDialog> {
  final nominalController = TextEditingController(text: '');
  final keteranganController = TextEditingController(text: '');
  GlobalKey<FormState> global = GlobalKey<FormState>();

  void onSimpan() {
    double nominal =
        nominalController.text != '' ? double.parse(nominalController.text) : 0;
    var kas = Kas.keluar(
        keterangan: keteranganController.text,
        nominal: nominal,
        dateTime: DateTime.now());
    widget.onSimpan(kas);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: global,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Buat Kas Keluar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Nominal wajib diisi";
                }
                return null;
              },
              controller: nominalController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                labelText: "Nominal",
                filled: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Keterangan wajib diisi";
                }
                return null;
              },
              controller: keteranganController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.info),
                labelText: "Keterangan",
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Text("Simpan"),
                onPressed: () {
                  if (global.currentState!.validate()) {
                    onSimpan();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
