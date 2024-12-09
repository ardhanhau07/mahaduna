import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna/app/modules/login/views/login_view.dart';
import '../../../data/constants.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnboardingController controller = Get.put(OnboardingController());

  int currentIndex = 0;

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginView()));
              }, // to login screen
              child: const Text(
                'Skip',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                title: Constants.titleOne,
                description: Constants.descriptionOne,
                image: 'assets/images/asset.png',
              ),
              createPage(
                title: Constants.titleTwo,
                description: Constants.descriptionOne,
                image: 'assets/images/asset2.png',
              ),
              createPage(
                title: Constants.titleThree,
                description: Constants.descriptionThree,
                image: 'assets/images/asset3.png',
              ),
            ],
          ),
          Positioned(
              bottom: 80,
              left: 30,
              child: Row(
                children: [..._buildIndicator()],
              )),
          Positioned(
              bottom: 60,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Constants.primaryColor),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex < 2) {
                          currentIndex++;
                          if (currentIndex < 3) {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginView()));
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: Colors.white,
                    )),
              ))
        ],
      ),
    );
  }
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 10.0,
    width: isActive ? 20 : 8,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
        color: Constants.primaryColor, borderRadius: BorderRadius.circular(5)),
  );
}

class createPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  const createPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
