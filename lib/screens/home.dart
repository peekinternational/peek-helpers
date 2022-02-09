import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peek_helpers_flutter/modals/provider_info.dart';
import 'package:peek_helpers_flutter/response/categories_response.dart';
import 'package:peek_helpers_flutter/response/search_provider_response.dart';
import 'package:peek_helpers_flutter/screens/testting_purpose.dart';
import 'package:peek_helpers_flutter/utils/ai_util.dart';
import 'package:peek_helpers_flutter/utils/constant.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _sController;
  List<Categories> categories = [];
  List<SearchData> providersList = [];
  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sController = ScrollController()..addListener(_scrollListener);
    dio.options.baseUrl = 'https://peekhelpers.com/api/';
    _fetchCategories();
    ProviderInfo providerInfo =
        ProviderInfo("1.000", "82.144165", 0, "", "26.773249");
    _fetchProviders(providerInfo: providerInfo);
  }

  void _scrollListener() {
    if (_sController.offset >= _sController.position.maxScrollExtent &&
        !_sController.position.outOfRange) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      // mainAxisSize: MainAxisSize.min,
      children: [
        // 25.heightBox,
        HStack(
          [
            const Icon(
              Icons.my_location,
              color: Colors.blue,
            ),
            40.widthBox,
            const Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                      child: Icon(Icons.location_on, color: Color(0xFFe91e63))),
                  TextSpan(text: 'My Current Location'),
                ],
              ),
            ),
            80.widthBox,
            const Icon(
              Icons.arrow_drop_down_circle_outlined,
            )
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        ).h(45).p16().centered(),
        HStack(
          [
            const Icon(Icons.search_rounded).px8(),
            10.widthBox,
            "Find Categories here".text.make(),
            80.widthBox,
            const Icon(Icons.notifications, color: Color(0xFFe91e63)).px8()
          ],
          axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.spaceBetween,
        ).backgroundColor(AIColors.lightWhite).h(45).p4().centered(),
        28.heightBox,
        HStack(
          [
            "Browse Categories".text.bold.color(Colors.blue).make(),
            "See All".text.bold.color(Colors.blue).make()
          ],
          alignment: MainAxisAlignment.spaceBetween,
          crossAlignment: CrossAxisAlignment.start,
          axisSize: MainAxisSize.max,
        ).px16(),
        20.heightBox,
        hCatListWgt(),
        10.heightBox,
        HStack(
          [
            "Recommendations".text.bold.color(Colors.blue).make(),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          crossAlignment: CrossAxisAlignment.start,
          axisSize: MainAxisSize.max,
        ).px16(),
        5.heightBox,
        vHelpersListWgt()
      ],
    ));
  }

  void _fetchCategories() async {
    Response rs;
    rs = await dio.get('categories');
    categories = CategoryResponse.fromJson(rs.data).categories!;
    print(categories.length.toString());
    setState(() {});
  }

  void _fetchProviders({required ProviderInfo providerInfo}) async {
    try {
      dynamic data = {
        "km": "1.000",
        "longitude": "82.144165",
        "limit": 0,
        "skill": "",
        "latitude": "26.773249"
      };

      Response rs;
      rs = await dio.post('search-providers', data: data);
      providersList = SearchProvider.fromJson(rs.data).searchData!;
      print(rs.data.toString());
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  Widget hCatListWgt() {
    return categories.isNotEmpty
        ? Expanded(
            child: SizedBox(
              height: 100.0,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) => VStack(
                  [
                    CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          imageUrl: Constants.skillsImageUrl +
                              categories[index].skillImage.toString(),
                        ),
                      ),
                    ),
                    8.heightBox,
                    categories[index]
                        .skillName
                        .toString()
                        .text
                        .overflow(TextOverflow.ellipsis)
                        .maxLines(1)
                        .makeCentered(),
                  ],
                  alignment: MainAxisAlignment.start,
                  crossAlignment: CrossAxisAlignment.center,
                  axisSize: MainAxisSize.max,
                ).px8().wh24(context),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              color: AIColors.primaryColor1,
            ),
          );
  }

  Widget vHelpersListWgt() {
    return providersList.isNotEmpty
        ? Expanded(
            flex: 6,
            child: GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(providersList.length, (index) {
                return InkWell(
                  onTap: () => _navigateAndDisplaySelection(context),
                  child: SizedBox(
                    height: double.infinity,
                    child: Card(
                      shadowColor: Colors.amberAccent,
                      clipBehavior: Clip.antiAlias,
                      semanticContainer: true,
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      color: Colors.white,
                      child: VStack(
                        [
                          providersList[index].image != null
                              ? CachedNetworkImage(
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                    child: CircularProgressIndicator(
                                      value: progress.progress,
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  height: !kIsWeb
                                      ? 100
                                      : context.screenSize.height / 2 + 100,
                                  imageUrl: Constants.ImageUrl +
                                      providersList[index].image.toString(),
                                )
                              : Image.asset(
                                  "assets/images/ic_placeholder.png",
                                  width: MediaQuery.of(context).size.width,
                                  height: !kIsWeb
                                      ? 100
                                      : context.screenSize.height / 2 + 100,
                                  fit: BoxFit.cover,
                                ),
                          Text(
                            providersList[index].name.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ).py(4).px(8),
                          Text(
                            providersList[index].skill.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ).px8(),
                          const Divider(
                            thickness: 2,
                          ),
                          Text(providersList[index].location.toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 10,
                              )).px(5)
                        ],
                        alignment: MainAxisAlignment.spaceBetween,
                        axisSize: MainAxisSize.max,
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              color: AIColors.primaryColor1,
            ),
          );
  }


  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    print('$result');
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}
