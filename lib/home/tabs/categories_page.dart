import 'package:flutter/material.dart';

// الصفحة الرئيسية للكروت
class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _gradientAnimation;

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.computer, "title": "Programming", "color": Colors.blue},
    {"icon": Icons.brush, "title": "Design", "color": Colors.purple},
    {"icon": Icons.language, "title": "Languages", "color": Colors.green},
    {"icon": Icons.business, "title": "Business", "color": Colors.orange},
    {"icon": Icons.attach_money, "title": "Finance", "color": Colors.red},
    {"icon": Icons.camera_alt, "title": "Photography", "color": Colors.teal},
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _gradientAnimation = ColorTween(
      begin: Colors.purpleAccent,
      end: Colors.blueAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToDetail(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailPage(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _gradientAnimation,
      builder: (context, child) {
        Color currentColor = _gradientAnimation.value ?? Colors.purpleAccent;

        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: currentColor,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _gradientAnimation.value ?? Colors.purpleAccent,
                  Colors.deepPurpleAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => navigateToDetail(item["title"]),
                    child: Container(
                      decoration: BoxDecoration(
                        color: item["color"].withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => navigateToDetail(item["title"]),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: item["color"],
                              child: Icon(
                                item["icon"],
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item["title"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// صفحة التفاصيل لكل كارت
class CategoryDetailPage extends StatelessWidget {
  final String title;

  const CategoryDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Welcome to $title page!",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


