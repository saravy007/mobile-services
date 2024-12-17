import 'package:caf/language/language_constant.dart';
import 'package:caf/provider/carousel_provider.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/settings/app_color.dart';
import 'package:caf/settings/app_font.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}
class _MainHomeScreenState extends State<MainHomeScreen> {
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageProvider>().lang;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: _buildService(),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildCardInfo(),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildTitle(),
            ),
            const SizedBox(
              height: 16,
            ),
            _builCarouselSlider()
          ],
        ),
      ),
    ));
  }

  Widget _buildTitle() {
    return Card(
      color: AppColors.appBarColor,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          _lang.leader_action,
          style: TextStyle(
              fontFamily: AppFont.bodyFont,
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildService() {
    return Card(
      color: AppColors.appBarColor,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          _lang.leader_action,
          style: TextStyle(
              fontFamily: AppFont.bodyFont,
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildCardInfo() {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(16.0)),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("  សមាជិកភាពចូលរួមតាំងពី..."),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("  បានស្នើសុំសេវាចំនួនៈ "),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("     - បញ្ជាក់ភាពត្រឹមត្រូវចំនួនៈ "),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("     - កែតម្រូវចំនួនៈ "),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("     - ទុតិយតាចំនួនៈ "),
              )
            ],
          ),
        ));
  }

  final List<String> imgList = [
    // "pictures/moeys_logo.png",
    "pictures/1.jpg",
    "pictures/2.jpg",
    "pictures/3.jpg",
    "pictures/4.jpg",
   
  ];
  //=============build Carousel =================
  Widget _builCarouselSlider() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              aspectRatio: 16 / 10,
              initialPage: 0,
              // padEnds: true,
              onPageChanged: (index, reason) {
                context.read<CarouselProvider>().setCurrentIndex(index);
              }),
          items: imgList.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(16.0), // Apply border radius here
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: screenWidth, // Adjust width based on screen size
                    height: screenHeight, // Adjust height based on screen size
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Consumer<CarouselProvider>(
          builder: (context, carouselProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselProvider.setCurrentIndex(entry.key),
                  child: Container(
                    width: carouselProvider.currentIndex == entry.key ? 12 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: carouselProvider.currentIndex == entry.key
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
