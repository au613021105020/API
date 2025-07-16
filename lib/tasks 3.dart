import 'package:flutter/material.dart';

class og extends StatefulWidget {
  const og({super.key});

  @override
  State<og> createState() => _ogState();
}

class _ogState extends State<og> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),

              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu,color: Colors.black,),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/img_14.png"))
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        children: [
                          Center(
                            child: Text(" sourav suman",
                              style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(" App Developer"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Icon(Icons.search,color: Colors.black,)
              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" My Tasks",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.calendar_month),
                ),

              ],

            ),


          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.alarm,color: Colors.red),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" To Do"),
                    ),
                    Text(" 5 tasks now 1 started",style: TextStyle(fontSize: 15,color: Colors.black45,fontWeight: FontWeight.bold),)
                  ],
                ),

              ],
            ),
          ),

           Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Icon(Icons.work,color: Colors.orange,),
               ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" In progross"),
                    ),
                    Text(" I tasks now 1 started",style: TextStyle(fontSize: 15,color: Colors.black45),)
                  ],
                )
             ],
           ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(Icons.check_circle,color: Colors.blue,),
                ),
                Column(
                  children: [
                    Text(" Done"),
                    Text(" 18 tasks now 13 started",style: TextStyle(fontSize: 15,color: Colors.black45),)
                  ],
                )
              ],
            ),

             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child:Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(" Active Projects",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                     ),
                     ),
                   ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           margin: EdgeInsets.all(10),
                           width: 100,
                           height: 70,
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage("assets/img_15.png"),

                             ),

                           ),


                         ),
                       ),
                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               margin: EdgeInsets.all(15),
                               height: 100,
                               width: 120,
                               decoration: BoxDecoration(
                                 image: DecorationImage(image: AssetImage("assets/img_17.png"))
                               ),
                             ),
                           ),

                         ],
                       ),


                     ],
                   ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/img_15.png"))
                            ),
                          ),
                        ),
                         Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 margin: EdgeInsets.all(20),
                                 height: 100,
                                 width: 100,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(image: AssetImage("assets/img_17.png"))
                                 ),
                               ),
                             )
                           ],
                           
                         )

                      ],
                    ),

                 ],
               ),


             ),


        ],

      ),

    );
  }
}
