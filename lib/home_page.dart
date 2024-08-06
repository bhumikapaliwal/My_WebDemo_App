import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_app/model/post.dart';
import 'package:web_app/model/remote_services.dart';
import 'package:web_app/router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: ()async {
            // Navigate to CartScreen
             context.router.push(CartScreen());
          },
        ),
      ],),
      body: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile layout
          return MobileHomePage();
        } else if (constraints.maxWidth < 1200) {
          // Tablet layout
          return TabletHomePage();
        } else {
          // Desktop layout
          return DesktopHomePage();
        }
      },
    );
  }
}

class MobileHomePage extends StatefulWidget {
  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getpost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      child: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts![index]);
        },
      ),
    );
  }
}

class TabletHomePage extends StatefulWidget {
  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getpost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts![index]);
        },
      ),
    );
  }
}

class DesktopHomePage extends StatefulWidget {
  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getpost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      child: GridView.builder(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
        ),
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts![index]);
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.person, size: 50, color: Colors.blue), // Placeholder for an image
            SizedBox(height: 8),
            Flexible(
              child: Text(
                post.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis, // Adds ellipsis if text overflows
              ),
            ),
            SizedBox(height: 4),
            Flexible(
              child: Text(post.username, style: TextStyle(color: Colors.grey[600])),
            ),
            SizedBox(height: 4),
            Flexible(
              child: Text(post.email, style: TextStyle(color: Colors.grey[600])),
            ),
            SizedBox(height: 4),
            Flexible(
              child: Text(post.address.city, style: TextStyle(color: Colors.grey[600])),
            ),
          ],
        ),
      ),
    );
  }
}

