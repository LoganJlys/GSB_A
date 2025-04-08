import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class HorsForfaitService {
  private ficheFraisUrl = 'http://localhost:8080/api/ficheFrais/creer';  
  private ligneFraisHorsForfaitUrl = 'http://localhost:8080/api/ligne-frais-hors-forfait';  

  constructor(private http: HttpClient) {}

  // Méthode pour envoyer une fiche de frais
  createFicheFrais(ficheFrais: any): Observable<any> {
    return this.http.post<any>(this.ficheFraisUrl, ficheFrais);
  }

  // Méthode pour ajouter une ligne de frais hors forfait
  createLigneFraisHorsForfait(ficheFraisId: number, date: string, libelle: string, montant: number): Observable<any> {
    const ligneFraisHorsForfait = {
      ficheFrais: { id: ficheFraisId }, // Associe la ligne à une fiche de frais
      date: date,
      libelle: libelle,
      montant: montant
    };

    console.log('Requête POST pour la création de ligne de frais hors forfait:', ligneFraisHorsForfait); 

    return this.http.post<any>(this.ligneFraisHorsForfaitUrl, ligneFraisHorsForfait);
  }
}
