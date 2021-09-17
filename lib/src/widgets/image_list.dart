

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
    return Container(
   child:Column(
     children: [
       Image.network(imageModel.url),
       Padding(
         padding: EdgeInsets.only(top:12),
         child: Text(imageModel.title),
       )
     ],
   ),
      margin: EdgeInsets.all(16),
      padding:EdgeInsets.all(16),
      decoration: BoxDecoration(
          border:Border.all(width:2)
      ),
   );
 }
}

