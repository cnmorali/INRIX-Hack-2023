import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_navigation/constants/restaurants.dart';

import '../helpers/shared_prefs.dart';

class RestaurantsTable extends StatefulWidget {
  const RestaurantsTable({Key? key}) : super(key: key);

  @override
  State<RestaurantsTable> createState() => _RestaurantsTableState();
}

class _RestaurantsTableState extends State<RestaurantsTable> {
  /// Add handlers to buttons later on

  Widget cardButtons(IconData iconData, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(5),
          minimumSize: Size.zero,
        ),
        child: Row(
          children: [
            Icon(iconData, size: 16),
            const SizedBox(width: 2),
            Text(label)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Rides'),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CupertinoTextField(
                prefix: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(Icons.search),
                ),
                padding: EdgeInsets.all(15),
                placeholder: 'Search destinations',
                style: TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              const SizedBox(height: 5),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CachedNetworkImage(
                        //   height: 175,
                        //   width: 140,
                        //   fit: BoxFit.cover,
                        //   imageUrl: restaurants[index]['image'],
                        // ),
                        Expanded(
                          child: Container(
                            color: Colors.lightGreen[800],
                            height: 175,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurants[index]['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(restaurants[index]['items']),
                                const Spacer(),
                                const Text('Waiting time: 2hrs'),
                                Text(
                                  'Closes at 10PM',
                                  style:
                                      TextStyle(color: Colors.redAccent[100]),
                                ),
                                Row(
                                  children: [
                                    cardButtons(Icons.call, 'Call'),
                                    cardButtons(Icons.location_on, 'Map'),
                                    const Spacer(),
                                    Text(
                                        '${(getDistanceFromSharedPrefs(index) / 1000).toStringAsFixed(2)}km'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
