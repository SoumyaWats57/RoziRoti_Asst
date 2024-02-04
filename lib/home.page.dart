import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline/music.player.dart';
import 'package:timeline/widgets/my.timeline.tile.dart';
import 'package:timeline/widgets/timeline.conatiner.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' RamMandir Timeline',
          style: GoogleFonts.kavoon(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MusicPlayer.routeName);
            },
            icon: const Icon(Icons.library_music_rounded),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 253, 164, 30),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: const [
              // Timeline Tile 1
              MyTimeLineTile(
                isFirst: true,
                isLast: false,
                endChild: TimeLineContainer(
                  title: 'Babri Masjid Construction',
                  date: '1528',
                  description:
                      'The Babri Masjid was constructed in Ayodhya during the Mughal era.',
                  imagePath: 'assets/images/one.webp',
                ),
              ),
              // Timeline Tile 2
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                endChild: TimeLineContainer(
                  title: 'Ram Janmabhoomi Movement Begins',
                  date: 'December 22, 1949',
                  description:
                      ' Idols of Lord Ram appeared inside the Babri Masjid, leading to increased tensions between the Hindu and Muslim communities.',
                  imagePath: 'assets/images/two.webp',
                ),
              ),
              // Timeline Tile 3
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                endChild: TimeLineContainer(
                  title: 'Babri Masjid Demolition',
                  date: 'December 6, 1992',
                  description:
                      'The Babri Masjid was demolished by a large crowd of Hindu activists, leading to communal riots across India.',
                  imagePath: 'assets/images/three.jpg',
                ),
              ),
              // Timeline Tile 4
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                endChild: TimeLineContainer(
                  title: 'Formation of Liberhan Commission',
                  date: 'December 16, 1992',
                  description:
                      'The Liberhan Commission was set up to investigate the circumstances leading to the demolition of the Babri Masjid.',
                  imagePath: 'assets/images/four.webp',
                ),
              ),
              // Timeline Tile 5
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                endChild: TimeLineContainer(
                  title: 'Allahabad High Court Verdict',
                  date: 'September 30, 2010',
                  description:
                      'The Allahabad High Court ruled on the ownership of the disputed site, dividing it among three parties - the Sunni Waqf Board, the Nirmohi Akhara, and the deity Ram Lalla.',
                  imagePath: 'assets/images/five.jpg',
                ),
              ),
              // Timeline Tile 6
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                endChild: TimeLineContainer(
                  title: 'Supreme Court Verdict',
                  date: 'November 9, 2019',
                  description:
                      'The Supreme Court of India delivered a unanimous verdict, granting the entire disputed site to the Hindus. It also directed the government to provide an alternative plot for the construction of a mosque.',
                  imagePath: 'assets/images/six.jpg',
                ),
              ),
              // Timeline Tile 7
              MyTimeLineTile(
                isFirst: false,
                isLast: false,
                endChild: TimeLineContainer(
                  title: 'Bhoomi Pujan for Ram Mandir',
                  date: 'August 5, 2020',
                  description:
                      'The foundation stone (Bhoomi Pujan) for the construction of the Ram Mandir was laid in a grand ceremony attended by various political and religious leaders.',
                  imagePath: 'assets/images/seven.webp',
                ),
              ),
              // Timeline Tile 8
              MyTimeLineTile(
                isFirst: false,
                isLast: true,
                endChild: TimeLineContainer(
                  title: 'Construction Commences',
                  date: 'January 2021',
                  description:
                      'The actual construction work for the Ram Mandir began in January 2021.',
                  imagePath: 'assets/images/eight.jpg',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
