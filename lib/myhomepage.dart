import 'package:flutter/material.dart';
import 'package:medlog/options.dart';
import 'listvalues.dart';
import 'options.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = PageController(initialPage: 0);
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page != null) {
        setState(() {
          currentpage = controller.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.jpg'), fit: BoxFit.cover)
          
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.height * 0.1,
            //     color: Colors.grey,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Center(
            //         child: Text(
            //           "${currentpage + 1}/${listofvalue.length}",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 15),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: PageView.builder(
                  controller: controller,
                  itemCount: listofvalue.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 6.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              listofvalue[index].imagepath),
                                          // fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.1,
                                      left: MediaQuery.of(context).size.height *
                                          0.05,
                                      child: Text(
                                        "Let's get started!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          // backgroundColor: Color.fromARGB(
                                          //     255, 247, 203, 217),
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                 
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (index == 1) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
              
                              child: Card(
                                elevation: 6.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          listofvalue[index].imagepath),
                                          alignment: Alignment.topCenter,
                                      // fit: BoxFit.cover
                                    ),
                
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHome()));
                              },
                              style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromARGB(255, 241, 45, 88),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  ),
                              child: Text("Welcome Onboard!",
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // handle additional pages here if needed
                      return const SizedBox.shrink();
                    }
                  }),
            )
          ],
        ),
      ),
    ),);
  }
}
