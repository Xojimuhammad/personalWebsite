import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../animations/back_effect.dart';
import '../animations/list_skills_animation.dart';
import '../animations/portfolio_animation.dart';
import '../services/url_service.dart';


class MobileScreen extends StatelessWidget {
   MobileScreen({Key? key,required this.controller,required this.list}) : super(key: key);
   List<String> list = [];
   AnimationController controller;
   ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
   return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Muhammadjon Yo'ldoshev",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed:() => scrollController.jumpTo(1100),
              child: const Text(
                "Home",
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: () => scrollController.jumpTo(250),
              child: const Text("projects",
                  style: TextStyle(color: Colors.black))),
          TextButton(
              onPressed: () => scrollController.jumpTo(0),
              child: const Text("Contacts",
                  style: TextStyle(color: Colors.black))),
          TextButton(
            onPressed: () => scrollController.jumpTo(1300),
            child: const Text(
              "Professional summary",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          BackEffect(h: h, w: w),
           SingleChildScrollView(
             controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        BackEffect(h: h, w: w),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                            "assets/images/muhammadjon_yoldoshev.png"),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              " Muhammadjon Yo'ldoshev",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              " Flutter Developer",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              " Phone Number",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              " +998930069001",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(" Address"),
                                            Text(
                                              " Tashkent Uzbekistan",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              " Date of Birth",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              " 12.09.00",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                color: Colors.white,
                                height: 40,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () =>
                                            UrlLauncher.makePhoneCall(),
                                        icon: const Icon(Icons.phone)),
                                    IconButton(
                                        onPressed: () =>
                                            UrlLauncher.makeLinkedIn(),
                                        icon: const Image(
                                          image: AssetImage(
                                              "assets/images/linkedIn.png"),
                                        )),
                                    IconButton(
                                        onPressed: () =>
                                            UrlLauncher.makeGithub(),
                                        icon: const Image(
                                          image: AssetImage(
                                              "assets/images/gitHub.png"),
                                        )),
                                    IconButton(
                                        onPressed: () =>
                                            UrlLauncher.makeFacebook(),
                                        icon: const Image(
                                          image: AssetImage(
                                              "assets/images/facebook_logo.png"),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    alignment: Alignment.center,
                    width: 340,
                    height: 40,
                    child: const Text(
                      "Developer Skills",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 20),

                  
                    SizedBox(
                      height: MediaQuery.of(context).size.height + 150,
                      child: AnimationLimiter(
                        child: GridView.count(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.all(w / 60),
                          crossAxisCount: 3,
                          children: List.generate(list.length, (int index) {
                            return SlideAnimation1(
                              index: index,
                              w: w,
                              skill: list[index],
                            );
                          }),
                        ),
                      ),
                    ),
                 
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          alignment: Alignment.center,
                          width: 340,
                          height: 40,
                          child: const Text(
                            "Portfolio Projects",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        AnimatedItem(
                          startDelayFraction: 0.00,
                          controller: controller,
                          child: AnimCategoryContainer(
                            CategoryBean(
                              Icons.desktop_mac,
                              'todo_app_master',
                              [
                                CategoryBean(Icons.repeat,
                                    'assets/images/todo_app_full.png', [], () {}),
                                CategoryBean(Icons.repeat,
                                    'assets/images/todo_app_master.png', [], () {}),
                              ],
                                  () {},
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        AnimatedItem(
                          startDelayFraction: 0.1,
                          controller: controller,
                          child: AnimCategoryContainer(
                            CategoryBean(
                              Icons.dashboard,
                              'ui_sneaker_app',
                              [
                                CategoryBean(
                                    Icons.repeat, 'assets/images/ui_sneaker_app_home_page.png', [], () {}),
                                CategoryBean(
                                    Icons.repeat, 'assets/images/ui_sneaker_app-master.png', [], () {}),
                              ],
                                  () {},
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

        ],
      ),
    );
  }
}
