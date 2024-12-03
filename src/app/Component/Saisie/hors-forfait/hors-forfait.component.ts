import { Component } from '@angular/core';

@Component({
  selector: 'app-hors',
  templateUrl: './hors-forfait.component.html',
  styleUrls: ['./hors-forfait.component.css']
})
export class HorsForfaitComponentyComponent {
  // Déclaration des champs pour les données
  nom: string = '';
  prenom: string = '';
  matricule: string = '';
  dateDebut: string = '';
  dateFin: string = '';
  libelle: string = '';
  montant: number | null = null;

  onSubmit() {
    // Logique pour envoyer les données (ex : appel API ou service Angular)
    console.log("Données envoyées : ", {
      nom: this.nom,
      prenom: this.prenom,
      matricule: this.matricule,
      dateDebut: this.dateDebut,
      dateFin: this.dateFin,
      libelle: this.libelle,
      montant: this.montant
    });
  }

  onReset() {
    // Remettre tous les champs à vide
    this.nom = '';
    this.prenom = '';
    this.matricule = '';
    this.dateDebut = '';
    this.dateFin = '';
    this.libelle = '';
    this.montant = null;
  }
}
