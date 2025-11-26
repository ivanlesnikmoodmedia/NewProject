import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Map<String, dynamic>? user;
  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = user != null ? (user!['name']) : 'User';
    
    final rooms = [
      {'title': 'Morning', 'subtitle': 'Start your day with energy', 'asset': ''},
      {'title': 'Afternoon', 'subtitle': 'Keep the momentum going', 'asset': ''},
      {'title': 'Evening', 'subtitle': 'Wind down and relax', 'asset': ''},
      {'title': 'Evening', 'subtitle': 'Wind down and relax', 'asset': ''},
      {'title': 'Evening', 'subtitle': 'Wind down and relax', 'asset': ''},
      {'title': 'Evening', 'subtitle': 'Wind down and relax', 'asset': ''},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },
        ),
      ],
    ),
    backgroundColor: const Color(0xFFF7F7FA),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello, $name !',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Good morning, welcome back.',
            style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 18),
            
       Expanded(
              child: ListView.separated(
                itemCount: rooms.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final r = rooms[i];
                  return GestureDetector(
                    onTap: () {
          
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Stack(
                        children: [
                          // background image
                          SizedBox(
                            height: 140,
                            width: double.infinity,
                            child: (r['asset'] != null && (r['asset'] as String).isNotEmpty)
                                ? Image.asset(r['asset']!, fit: BoxFit.cover)
                                : Container(color: Colors.grey.shade300),
                          ),

                          // dark gradient overlay to make text readable
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.black.withOpacity(0.35), Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),

                          // texts
                          Positioned(
                            left: 16,
                            bottom: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(r['title']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(r['subtitle']!,
                                    style: const TextStyle(color: Colors.white70)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}