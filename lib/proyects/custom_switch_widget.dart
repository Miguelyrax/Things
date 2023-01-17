import 'package:flutter/material.dart';


class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key});

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  late PageController controller;
  @override
  void initState() {
    controller=PageController(initialPage: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomTabWidget(controller: controller,),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Page 1'
                      )
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Page 12'
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
   );
  }
}

class CustomTabWidget extends StatefulWidget {
  const CustomTabWidget({
    Key? key, required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  State<CustomTabWidget> createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget> {
  bool firstSelection=true;
  double width = 0.0;
  double height = 0.0;
  double left=0.0;
  final GlobalKey _globalKey=GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox box= _globalKey.currentContext?.findRenderObject() as RenderBox;
      width=box.size.width/2;
      height=box.size.height;
      setState(() {
        
      });
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              left: left,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black
                ),
              ),
            ),

            Row(
              key: _globalKey,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      firstSelection=true;
                      left=0.0;
                      widget.controller.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease
                      );
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          '1st screen',
                          style: TextStyle(
                            color: firstSelection?Colors.white:Colors.black
                          )
                        ),
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      firstSelection=false;
                      left=width;
                      widget.controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease
                      );
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          '2th screen',
                           style: TextStyle(
                            color: firstSelection?Colors.black:Colors.white
                          )
                        ),
                      )
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}