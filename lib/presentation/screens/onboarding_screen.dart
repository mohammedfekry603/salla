import 'package:flutter/material.dart';
import 'package:salla/constant/app_router.dart';
import 'package:salla/presentation/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  String? image;
  String? title;
  String? body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: "assets/images/onboarding1.png",
      title: "Purchase Online",
      body:
          "Browse through our wide selection of products and make your purchases with just a few clicks",
    ),
    BoardingModel(
      image: "assets/images/onboarding2.png",
      title: "Track Your Order",
      body:"Stay updated on the status of your order in real-time.",
    ),
    BoardingModel(
      image: "assets/images/onboarding3.png",
      title: "Get Your Order",
      body:"Receive your order right at your doorstep.",
    ),
  ];

  PageController controller = PageController();
  bool islast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context,AppRouter.loginRoute,);
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Color.fromARGB(255, 212, 68, 114)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => buildOnboardingItem(
                boarding[index],
              ),
              itemCount: boarding.length,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged:(index) {
                if(index==boarding.length-1){setState(() {
                  islast=true; 
                } 
                );}else{
                  setState(() {islast=false;
                  
                });
                }
                
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    expansionFactor: 3,
                    dotColor: Colors.grey,
                    spacing: 2,
                    activeDotColor: Color.fromARGB(255, 222, 184, 196),
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                  if(islast){
                 Navigator.pushReplacementNamed(context,AppRouter.loginRoute,);
                  }else{
                    controller.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.linear,
                    );}
                  },
                  backgroundColor: const Color.fromARGB(255, 222, 184, 196),
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
