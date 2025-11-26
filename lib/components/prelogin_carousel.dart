import 'dart:async';
import 'package:flutter/material.dart';

class PreloginCarousel extends StatefulWidget {
  const PreloginCarousel({Key? key}) : super(key: key);

  @override
  State<PreloginCarousel> createState() => _PreloginCarouselState();
}

class _PreloginCarouselState extends State<PreloginCarousel> {
  final PageController _controller = PageController();
  int _page = 0;
  Timer? _timer;

  final List<String> slides = [
    'assets/images/pre1.png',
    'assets/images/pre2.png',
    'assets/images/pre3.png',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      final next = (_page + 1) % slides.length;
      _controller.animateToPage(next, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: slides.length,
          onPageChanged: (i) => setState(() => _page = i),
          itemBuilder: (context, i) {
            final path = slides[i];
            return Container(
              color: Colors.grey.shade200,
              child: (path.isNotEmpty)
                  ? Image.asset(path, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade300))
                  : Container(color: Colors.grey.shade300),
            );
          },
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(slides.length, (i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _page == i ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _page == i ? Colors.white : Colors.white70,
                  borderRadius: BorderRadius.circular(6),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
