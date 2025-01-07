// src/app/models/horsforfait.model.ts

export interface HorsForfait {
    id?: number;          // Identifiant unique du frais hors forfait (optionnel si auto-généré)
    nom: string;          // Nom du visiteur
    prenom: string;       // Prénom du visiteur
    matricule: string;    // Matricule du visiteur
    dateDebut: string;    // Date de début du frais hors forfait
    dateFin: string;      // Date de fin du frais hors forfait
    libelle: string;      // Libellé du frais (ex: "Repas", "Transport", etc.)
    montant: number;      // Montant du frais hors forfait
  }
  