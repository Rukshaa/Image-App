

import 'package:flutter/cupertino.dart';
import 'package:pics/src/models/image_model.dart';

class ImageList extends StatelessWidget{
 final List<ImageModel> imageList;
  ImageList(this.imageList);

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
     itemBuilder: (BuildContext context, int index){
       return buildImage(imageList[index]);
     },
     itemCount: imageList.length,
   );
  }
 Widget buildImage(ImageModel imageModel){
    return Image.network(imageModel.url);

 }
}

