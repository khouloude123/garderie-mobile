import 'package:flutter/material.dart';

const List<Map<String, dynamic>> activites = [
  {
    "id": 1,
    "titre": "Dessin et coloriage",
    "description": "Développement de la créativité",
    "icone": "🎨",
  },
  {
    "id": 2,
    "titre": "Jeux éducatifs",
    "description": "Apprentissage par le jeu",
    "icone": "🧩",
  },
  {
    "id": 3,
    "titre": "Musique et chansons",
    "description": "Éveil musical des enfants",
    "icone": "🎵",
  },
  {
    "id": 4,
    "titre": "Lecture de contes",
    "description": "Découverte des histoires",
    "icone": "📚",
  },
  {
    "id": 5,
    "titre": "Activités sportives",
    "description": "Développement de la motricité",
    "icone": "⚽",
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<String> _menuTitres = ['Accueil', 'Activités', 'À propos'];
  static const List<IconData> _menuIcones = [
    Icons.home,
    Icons.palette,
    Icons.info,
  ];

  void _message(String texte) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(texte), duration: const Duration(seconds: 2)),
      );
  }

  Widget _listeActivites() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: activites.length,
      itemBuilder: (context, index) {
        final activite = activites[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Text(
              activite['icone'] as String,
              style: const TextStyle(fontSize: 36),
            ),
            title: Text(
              activite['titre'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(activite['description'] as String),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _message(activite['titre'] as String),
          ),
        );
      },
    );
  }

  Widget _aPropos() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Ma Garderie\n\nApplication mobile de présentation des activités '
          "d'une garderie d'enfants.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3FC),
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        backgroundColor: const Color(0xFF4A90D9),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF4A90D9)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Ma Garderie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            for (int i = 0; i < _menuTitres.length; i++)
              ListTile(
                leading: Icon(_menuIcones[i]),
                title: Text(_menuTitres[i]),
                selected: _selectedIndex == i,
                selectedTileColor: const Color(0xFFEAF3FC),
                onTap: () {
                  setState(() => _selectedIndex = i);
                  Navigator.of(context).pop();
                  _message('Vous avez choisi : ${_menuTitres[i]}');
                },
              ),
          ],
        ),
      ),
      body: _selectedIndex == 2 ? _aPropos() : _listeActivites(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _message('Nouvelle activité'),
        backgroundColor: const Color(0xFF4A90D9),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
