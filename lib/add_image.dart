import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

class add_image extends StatelessWidget {

  String getRandomId(){
    Random random=Random();
    String temp='';
    for(int i=0;i<10;i++){
      temp=(random.nextInt(9)+1).toString()+temp;
    }
    print('temp is $temp');
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red.shade100,
      onPressed: ()async {
        try{
          var image = await ImagePicker.pickImage(  source: ImageSource.gallery);
          FirebaseStorage _pokemon=FirebaseStorage.instance;
          var tempId=getRandomId();
          StorageReference reference=_pokemon.ref().child('pokemon/'+tempId);
          StorageUploadTask uploadTask = reference.putFile(image);
          Firestore _store=Firestore.instance;
          _store.collection('pokemon').add(
              {
                'name':tempId
              }
          );
        }catch(e){}
      },
      child: FittedBox(
        child: Icon(
          Icons.image,
          color: Colors.blueGrey.shade900,
        ),
      ),
    );
  }
}