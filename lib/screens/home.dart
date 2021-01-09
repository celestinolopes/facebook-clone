import 'package:facebook_clone/data/posts_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../data/stories_data.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: false,
              title: Text(
                'Facebook',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.3,
                ),
              ),
              actions: [
                CircleIcon(
                  icon: Icons.search_rounded,
                ),
                CircleIcon(
                  icon: MdiIcons.facebookMessenger,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://avatars0.githubusercontent.com/u/56524150?s=460&u=0278c6bfd7b8dc8d972639db8e8dd9c57afb93d4&v=4',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Em que estás a pensar ?',
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.grey[100],
                child: Row(
                  children: [
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live'),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.photo,
                        color: Colors.green,
                      ),
                      label: Text('Fotos'),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purple,
                      ),
                      label: Text('Chat'),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 4,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: 300,
                height: 155,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 150,
                        width: 105,
                        margin: EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              stories[i].image_story,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 5,
                              child: stories[i].isActiveUser
                                  ? Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  : Container(
                                      width: 37,
                                      height: 37,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          stories[i].imagem_perfile,
                                        ),
                                      ),
                                    ),
                            ),
                            Positioned(
                              child: Text(
                                stories[i].nome,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              bottom: 10,
                              right: 10,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 300,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    posts[i].imageProfile,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  posts[i].usuario,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  posts[i].data,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              posts[i].conteudo,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.network(
                              posts[i].imageUrl,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                height: 80,
                                color: Colors.grey[100],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlatButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.thumb_up,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        label: Text(
                                          'Gosto',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )),
                                    FlatButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.comment,
                                          size: 14,
                                          color: Colors.grey[700],
                                        ),
                                        label: Text(
                                          'Comentário',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                        )),
                                    FlatButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.share,
                                          size: 14,
                                          color: Colors.grey[700],
                                        ),
                                        label: Text(
                                          'Partilhar',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorWeight: 3,
          tabs: [
            Tab(
              icon: Icon(
                MdiIcons.home,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_box_rounded,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.facebookMessenger,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.menu,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  CircleIcon({this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            maxWidth: 80,
            minWidth: 40,
          ),
          iconSize: 20,
          icon: Icon(
            icon,
            size: 20,
          ),
          onPressed: () {},
          color: Colors.black,
        ),
      ),
    );
  }
}
