import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Comptable } from '../models/comptable.model'
import { environment } from '../environments/environment';  // Chemin relatif correct pour environment.ts

@Injectable({
  providedIn: 'root'
})
export class ComptableService {

  private apiUrl = `${environment.apiUrl}/comptables`;  // URL de l'API, récupérée du fichier environment.ts

  constructor(private http: HttpClient) {}

  // Exemple de méthode pour obtenir tous les comptables
  getAllComptables(): Observable<Comptable[]> {
    return this.http.get<Comptable[]>(this.apiUrl);
  }

  // Exemple de méthode pour créer un comptable
  createComptable(comptable: Comptable): Observable<Comptable> {
    return this.http.post<Comptable>(this.apiUrl, comptable);
  }

  // Exemple de méthode pour supprimer un comptable
  deleteComptable(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
