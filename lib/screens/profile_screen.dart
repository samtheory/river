import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river/appwrite/appwrite_client.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Account account = ref.watch(accountProvider);
    // Database database = ref.watch(databaseProvider);

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 18),
                        child: CircleAvatar(
                          maxRadius: 40,
                          backgroundImage: NetworkImage(
                              'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg'),
                        ),
                      ),
                      Column(
                        children: const [
                          Text('128',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('Post')
                        ],
                      ),
                      Column(
                        children: const [
                          Text('128',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('Followers')
                        ],
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'This is the title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                      'This is the total biography an ddetails aboute this person. ...............'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('new Post')),
                      ElevatedButton(onPressed: null, child: Text('new Post')),
                      ElevatedButton(onPressed: null, child: Text('new Post'))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Container(
                          color: Colors.blue,
                          child: const Center(
                            child: Text('text'),
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Container(
                          color: Colors.blue,
                          child: const Center(
                            child: Text('text'),
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Container(
                          color: Colors.blue,
                          child: const Center(
                            child: Text('text'),
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text('text'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
