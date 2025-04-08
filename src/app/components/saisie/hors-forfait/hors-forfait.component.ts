import { Component } from '@angular/core';

import { FicheFraisService } from '../../../services//fiche-frais.service';
import { AuthService } from '../../../services/auth.service';

@Component({
  selector: 'app-hors-forfait',
  
  templateUrl: './hors-forfait.component.html',
  styleUrls: ['./hors-forfait.component.css']
})
export class HorsForfaitComponent {
  // Liste des frais hors forfait
  fraisHorsForfait: { libelle: string; justificatif: string; montant: number | null }[] = [
    { libelle: '', justificatif: '', montant: null }
  ];

  dateFrais: string = new Date().toISOString().split('T')[0];
  anneeCourante: string = new Date().getFullYear().toString();

  errorMessage: string = '';
  successMessage: string = '';
  isFicheFraisSubmitted: boolean = false;

  constructor(private ficheFraisService: FicheFraisService, private authService: AuthService) {}

  // Ajouter une ligne de frais hors forfait
  ajouterFrais() {
    this.fraisHorsForfait.push({ libelle: '', justificatif: '', montant: null });
  }

  // Supprimer une ligne de frais hors forfait
  supprimerFrais(index: number) {
    this.fraisHorsForfait.splice(index, 1);
  }

  // Soumettre la fiche de frais hors forfait
  onSubmit() {
    if (this.isFicheFraisSubmitted) {
      this.errorMessage = 'La fiche de frais a déjà été soumise.';
      return;
    }

    const userId = this.authService.getUserId();
    if (!userId) {
      this.errorMessage = "Impossible de récupérer l'ID utilisateur. Veuillez vous reconnecter.";
      return;
    }

    const mois = this.dateFrais.slice(0, 7).replace('-', '');
    const montantValide = this.fraisHorsForfait.reduce((sum, frais) => sum + (frais.montant || 0), 0);

    if (montantValide === 0) {
      this.errorMessage = 'Le montant total ne peut pas être nul.';
      return;
    }

    // Création de la fiche de frais
    const ficheFrais = {
      date_modif: new Date().toISOString().slice(0, 10),
      mois,
      montant_valide: montantValide,
      nb_justificatifs: this.fraisHorsForfait.length,
      user: { id: userId },
      etat: { id: 1 }
    };

    this.isFicheFraisSubmitted = true;

    this.ficheFraisService.createFicheFrais(ficheFrais).subscribe(
      (ficheFraisResponse) => this.addHorsForfaitExpensesToFiche(ficheFraisResponse.id),
      () => {
        this.isFicheFraisSubmitted = false;
        this.errorMessage = 'Erreur lors de la soumission de la fiche de frais. Veuillez réessayer.';
      }
    );
  }

  // Ajouter les frais hors forfait à la fiche de frais
  addHorsForfaitExpensesToFiche(ficheFraisId: number): void {
    let errorOccurred = false;
    const requests = this.fraisHorsForfait
      .filter(frais => frais.montant != null && frais.montant > 0)
      .map(frais => 
        this.ficheFraisService.createLigneFraisHorsForfait(ficheFraisId, this.dateFrais, frais.libelle, frais.montant!)
          .toPromise()
          .catch(() => errorOccurred = true)
      );

    Promise.all(requests)
      .then(() => {
        if (!errorOccurred) {
          this.successMessage = 'Fiche de frais hors forfait soumise avec succès!';
        } else {
          this.errorMessage = 'Erreur lors de l\'ajout des frais hors forfait.';
        }
      });
  }

  // Réinitialiser le formulaire
  onReset() {
    this.dateFrais = new Date().toISOString().split('T')[0];
    this.fraisHorsForfait = [{ libelle: '', justificatif: '', montant: null }];
    this.errorMessage = '';
    this.successMessage = '';
    this.isFicheFraisSubmitted = false;
  }
}
