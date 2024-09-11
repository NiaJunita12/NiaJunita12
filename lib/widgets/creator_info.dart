import 'package:flutter/material.dart';

class CreatorInfo extends StatelessWidget {
  const CreatorInfo({super.key});

  @override
  Widget build(BuildContext context) {
  void onTutupTap () {
    Navigator.of(context).pop();
  }

  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tentang Pembuat',
              style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(50),
                child: const Image(
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/jeno.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Nia Junita',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'XII RPL 2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: SizedBox(
          width: 50,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: onTutupTap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              backgroundColor: const Color.fromARGB(184, 245, 140, 228),
              foregroundColor: Colors.white,
              elevation: 0),
              label: const Icon(
                Icons.close,
              ),
            ),
          ),
        ),
      ],
    );
  }
}