import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';  // Chemin relatif correct pour environment.ts
import { Etat } from '../models/etat.model';

@Injectable({
  providedIn: 'root'
})
export class EtatService {

  private apiUrl = `${environment.apiUrl}/api/etats`;

  constructor(private http: HttpClient) { }

  // Ajouter un état
  addEtat(etat: Etat): Observable<Etat> {
    return this.http.post<Etat>(this.apiUrl, etat);
  }

  // Récupérer tous les états
  getAllEtats(): Observable<Etat[]> {
    return this.http.get<Etat[]>(this.apiUrl);
  }

  // Récupérer un état par ID
  getEtatById(id: number): Observable<Etat> {
    return this.http.get<Etat>(`${this.apiUrl}/${id}`);
  }

  // Mettre à jour un état
  updateEtat(id: number, etat: Etat): Observable<Etat> {
    return this.http.put<Etat>(`${this.apiUrl}/${id}`, etat);
  }

  // Supprimer un état
  deleteEtat(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
