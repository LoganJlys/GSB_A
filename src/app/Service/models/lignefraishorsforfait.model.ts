// src/app/models/lignefraishorsforfait.model.ts

export interface LigneFraisHorsForfait {
    id: number;
    date: string;  // Date sous forme de chaîne au format 'yyyy-MM-dd'
    montant: number;
    libelle: string;  // Description du frais hors forfait
    ficheFraisId: number;  // Lien vers la fiche de frais
  }
  