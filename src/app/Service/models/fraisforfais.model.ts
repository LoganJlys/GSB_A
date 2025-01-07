// src/app/models/fraisforfait.model.ts

export interface FraisForfait {
    id: number;               // Identifiant unique du frais forfait
    code: string;             // Code pour identifier le type de frais (ex: 'REP' pour repas, 'KM' pour kilométrage, etc.)
    montant: number;          // Montant du frais forfait pour ce type spécifique
    libelle: string;          // Libellé ou description du frais forfait
  }
  