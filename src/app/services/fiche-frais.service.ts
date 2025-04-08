import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class FicheFraisService {
  private apiBaseUrl = 'http://localhost:8080/api';

  constructor(private http: HttpClient) {}

  // Création d'une fiche de frais
  createFicheFrais(ficheFrais: any): Observable<any> {
    return this.http.post<any>(`${this.apiBaseUrl}/ficheFrais/creer`, ficheFrais);
  }

  // Ajout d'un frais forfaitaire
  createFraisForfait(ficheFraisId: number, libelle: string, total: number): Observable<any> {
    return this.http.post<any>(`${this.apiBaseUrl}/fraisforfait`, {
      libelle,
      montant: total,
      ficheFrais: { id: ficheFraisId },
    });
  }

  // Création d'une ligne de frais forfaitaire
  createLigneFraisForfait(fraisForfaitId: number, date: string, quantite: number): Observable<any> {
    return this.http.post<any>(`${this.apiBaseUrl}/ligneFraisForfait`, {
      fraisForfait: { id: fraisForfaitId },
      date,
      quantite,
    });
  }

  // Création d'un frais hors forfait
  createLigneFraisHorsForfait(ficheFraisId: number, date: string, libelle: string, montant: number): Observable<any> {
    return this.http.post<any>(`${this.apiBaseUrl}/ligne-frais-hors-forfait`, {
      ficheFrais: { id: ficheFraisId },
      date,
      libelle,
      montant,
    });
  }
}
