import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/DataTransferModel.dart';

class InputBoxWidget extends StatefulWidget{

  final String labelText;
  final double padding; // TODO: ...may have to change this later if we need other formatting for our InputBoxes

  InputBoxWidget({this.labelText, this.padding});

  @override
  State<StatefulWidget> createState() {
    return _InputBoxWidgetState(labelText, padding); 
  } // createState

} // InputBoxWidget

class _InputBoxWidgetState extends State<InputBoxWidget> {
  
  String labelText = '';
  double padding = 0.0;
  _InputBoxWidgetState(this.labelText, this.padding);

  @override
  Widget build(BuildContext context) {
    final dataTransferModel = Provider.of<DataTransferModel>(context, listen: false);

    return Form(
      child: Column(
        children: <Widget>[
          Container(
            
            padding: EdgeInsets.all(this.padding),
            
            child: TextFormField(

              onChanged: (text){
                dataTransferModel.store(labelText.toLowerCase(), text);
              },

              decoration: InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),

            ),
          
          )
        ],
      ),
    );
  } // build

}

