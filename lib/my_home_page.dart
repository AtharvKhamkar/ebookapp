import 'dart:convert';

import 'package:ebookapp/app_colors.dart' as AppColors;
import 'package:ebookapp/my_tabs.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List? popularBooks;
  List? books;
  ScrollController? _scrolController;
  TabController? _tabController;
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/books.json")
        .then((s) {
      setState(() {
        books = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrolController = ScrollController();

    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage("img/menu.png"),
                      size: 24,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.notifications_on_rounded)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Popular Books",
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      left: -30,
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.8),
                            itemCount:
                                popularBooks == null ? 0 : popularBooks?.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(popularBooks![i]["img"]),
                                      fit: BoxFit.fill),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrolController,
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: AppColors.sliverBackground,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(50),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 15),
                            child: TabBar(
                              tabs: [
                                AppTabs(
                                    color: AppColors.menu1Color, text: "New"),
                                AppTabs(
                                    color: AppColors.menu2Color,
                                    text: "Popuar"),
                                AppTabs(
                                    color: AppColors.menu3Color,
                                    text: "Trending"),
                              ],
                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 0),
                              controller: _tabController,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                        itemCount: books!.length,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabVarViewColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(books![i]["img"]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Icon(Icons.star,
                                              size: 24,
                                              color: AppColors.starColor),
                                          SizedBox(width: 5),
                                          Text(
                                            books![i]["rating"],
                                            style: TextStyle(
                                                color: AppColors.menu2Color),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Text(
                                          books![i]["title"],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Avenir",
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          books![i]["text"],
                                          style: TextStyle(
                                              color: AppColors.subTitleText,
                                              fontSize: 14,
                                              fontFamily: "Avenir",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          width: 60,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: AppColors.loveColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Like",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: "Avenir",
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Content"),
                      ),
                    ),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Content"),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
