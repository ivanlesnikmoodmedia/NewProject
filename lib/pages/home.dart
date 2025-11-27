import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find your',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'favorite place',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications_none),
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 4),
                    _PackageChip(
                      label: 'All Package',
                      active: true,
                      icon: Icons.grid_view,
                    ),
                    const SizedBox(width: 12),
                    _PackageChip(
                      label: 'Flight Package',
                      active: false,
                      icon: Icons.flight,
                    ),
                    const SizedBox(width: 12),
                    _PackageChip(
                      label: 'Hotel Package',
                      active: false,
                      icon: Icons.hotel,
                    ),
                    const SizedBox(width: 12),
                    _PackageChip(
                      label: 'Tour Package',
                      active: false,
                      icon: Icons.map,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

   
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Spend little time in nature',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 200,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 4),
                  _ImageCard(
                    image: 'assets/images/background.png',
                    title: 'Croatia',
                    subtitle: 'Croatia, Croatia',
                    rating: 4.8,
                  ),
                  const SizedBox(width: 12),
                  _ImageCard(
                    image: 'assets/images/pre1.png',
                    title: 'Croatia',
                    subtitle: 'Croatia, Croatia',
                    rating: 4.8,
                  ),
                  const SizedBox(width: 12),
                  _ImageCard(
                    image: 'assets/images/pre2.png',
                    title: 'Croatia',
                    subtitle: 'Croatia, Croatia',
                    rating: 4.8,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Popular Destinations section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Destinations',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View all',
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Popular card (big) - can be replaced with list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                children: [
                  _PopularCard(
                    image: 'assets/images/pre2.png',
                    title: 'Croatia',
                    subtitle: 'Croatia, Croatia',
                    rating: 4.2,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _PackageChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool active;

  const _PackageChip({required this.label, required this.icon, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? Colors.greenAccent.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: active ? Colors.green : Colors.grey.shade300),
        boxShadow: active
            ? [BoxShadow(color: Colors.green.withOpacity(0.12), blurRadius: 6, offset: const Offset(0, 4))]
            : [],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: active ? Colors.green : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18, color: active ? Colors.white : Colors.black54),
          ),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double rating;

  const _ImageCard({required this.image, required this.title, required this.subtitle, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 12,
            bottom: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 14),
                        const SizedBox(width: 4),
                        Text(rating.toString(), style: const TextStyle(color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double rating;

  const _PopularCard({required this.image, required this.title, required this.subtitle, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.asset(image, width: 140, height: 140, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
                        child: const Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 14),
                            const SizedBox(width: 6),
                            Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(icon: Icons.explore, label: 'Explore', active: true),
            _NavItem(icon: Icons.calendar_today, label: 'Trip Plane'),
            _AddButton(),
            _NavItem(icon: Icons.favorite_border, label: 'Favorite'),
            _NavItem(icon: Icons.message, label: 'Message'),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavItem({required this.icon, required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.green : Colors.grey.shade600),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 12, color: active ? Colors.green : Colors.grey.shade600)),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.green.withOpacity(0.3), blurRadius: 8)]),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}

