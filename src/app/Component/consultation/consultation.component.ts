// Importation des modules nécessaires pour le composant
import { Component } from '@angular/core'; // Le décorateur Component est utilisé pour définir le composant.
import { FormsModule } from '@angular/forms'; // Import du module FormsModule pour utiliser ngModel dans le template.
import { CommonModule } from '@angular/common'; // Importation de CommonModule, nécessaire pour les directives comme ngIf et ngFor.

// Définition du composant avec son sélecteur, son template et ses styles
@Component({
  selector: 'app-consultation', // Le sélecteur utilisé pour inclure ce composant dans un autre fichier HTML.
  standalone: true, // Cela permet de déclarer ce composant comme un composant autonome, sans être dans un module Angular.
  templateUrl: './consultation.component.html', // Le fichier template (HTML) associé à ce composant.
  styleUrls: ['./consultation.component.css'], // Le fichier de styles (CSS) pour ce composant.
  imports: [FormsModule, CommonModule] // Importation de FormsModule pour la gestion des formulaires et CommonModule pour des fonctionnalités communes.
})
export class ConsultationComponent {
  // Propriétés pour la gestion de la sélection du mois et des données de la fiche de frais
  moisSelectionne: string = ''; // Variable liée à ngModel pour stocker le mois sélectionné.
  moisOptions = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre']; // Liste des mois disponibles pour la sélection.

  // Structure d'objet pour stocker les données des frais de la fiche
  ficheDeFrais = {
    mois: '', // Le mois auquel les frais se rapportent
    etat: '', // L'état de la fiche (par exemple : validée, en attente...)
    fraisForfaitises: [ // Liste des frais forfaitisés
      { type: 'Nuitée', quantite: 0, montantUnitaire: 80 }, // Exemple de frais forfaitisé pour une nuitée
      { type: 'Repas midi', quantite: 0, montantUnitaire: 29 }, // Exemple de frais forfaitisé pour un repas
      { type: 'Kilométrage', quantite: 0, montantUnitaire: 0.52 } // Exemple de frais forfaitisé pour du kilométrage
    ],
    fraisHorsForfait: [ // Liste des frais hors forfait
      { libelle: 'Hôtel', montant: 120, date: '2023-04-15' }, // Exemple de frais hors forfait (Hôtel)
      { libelle: 'Taxi', montant: 45, date: '2023-04-16' } // Exemple de frais hors forfait (Taxi)
    ]
  };

  // Méthode appelée lorsque l'utilisateur clique sur le bouton "Consulter"
  consulterFicheDeFrais() {
    console.log(`Consultation pour le mois de ${this.moisSelectionne}`); // Logique pour afficher ou traiter la fiche de frais du mois sélectionné
    // Ici, tu pourrais ajouter une logique pour charger les données depuis une API ou une base de données.
  }
}
