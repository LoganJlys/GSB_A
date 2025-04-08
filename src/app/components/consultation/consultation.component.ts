import { Component, OnInit } from '@angular/core';
import { ConsultationService } from '../../services/consultation.service';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';

interface LigneFrais {
  libelle: string;
  total: number;
}

interface FicheFrais {
  mois: string;
  etat: string;  // Assurez-vous que l'état est bien un attribut de la fiche
  lignesFrais: LigneFrais[];
  date_modif: string;  // Date de modification
}

@Component({
  selector: 'app-consultation',
  providers: [ConsultationService],
  templateUrl: './consultation.component.html',
  styleUrls: ['./consultation.component.css'],
})
export class ConsultationComponent implements OnInit {
  moisDisponibles: { valeur: number; label: string }[] = [];
  moisSelectionne!: number;
  userId: number = 1;
  fichesFrais: FicheFrais[] = [];
  erreurMessage: string = '';

  constructor(private consultationService: ConsultationService) {}

  ngOnInit(): void {
    this.initialiserMois();
  }

  private initialiserMois(): void {
    const dateActuelle = new Date();
    const nomsMois = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];

    for (let i = 0; i < 12; i++) {
      let date = new Date(dateActuelle.getFullYear(), dateActuelle.getMonth() - i, 1);
      let annee = date.getFullYear();
      let mois = date.getMonth();
      let moisFormat = `${annee}${(mois + 1).toString().padStart(2, '0')}`;
      let moisLibelle = `${nomsMois[mois]} ${annee}`;
      this.moisDisponibles.push({ valeur: parseInt(moisFormat, 10), label: moisLibelle });
    }
  }

  consulterFicheDeFrais(): void {
    if (!this.moisSelectionne) {
      this.erreurMessage = "Veuillez sélectionner un mois.";
      return;
    }

    this.consultationService.getFraisPourMois(this.userId, this.moisSelectionne)
      .pipe(
        catchError((error) => {
          this.erreurMessage = "Erreur lors de la récupération des données.";
          console.error(error);
          return throwError(() => new Error("Erreur API"));
        })
      )
      .subscribe((fichesFrais: any[]) => {
        console.log("🔍 Réponse API :", fichesFrais);
        if (fichesFrais.length) {
          this.fichesFrais = fichesFrais.map((fiche: any) => {
            const fraisForfait = fiche.frais_forfaits?.map((f: any) => ({
              libelle: f.libelle,
              total: f.montant || 0
            })) || [];

            const fraisHorsForfait = fiche.lignes_frais_hors_forfaits?.map((hf: any) => ({
              libelle: hf.libelle,
              total: hf.montant || 0
            })) || [];

            return {
              mois: fiche.mois,
              etat: fiche.etat?.libelle || 'Inconnu',
              lignesFrais: [...fraisForfait, ...fraisHorsForfait],
              date_modif: fiche.date_modif // Récupération de la date de modification
            };
          });
          this.erreurMessage = "";
        } else {
          this.fichesFrais = [];
          this.erreurMessage = "Aucune fiche de frais trouvée pour ce mois.";
        }
      });
  }

  modifierFiche(index: number, ligne: any): void {
    console.log('Modifier la fiche à l\'index:', index, 'ligne:', ligne);
    // Code pour modifier la ligne de frais (mettre à jour via API)
  }

  supprimerFiche(index: number, ligne: any): void {
    const confirmation = confirm('Êtes-vous sûr de vouloir supprimer cette fiche ?');
    if (confirmation) {
      // Code pour supprimer la fiche via API
      this.fichesFrais.splice(index, 1);  // Suppression temporaire de la fiche du tableau
    }
  }
}
