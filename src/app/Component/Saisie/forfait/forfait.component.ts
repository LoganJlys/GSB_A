import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-forfait',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './forfait.component.html',
  styleUrls: ['./forfait.component.css']
})
export class ForfaitComponent {
  mois: string = '';
  dateDebut: string = '';
  dateFin: string = '';
  nom: string = '';
  prenom: string = '';
  matricule: string = '';
  moisOptions: string[] = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];

  expenses = [
    { label: 'Repas', quantite: 0, montantUnitaire: 25, total: 0 },
    { label: 'Nuitée', quantite: 0, montantUnitaire: 80, total: 0 },
    { label: 'Kilométrage', quantite: 0, montantUnitaire: 0.5, total: 0 },
  ];


  constructor() {
    // Initialiser la variable 'mois' avec le mois actuel
    const currentDate = new Date();
    const monthNames = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];
    this.mois = monthNames[currentDate.getMonth()]; // Mois actuel
  }
  calculateTotal(expense: any) {
    expense.total = expense.quantite * expense.montantUnitaire;
  }

  
}
