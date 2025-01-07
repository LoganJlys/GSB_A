import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';  // Chemin relatif correct pour environment.ts
import { LigneFraisForfait } from '../models/lignefraisforfait.model';

@Injectable({
  providedIn: 'root'
})
export class LigneFraisForfaitService {

  private apiUrl = `${environment.apiUrl}/api/lignefraisforfaits`;

  constructor(private http: HttpClient) { }

  // Ajouter une ligne de frais forfaitisé
  addLigneFraisForfait(ligneFraisForfait: LigneFraisForfait): Observable<LigneFraisForfait> {
    return this.http.post<LigneFraisForfait>(this.apiUrl, ligneFraisForfait);
  }

  // Récupérer toutes les lignes de frais forfaitisés
  getAllLigneFraisForfaits(): Observable<LigneFraisForfait[]> {
    return this.http.get<LigneFraisForfait[]>(this.apiUrl);
  }

  // Récupérer une ligne de frais forfaitisé par ID
  getLigneFraisForfaitById(id: number): Observable<LigneFraisForfait> {
    return this.http.get<LigneFraisForfait>(`${this.apiUrl}/${id}`);
  }

  // Mettre à jour une ligne de frais forfaitisé
  updateLigneFraisForfait(id: number, ligneFraisForfait: LigneFraisForfait): Observable<LigneFraisForfait> {
    return this.http.put<LigneFraisForfait>(`${this.apiUrl}/${id}`, ligneFraisForfait);
  }

  // Supprimer une ligne de frais forfaitisé
  deleteLigneFraisForfait(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
