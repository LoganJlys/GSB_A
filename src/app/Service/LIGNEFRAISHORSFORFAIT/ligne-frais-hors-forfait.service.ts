import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';  // Chemin relatif correct pour environment.ts
import { LigneFraisHorsForfait } from '../models/lignefraishorsforfait.model';

@Injectable({
  providedIn: 'root'
})
export class LigneFraisHorsForfaitService {

  private apiUrl = `${environment.apiUrl}/api/lignefraishorsforfaits`;

  constructor(private http: HttpClient) { }

  // Ajouter une ligne de frais hors forfait
  addLigneFraisHorsForfait(ligneFraisHorsForfait: LigneFraisHorsForfait): Observable<LigneFraisHorsForfait> {
    return this.http.post<LigneFraisHorsForfait>(this.apiUrl, ligneFraisHorsForfait);
  }

  // Récupérer toutes les lignes de frais hors forfait
  getAllLigneFraisHorsForfaits(): Observable<LigneFraisHorsForfait[]> {
    return this.http.get<LigneFraisHorsForfait[]>(this.apiUrl);
  }

  // Récupérer une ligne de frais hors forfait par ID
  getLigneFraisHorsForfaitById(id: number): Observable<LigneFraisHorsForfait> {
    return this.http.get<LigneFraisHorsForfait>(`${this.apiUrl}/${id}`);
  }

  // Mettre à jour une ligne de frais hors forfait
  updateLigneFraisHorsForfait(id: number, ligneFraisHorsForfait: LigneFraisHorsForfait): Observable<LigneFraisHorsForfait> {
    return this.http.put<LigneFraisHorsForfait>(`${this.apiUrl}/${id}`, ligneFraisHorsForfait);
  }

  // Supprimer une ligne de frais hors forfait
  deleteLigneFraisHorsForfait(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
