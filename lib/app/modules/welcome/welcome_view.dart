import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sayara_hub/app/modules/welcome/welcome_controller.dart';

import 'package:google_fonts/google_fonts.dart';



class WelcomeView extends GetView<WelcomeController> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      // Using Stack allows the button to be pinned to the absolute bottom

      body: Stack(

        children: [

          // 1. MAIN CONTENT (Logo and Word Box)

          SafeArea(

            child: Column(

              children: [

                const Spacer(flex: 3),

                Center(

                  child: Image.asset(

                    'assets/SayaraHub.png',

                    width: MediaQuery.of(context).size.width * 0.8,

                    fit: BoxFit.contain,

                  ),

                ),

                const Spacer(flex: 4),

                Obx(() => Container(

                      width: 220,

                      height: 70,

                      alignment: Alignment.center,

                      decoration: BoxDecoration(

                        border: Border.all(color: Colors.black, width: 1.2),

                      ),

                      child: AnimatedSwitcher(

                        duration: const Duration(milliseconds: 600),

                        transitionBuilder: (Widget child, Animation<double> animation) {

                          return FadeTransition(

                            opacity: animation,

                            child: SlideTransition(

                              position: Tween<Offset>(

                                begin: const Offset(0.0, 0.3),

                                end: Offset.zero,

                              ).animate(animation),

                              child: child,

                            ),

                          );

                        },

                        child: Text(

                          controller.words[controller.currentIndex.value],

                          key: ValueKey<String>(controller.words[controller.currentIndex.value]),

                          style: GoogleFonts.kanit(

                            fontSize: 42,

                            fontWeight: FontWeight.w900,

                            fontStyle: FontStyle.italic,

                            foreground: Paint()

                              ..style = PaintingStyle.stroke

                              ..strokeWidth = 1.5

                              ..color = const Color(0xFF2455D9),

                          ),

                        ),

                      ),

                    )),

                const Spacer(flex: 5), // Increased bottom spacer to clear the button

              ],

            ),

          ),



          // 2. FULL WIDTH ANIMATED BUTTON

          Positioned(

            left: 0,

            right: 0,

            bottom: 0,

            child: TweenAnimationBuilder<Offset>(

              duration: const Duration(milliseconds: 1500),

              curve: Curves.easeOutBack,

              tween: Tween<Offset>(

                begin: const Offset(0, 100), // Slide up from below

                end: const Offset(0, 0),

              ),

              builder: (context, offset, child) {

                return Transform.translate(

                  offset: offset,

                  child: child,

                );

              },

              child: SizedBox(

                width: double.infinity, // Takes total screen width

                height: 80, // Taller height for the full-width design

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    backgroundColor: const Color(0xFF2455D9),

                    elevation: 0, // Flat look works better for full-width

                    shape: const RoundedRectangleBorder(

                      borderRadius: BorderRadius.only(

                        topLeft: Radius.circular(30),

                        topRight: Radius.circular(30),

                      ),

                    ),

                  ),

                  onPressed: () {

                    print("Button Clicked!");

                    controller.onLetsGoPressed();

                  },

                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: const [

                      Text(

                        "Let's go",

                        style: TextStyle(

                          color: Colors.white,

                          fontSize: 20,

                          fontWeight: FontWeight.bold

                        ),

                      ),

                      SizedBox(width: 12),

                      Icon(Icons.arrow_forward, color: Colors.white, size: 26),

                    ],

                  ),

                ),

              ),

            ),

          ),

        ],

      ),

    );

  }

}

