
export interface LigneFraisForfait {
    id: number;
    quantite: number;
    fraisForfaitId: number;  // Cela peut correspondre à un frais forfait spécifique dans votre application
    ficheFraisId: number;   // Lien vers la fiche de frais
  }