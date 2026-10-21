# Ma Garderie 🧸

Application mobile Flutter pour une garderie d'enfants : écran de démarrage, liste d'activités, menu latéral et interactions.

## Technologies utilisées
- Flutter / Dart
- Git et GitHub

## Installation et exécution
```bash
git clone https://github.com/khouloude123/garderie-mobile.git
cd garderie-mobile
flutter pub get
flutter run
```
Un émulateur Android ou un téléphone en mode débogage USB est nécessaire.

## Fonctionnalités
- Splash Screen avec image et transition automatique après 3 secondes
- Page principale avec AppBar, Drawer (Accueil, Activités, À propos) et bouton `+`
- Liste de 5 activités (icône, titre, description)
- Interactions : messages (SnackBar) pour le bouton `+`, les activités et le Drawer

## Captures d'écran

### Splash Screen
![Splash Screen](screenshots/splash.png)

### Page principale
![Page principale](screenshots/home.png)

### Drawer ouvert
![Drawer](screenshots/drawer.png)

### Message après interaction
![Interaction](screenshots/interaction.png)activités