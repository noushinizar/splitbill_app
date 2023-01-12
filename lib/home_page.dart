import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbill_app/Result.dart';
class BillSplit extends StatefulWidget {
  const BillSplit({Key? key}) : super(key: key);

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double freindsValue =0.0;
  double tip =0.0;
  String tax='0';
  String bill='';

  buildbutton(String text){
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(20),
        ),
          onPressed: (){
          if(text=='-'){
            setState(() {
              bill='';
            });
          }else{
            setState(() {
              bill += text;
            });
          }

          },
          child: Text(
            text,
            style: GoogleFonts.montserrat(
                fontSize: 25,color:Colors.black,fontWeight: FontWeight.w700),
          ),
      ),
    );
  }


  TextStyle infostyle =  GoogleFonts.montserrat(
      fontSize: 18,color:Colors.white,fontWeight: FontWeight.w700);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 50),
                child: Text('Split Bill',style: GoogleFonts.montserrat(
                  fontSize: 25,fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff1d1e33)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total',style:GoogleFonts.montserrat(
                              fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white
                          ),),
                          Text(bill,
                            style:GoogleFonts.montserrat(
                              fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white
                          ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Friends",style: infostyle,),
                              Text("Tax",style: infostyle,),
                              Text("Tip",style: infostyle,),

                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(freindsValue.round().toString(),style: infostyle,),
                              Text("$tax %",style: infostyle,),
                              Text("\$${tip.round().toString()}",style: infostyle,),

                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("How many friends ?",style:  GoogleFonts.montserrat(
                  fontSize: 20,color:Color(0xff1d1e33),fontWeight: FontWeight.w700),
              ),
              Slider(
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Color(0xff1d1e33),
                inactiveColor: Colors.grey,
                value: freindsValue,
                onChanged: (value){
                  setState(() {
                    freindsValue= value;
                  });
                },
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 70,
                    decoration: BoxDecoration(
                      color:Color(0xff1d1e33),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text("Tip",style:  GoogleFonts.montserrat(
                            fontSize: 18,color:Colors.white,
                            fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(onPressed: (){
                                setState(() {
                                  tip--;
                                });
                              },
                              backgroundColor: Colors.grey[400],
                              child: Icon(Icons.remove,color:Color(0xff1d1e33),),
                              ),
                            ),
                            Text("\$${tip.round().toString()}",
                              style:  GoogleFonts.montserrat(
                                fontSize: 25,color:Colors.white,
                                fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(onPressed: (){
                                setState(() {
                                  tip++;
                                });
                              },
                                backgroundColor: Colors.grey[400],
                                child: Icon(Icons.add,color: Color(0xff1d1e33),),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff1d1e33),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (value){
                          setState(() {
                            tax=value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                          ),
                          labelText: "Tax in %",
                          labelStyle:  GoogleFonts.montserrat(
                              fontSize: 15,color:Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                 SizedBox(height: 20,),
                 Row(
                   children: [
                     buildbutton("1"),
                     buildbutton("2"),
                     buildbutton("3"),
                   ],
                 ),
                 Row(
                   children: [
                     buildbutton("4"),
                     buildbutton("5"),
                     buildbutton("6"),
                   ],
                 ) ,
                  Row(
                    children: [
                      buildbutton("7"),
                      buildbutton("8"),
                      buildbutton("9"),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("."),
                      buildbutton("0"),
                      buildbutton("-"),
                    ],
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xef1d1e33)
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                    (context)=>ResultPage(bill: bill,
                        tax: tax,
                        friendsValue: freindsValue,
                        tip: tip)),);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Split Bill",
                style:GoogleFonts.montserrat(
                        fontSize: 20,color:Colors.white,
                        fontWeight: FontWeight.w700),
                ),
                    ),
                  ),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
