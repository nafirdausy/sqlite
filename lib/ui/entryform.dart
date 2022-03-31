import 'package:flutter/material.dart';
import 'package:crud/models/item.dart';

class EntryForm extends StatefulWidget {
  final Item item;

  EntryForm(this.item);

  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//controller
class EntryFormState extends State<EntryForm> {
  Item item;
  EntryFormState(this.item);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController kodeController = TextEditingController(); 
  TextEditingController stockController = TextEditingController();  
 
  @override
  Widget build(BuildContext context) {
    if (item != null) {
      nameController.text = item.name;
      priceController.text = item.price.toString();
      kodeController.text = item.kode;
      stockController.text = item.stock.toString();
  }
    return Scaffold(
      appBar: AppBar(
      title: item == null ? Text('Tambah') : Text('Ubah'),
      leading: Icon(Icons.keyboard_arrow_left),
    ),
    body: Padding(
      padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
      child: ListView(
        children: <Widget> [
          Padding (
            padding: EdgeInsets.only(top:20.0, bottom:20.0),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nama Barang', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {

              },
            ),
          ),

          Padding (
            padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga', 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) { 

                },
              ),
            ),

          Padding (
            padding: EdgeInsets.only(top:20.0, bottom:20.0),
            child: TextField(
              controller: kodeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Kode Barang', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {

              },
            ),
          ),

          Padding (
            padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: TextField(
                controller: stockController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stock', 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) { 

                },
              ),
            ),

            Padding (
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (item == null) {
                          item = Item(nameController.text, 
                            int.parse(priceController.text), 
                            kodeController.text, 
                            int.parse(stockController.text)
                          );
                        } else {
                          item.name = nameController.text;
                          item.price = int.parse(priceController.text);
                          item.kode = kodeController.text;
                          item.stock = int.parse(stockController.text);
                        }  
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                  Container(width: 5.0,),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}