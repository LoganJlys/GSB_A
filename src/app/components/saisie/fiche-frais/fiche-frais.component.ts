import { Component, OnInit } from '@angular/core';

import { FicheFraisService } from '../../../services/fiche-frais.service';
import { AuthService } from '../../../services/auth.service';

@Component({
  selector: 'app-forfait',
    templateUrl: './fiche-frais.component.html',
  styleUrls: ['./fiche-frais.component.css']
})
export class FicheFraisComponent implements OnInit {
  dateFrais: string = '';
  anneeCourante: string = new Date().getFullYear().toString();

  repas = { libelle: 'Repas', quantite: 0, montantUnitaire: 0, total: 0 };
  nuit = { libelle: 'Nuit', quantite: 0, montantUnitaire: 0, total: 0 };
  fraisKilometriques = { quantite: 0, total: 0 };
  selectedCV: string = '3-4';
  
  errorMessage: string = '';
  successMessage: string = '';
  isFicheFraisSubmitted: boolean = false;

  fraisKilometriqueTarifs: Record<string, number> = {
    "3-4": 0.119,
    "5-7": 0.147,
    "8-9": 0.174,
    "10-11": 0.197,
    "12+": 0.219
  };

  constructor(private ficheFraisService: FicheFraisService, private authService: AuthService) {}

  ngOnInit(): void {
    this.dateFrais = new Date().toISOString().slice(0, 10);
  }

  calculateTotal(expense: any): void {
    expense.total = (expense.quantite ?? 0) * (expense.montantUnitaire ?? 0);
    this.updateMontantValide();
  }

  onRepasChange(): void { this.calculateTotal(this.repas); }
  onNuitChange(): void { this.calculateTotal(this.nuit); }
  calculateKilometricFee(): void {
    const tarif = this.fraisKilometriqueTarifs[this.selectedCV] || 0;
    this.fraisKilometriques.total = (this.fraisKilometriques.quantite ?? 0) * tarif;
    this.updateMontantValide();
  }

  updateMontantValide(): void {
    const montantValide = this.repas.total + this.nuit.total + this.fraisKilometriques.total;
    this.successMessage = montantValide > 0 ? `Montant valide: ${montantValide}€` : '';
  }


  resetForm(): void {
    this.dateFrais = new Date().toISOString().slice(0, 10);
    this.repas = { libelle: 'Repas', quantite: 0, montantUnitaire: 0, total: 0 };
    this.nuit = { libelle: 'Nuit', quantite: 0, montantUnitaire: 0, total: 0 };
    this.fraisKilometriques = { quantite: 0, total: 0 };
    this.selectedCV = '3-4';
    this.errorMessage = '';
    this.successMessage = '';
    this.isFicheFraisSubmitted = false;
  }

  soumettreFiche(): void {
    if (this.isFicheFraisSubmitted) {
      this.errorMessage = 'La fiche de frais a déjà été soumise.';
      return;
    }

    const userId = this.authService.getUserId();
    if (!userId) {
      this.errorMessage = 'Impossible de récupérer l\'ID utilisateur. Veuillez vous reconnecter.';
      return;
    }

    const mois = this.dateFrais.slice(0, 7).replace('-', '');
    const montantValide = this.repas.total + this.nuit.total + this.fraisKilometriques.total;

    if (montantValide === 0) {
      this.errorMessage = 'Le montant valide ne peut pas être nul.';
      return;
    }

    const ficheFrais = {
      date_modif: new Date().toISOString().slice(0, 10),
      mois,
      montant_valide: montantValide,
      nb_justificatifs: 0,
      user: { id: userId },
      etat: { id: 1 }
    };

    this.isFicheFraisSubmitted = true;
    this.ficheFraisService.createFicheFrais(ficheFrais).subscribe(
      response => this.addExpensesToFiche(response.id),
      () => {
        this.isFicheFraisSubmitted = false;
        this.errorMessage = 'Erreur lors de la soumission de la fiche de frais. Veuillez réessayer.';
      }
    );
  }

  addExpensesToFiche(ficheFraisId: number): void {
    const expenses = [
      { label: 'Repas du midi', data: this.repas },
      { label: 'Nuitée', data: this.nuit },
      { label: 'Frais kilométriques', data: { total: this.fraisKilometriques.total, quantite: 1 } }
    ];
  
    let errorOccurred = false;
    
    expenses.forEach(expense => {
      if (expense.data.quantite > 0 && expense.data.total > 0) {
        this.ficheFraisService.createFraisForfait(ficheFraisId, expense.label, expense.data.total).subscribe(
          fraisForfaitResponse => {
            // Ajout d'une ligne de frais forfaitaire associée
            this.ficheFraisService.createLigneFraisForfait(fraisForfaitResponse.id, this.dateFrais, expense.data.quantite)
              .subscribe(
                () => {},
                () => { errorOccurred = true; }
              );
          },
          () => { errorOccurred = true; }
        );
      }
    });
  
    if (!errorOccurred) {
      this.successMessage = 'Fiche de frais soumise avec succès!';
    } else {
      this.errorMessage = 'Erreur lors de l\'ajout des frais forfaitaires.';
    }
  }
}  