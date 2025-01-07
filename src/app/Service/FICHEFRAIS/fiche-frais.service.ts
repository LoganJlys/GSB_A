import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { FicheFrais } from '../models/fichefrais.model';  


@Injectable({
  providedIn: 'root'
})
export class FicheFraisService {

  private baseUrl = 'http://localhost:8080/api/fichefrais';  // URL de votre API

  constructor(private http: HttpClient) { }

  // Récupérer toutes les fiches de frais
  getAllFichesFrais(): Observable<FicheFrais[]> {
    return this.http.get<FicheFrais[]>(`${this.baseUrl}`);
  }

  // Ajouter une nouvelle fiche de frais
  createFicheFrais(ficheFrais: FicheFrais): Observable<FicheFrais> {
    return this.http.post<FicheFrais>(`${this.baseUrl}`, ficheFrais);
  }

  // Mettre à jour une fiche de frais
  updateFicheFrais(id: number, ficheFrais: FicheFrais): Observable<FicheFrais> {
    return this.http.put<FicheFrais>(`${this.baseUrl}/${id}`, ficheFrais);
  }

  // Supprimer une fiche de frais
  deleteFicheFrais(id: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }
}
