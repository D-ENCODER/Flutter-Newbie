import 'package:flutter/material.dart';
import 'package:flutter_blog/Constants/constants.dart';
import 'package:flutter_blog/Footer/footer.dart';
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
  String query = '';
  late List<Data> blogs;
  @override
  void initState() {
    super.initState();
    blogs = allData;
  }

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
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: buildSearch(),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: blogs.length,
                  itemBuilder: (context, index) {
                    final Data data = blogs[index];
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
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        onChanged: searchBlog,
        hintText: 'Search Blogs......',
      );

  void searchBlog(String query) {
    final blogs = allData.where((data) {
      final blogTitle = data.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return blogTitle.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.blogs = blogs;
    });
  }
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return
        // Container(
        //   height: 42,
        //   margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(12),
        //     color: Colors.white,
        //     border: Border.all(color: Colors.black26),
        //   ),
        //   padding: const EdgeInsets.symmetric(horizontal: 8),
        // child:
        TextField(
      controller: controller,
      decoration: inputMethod().copyWith(
        prefixIcon: Icon(Icons.search, color: Color(0xff2b6767)),
        suffixIcon: widget.text.isNotEmpty
            ? GestureDetector(
                child: Icon(Icons.close, color: Color(0xff2b6767)),
                onTap: () {
                  controller.clear();
                  widget.onChanged('');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
            : null,
      ),
      style: style,
      onChanged: widget.onChanged,
    );
    // );
  }
}
