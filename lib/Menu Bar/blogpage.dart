import 'package:flutter/material.dart';
import 'package:flutter_blog/Footer/footer.dart';
import 'package:search_page/search_page.dart';
import '../Blog Data/blog_list.dart';
import 'listitem.dart';
import 'menubar.dart';

class Data {
  final String title, url, subtitle;
  final Widget name;

  Data(this.title, this.url, this.subtitle, this.name);
}

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                MenuBar(),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: BlogData.data1.length,
                  itemBuilder: (context, index) {
                    final Data data = BlogData.data1[index];
                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2b6767),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ListItem(
                                onpressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return data.name;
                                      },
                                    ),
                                  );
                                },
                                title: data.title,
                                imageUrl: data.url,
                                description: data.subtitle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Footer(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2b6767),
        onPressed: () {
          showSearch(
            context: context,
            delegate: SearchPage<Data>(
                failure: Center(
                  child: Text('No such blog found :('),
                ),
                searchLabel: 'Search Blogs',
                builder: (data) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return data.name;
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff2b6767),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: ListTile(
                                title: Text(data.title),
                                subtitle: Text(data.subtitle),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                filter: (data) => [data.title],
                items: BlogData.data1),
          );
        },
        tooltip: 'Search',
        child: Icon(Icons.search),
      ),
    );
  }
}
