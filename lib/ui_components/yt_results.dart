import 'package:flutter/material.dart';
import 'package:e_derma/models/yt_video_model.dart';
import 'package:url_launcher/url_launcher.dart';

class YtResults extends StatefulWidget {
  Future<List<YtVideoModel>>? results;
  String name;
  YtResults({Key? key, required this.results, required this.name})
      : super(key: key) {}

  @override
  _YtResultsState createState() => _YtResultsState();
}

class _YtResultsState extends State<YtResults> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: FutureBuilder<List<YtVideoModel>>(
            future: widget.results,
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.builder(
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          launch(snapshot.data![index].url);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  snapshot.data != null
                                      ? snapshot.data![index].thumbnailUrl
                                      : "http://placehold.jp/3d4070/ffffff/150x150.png?text=Thumbnail",
                                  fit: BoxFit.cover,
                                  height: 80,
                                  width: 120,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Text(
                                        snapshot.data != null
                                            ? snapshot.data![index].title
                                                        .length <
                                                    50
                                                ? snapshot.data![index].title
                                                : snapshot.data![index].title
                                                        .substring(0, 38) +
                                                    "..."
                                            : "",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Text(
                                      snapshot.data != null
                                          ? snapshot.data![index].channelName
                                                      .length <
                                                  25
                                              ? snapshot
                                                  .data![index].channelName
                                              : snapshot
                                                      .data![index].channelName
                                                      .substring(0, 25) +
                                                  "..."
                                          : "",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black.withOpacity(0.75),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : const SizedBox(
                    height: 300,
                    width: 300,
                    child: Center(child: CircularProgressIndicator())),
          ),
        ),
        InkWell(
          onTap: () {
            launch(
                "https://www.youtube.com/search?q=${widget.name}+treatments");
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Find videos on Youtube",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff084594)),
                ),
                SizedBox(
                  width: 2,
                ),
                Icon(
                  Icons.search,
                  color: Color(0xff084594),
                  size: 12,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
