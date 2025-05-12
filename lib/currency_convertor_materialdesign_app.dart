// here we develop this by material design first rather than the cupertino design

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CurrencyConvertorMaterial extends StatefulWidget{//	Immutable structure — just defines the widget
  const CurrencyConvertorMaterial({super.key});
  @override
State<CurrencyConvertorMaterial> createState()=>_CurrencyConvertorMaterialPageState();
}

class _CurrencyConvertorMaterialPageState extends State<CurrencyConvertorMaterial>{//Mutable state — handles UI updates, variables, and logic
  //Holds the mutable data (variables that can change).
  // Rebuilds the UI whenever setState() is called.
  dynamic result=0;
  TextEditingController textEditingController=TextEditingController();// we have to pass this in the text field to get the value which is entered by the user
  TextEditingController textEditingController1=TextEditingController();

@override
Widget build(BuildContext context) {
  // this is a build function in which we can create any variable we want
  final border = OutlineInputBorder(
    // we created this variable by own
    //it shown when the field is enabled but not focused
    borderSide: BorderSide(
      width: 2,
      strokeAlign: BorderSide.strokeAlignInside,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ), //here we copy the code of the focused border and the enabled border in the final variable which is named as border because both have same thing so to reduce the complexity of code we simply copy the variable
  );

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  return Scaffold(
    // this is a widget tree in which all the widgets are created
    backgroundColor:
    Colors
        .black12, // colors. do not mention every possible color so we have to use the color.rgb/color.argb format if we want some unique color according to the requirement


    //App bar- which define the header of the app
    appBar: AppBar(
      //shadowColor: Colors.lightBlue,it will set shadow but due to black color we do not be able to see the shadow
      backgroundColor:
      Colors
          .lightBlue, // if we match the color of the bg black and set elevation to zero then whole screen appears same color without any 3d surface and we can write text without appbar
      shape: BeveledRectangleBorder(),
      title: Text("Currency Convertor App", textAlign: TextAlign.center),
      centerTitle: true,
      surfaceTintColor: Colors.red,
      actions: [IconButton(onPressed: (){// it is used in the app bar for many actions to exit the app and many more it provides icon too
        debugPrint("button pressed");
      }, icon: Icon(Icons.calculate))],
      leading: IconButton(onPressed:(){ //leading is used to display anything at the top left of the screen of the app bar where as action is used to display at the top right of the appbar
        debugPrint('Move to home successfully');
      }, icon:Icon(Icons.home)),
    ),

    //-----------------------------------------------------------------------------------------------------------------
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result.toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color:
              Colors
                  .white, //w->refers the level of the boldness we want in this
            ),
          ),

          ///container- container is made up of many widgets
          ///padding-it is just one widget
          // we can also use container by replace padding it will also give more options
          Padding(
            // just right click on the text field and wrapped the text field with the widget
            padding: const EdgeInsets.all(12),
            //margin: const EdgeInsets.all(12), //it is used with the container, so always use padding if we only require padding else use the Container for more widgets, here the margin acts as same as the padding
            child: TextField(
              // text field is used to provide the input text from the user
              controller: textEditingController,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),

              decoration: InputDecoration(
                hintText: 'Enter the amount in USD',
                hintStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.black,
                ),
                // we have also suffix which will add the icon at the right side of the tex
                prefixIconColor: Colors.white,
                // it will also act same as i do in the upper one
                fillColor: Colors.white,
                filled: true,
                focusedBorder: border,
                enabledBorder:
                border, // in the border variable we copy the whole code and assign it to this
              ),

              keyboardType: TextInputType.numberWithOptions(
                // it is used for the type of keyboard we want
                decimal:
                true, // it enable us to enter the value in decimal too but if we want only numbers without decimals so we can use .numbers only
                //signed: true, // it will help us to get the negative signs
              ),
            ),
          ),
          Padding(
            // just right click on the text field and wrapped the text field with the widget
            padding: const EdgeInsets.all(12),
            //margin: const EdgeInsets.all(12), //it is used with the container, so always use padding if we only require padding else use the Container for more widgets, here the margin acts as same as the padding
            child: TextField(
              // text field is used to provide the input text from the user
              controller: textEditingController1,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),

              decoration: InputDecoration(
                hintText: 'Enter the amount in RS',
                hintStyle: const TextStyle(color: Colors.black),
                prefixIcon: Padding( // by this we can also declare our symbol by this
                  padding: EdgeInsets.only(top: 5,left: 15), // Adjust alignment
                  child: Text('₹', style: TextStyle(fontSize: 30),textAlign: TextAlign.left,),
                ),
                // we have also suffix which will add the icon at the right side of the tex
                prefixIconColor: Colors.white,
                // it will also act same as i do in the upper one
                fillColor: Colors.white,
                filled: true,
                focusedBorder: border,
                enabledBorder:
                border, // in the border variable we copy the whole code and assign it to this
              ),

              keyboardType: TextInputType.numberWithOptions(
                // it is used for the type of keyboard we want
                decimal:
                true, // it enable us to enter the value in decimal too but if we want only numbers without decimals so we can use .numbers only
                //signed: true, // it will help us to get the negative signs
              ),
            ),
          ),

          //------------------------------------------------------------------------------------------------------------

          ///Button- now we are going to add button in our app
          // button are of two types-
          ///1)raised button- it is the actual button(ElevatedButton), it kinda give a 3D view
          ///2)appears like the text but it is the button(TextButton)
          Padding(
            padding: const EdgeInsets.all(
              20,
            ), //from here from all sides the padding is equal of 20
            child: ElevatedButton(
              onPressed: () {
                // textEditingController.clear();
                // textEditingController1.clear();
                // result='0';
                // it is an anonymous function that do not require any name
                setState(() {
                  final usdText = textEditingController.text.trim();
                  /*  storing the current input from the TextField (controlled by textEditingController) into a local final variable called usdText.\
                       textEditingController.text fetches the current value (text) entered by the user in the USD input field.
                  */
                  final inrText = textEditingController1.text.trim();


                  if (usdText.isNotEmpty && inrText.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill only one field at a time"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                    result = 0;
                  } else if (usdText.isNotEmpty) {
                    result = double.tryParse(usdText) ?? 0;
                    if (result <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Please enter a valid positive number in USD"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                      result = 0;
                    } else {
                      result = result * 85.42; // USD to INR
                    }

                  } else if (inrText.isNotEmpty) {
                    result = double.tryParse(inrText) ?? 0;
                    if (result <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Please enter a valid positive number in INR"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                      result = 0;
                    } else {
                      result = result / 85.42; // INR to USD
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a value to convert"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                    result = 0;
                  }
                });
                textEditingController.clear();
                textEditingController1.clear();
              },
                ///debug,release and profile-there are three modes
                /*if (kDebugMode) {
                    print(
                      "Button Clicked",
                    ); // by this we can write simply print statement without any writing debug print because now we are working in the debug mode
                  }*/
                // debugPrint("Button Clicked");-if we do not write the upper one we need to write this
              style: ElevatedButton.styleFrom(
                // or we can put elevated button or button style or text button and also we have to write widget state propertyAll in ButtonStyle so that's why we write TextButton.style form
                backgroundColor: (Colors.white),
                foregroundColor:
                (Colors
                    .black), // it is used to color the text of the button(foreground color)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: (Size(double.infinity, 35)),
              ),
              /*style: ButtonStyle( //
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  elevation: WidgetStatePropertyAll(
                    30,
                  ), // it is used to give a 3d view elevate the button
                  foregroundColor: WidgetStatePropertyAll(
                    Colors.black,
                  ), // it is used to color the text of the button(foreground color)
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 35),
                  ), // it is used to increase the width and height of the button
                ),*/
              child: const Text('Convert the currency'),
            ),
          ),
        ],
      ), // column goes from top to bottom,)
    ),
  );
}
}
