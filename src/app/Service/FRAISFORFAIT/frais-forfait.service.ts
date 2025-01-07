import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';
import { FraisForfait } from '../models/fraisforfais.model';

@Injectable({
  providedIn: 'root'
})
export class FraisForfaitService {

  private apiUrl = `${environment.apiUrl}/api/fraisforfaits`;

  constructor(private http: HttpClient) { }

  // Ajouter un frais forfaitisé
  addFraisForfait(fraisForfait: FraisForfait): Observable<FraisForfait> {
    return this.http.post<FraisForfait>(this.apiUrl, fraisForfait);
  }

  // Récupérer tous les frais forfaitisés
  getAllFraisForfaits(): Observable<FraisForfait[]> {
    return this.http.get<FraisForfait[]>(this.apiUrl);
  }

  // Récupérer un frais forfaitisé par ID
  getFraisForfaitById(id: number): Observable<FraisForfait> {
    return this.http.get<FraisForfait>(`${this.apiUrl}/${id}`);
  }

  // Mettre à jour un frais forfaitisé
  updateFraisForfait(id: number, fraisForfait: FraisForfait): Observable<FraisForfait> {
    return this.http.put<FraisForfait>(`${this.apiUrl}/${id}`, fraisForfait);
  }

  // Supprimer un frais forfaitisé
  deleteFraisForfait(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
