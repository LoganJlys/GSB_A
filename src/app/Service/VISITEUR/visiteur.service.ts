import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Visiteur } from '../models/visiteur.model';  // N'oubliez pas d'importer votre modèle

@Injectable({
  providedIn: 'root'
})
export class VisiteurService {

  private baseUrl = 'http://localhost:8080/api/visiteurs';  // URL de votre API

  constructor(private http: HttpClient) { }

  // Récupérer tous les visiteurs
  getAllVisiteurs(): Observable<Visiteur[]> {
    return this.http.get<Visiteur[]>(`${this.baseUrl}`);
  }

  // Ajouter un nouveau visiteur
  createVisiteur(visiteur: Visiteur): Observable<Visiteur> {
    return this.http.post<Visiteur>(`${this.baseUrl}`, visiteur);
  }

  // Mettre à jour un visiteur
  updateVisiteur(id: string, visiteur: Visiteur): Observable<Visiteur> {
    return this.http.put<Visiteur>(`${this.baseUrl}/${id}`, visiteur);
  }

  // Supprimer un visiteur
  deleteVisiteur(id: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }
}
