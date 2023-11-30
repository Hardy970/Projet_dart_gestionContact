import 'dart:core';
import 'dart:io';

class Contact {
  int id;
  String nom;
  String email;
  String numeroTelephone;
  String identifiantPays;

  Contact(
      {required this.id,
      required this.nom,
      required this.email,
      required this.numeroTelephone,
      required this.identifiantPays});
}

class GestionnaireContacts {
  List<Contact> _contacts = [];

  // Méthode pour ajouter un contact
  void ajouterContact(Contact contact) {
    _contacts.add(contact);
  }

  // Méthode pour afficher tous les contacts
  void afficherContacts() {
    print('Liste des contacts:');
    _contacts.forEach((contact) {
      print(
          '${contact.id}: \nNom:${contact.nom} \n Tel:${contact.identifiantPays} ${contact.numeroTelephone} \n Email:${contact.email}\n');
    });
  }

  // Méthode pour rechercher des contacts
  List<Contact> rechercherContacts(String termeRecherche) {
    return _contacts.where((contact) {
      return contact.nom.toLowerCase().contains(termeRecherche.toLowerCase()) ||
          contact.email.toLowerCase().contains(termeRecherche.toLowerCase()) ||
          contact.numeroTelephone.contains(termeRecherche) ||
          contact.identifiantPays.contains(termeRecherche);
    }).toList();
  }
}

void main() {
  GestionnaireContacts gestionnaire = GestionnaireContacts();
  int idCounter = 1;

  while (true) {
    print('Menu:');
    print('1. Ajouter un contact');
    print('2. Afficher les contacts');
    print('3. Rechercher des contacts');
    print('4. Quitter');

    stdout.write('Choisissez une option (1-4): ');
    String choix = stdin.readLineSync() ?? '';

    switch (choix) {
      case '1':
        // Ajouter un contact
        stdout.write('Nom du contact: ');
        String nom = stdin.readLineSync() ?? '';

        stdout.write('Email du contact: ');
        String email = stdin.readLineSync() ?? '';

        stdout.write('Numéro de téléphone du contact: ');
        String numeroTelephone = stdin.readLineSync() ?? '';

        stdout.write('Identifiant de pays du contact: ');
        String identifiantPays = stdin.readLineSync() ?? '';

        gestionnaire.ajouterContact(Contact(
            id: idCounter++,
            nom: nom,
            email: email,
            numeroTelephone: numeroTelephone,
            identifiantPays: identifiantPays));
        break;

      case '2':
        // Afficher les contacts
        gestionnaire.afficherContacts();
        break;

      case '3':
        // Rechercher des contacts
        stdout.write('Entrez le terme de recherche: ');
        String termeRecherche = stdin.readLineSync() ?? '';

        List<Contact> resultatsRecherche =
            gestionnaire.rechercherContacts(termeRecherche);
        print('Résultats de la recherche pour "$termeRecherche":');
        resultatsRecherche.forEach((contact) {
          print(
              '${contact.id}: ${contact.nom} - ${contact.email} - ${contact.numeroTelephone} - ${contact.identifiantPays}');
        });
        break;

      case '4':
        // Quitter
        return;

      default:
        print('Option invalide. Veuillez choisir une option entre 1 et 4.');
    }
  }
}
