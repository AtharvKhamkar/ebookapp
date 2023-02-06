import "package:flutter/material.dart";
import 'package:ebookapp/app_colors.dart' as AppColors;

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({super.key});

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: screenHeight / 3,
            child: Container(
              color: AppColors.audioBlueBackground,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.25,
            height: screenHeight * 0.36,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Text(
                    "THE WATER CURE",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Avenir"),
                  ),
                  Text(
                    "Martin Height",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: (screenWidth - 150) / 2,
            right: (screenWidth - 150) / 2,
            height: screenHeight * 0.18,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 5),
                color: AppColors.audioGreyBackground,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        image: AssetImage("img/pic-1.png"), fit: BoxFit.cover),
                  ), 
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
