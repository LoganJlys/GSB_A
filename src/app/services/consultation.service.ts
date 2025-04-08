import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class ConsultationService {
  private baseUrl = 'http://localhost:8080/api/ficheFrais';

  constructor(private http: HttpClient) {}

  // Récupérer toutes les fiches de frais de l'utilisateur connecté
  getFichesFraisParUtilisateur(userId: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/historique/${userId}`)
      .pipe(catchError(this.handleError));
  }

  // Récupérer les fiches de frais pour un mois spécifique (format: YYYYMM)
  getFraisPourMois(userId: number, moisFormat: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/historique/${userId}/${moisFormat}`)
      .pipe(catchError(this.handleError));
  }
  // Gestion des erreurs HTTP
  private handleError(error: any) {
    console.error("Erreur API :", error);
    return throwError(() => new Error("Erreur lors de la récupération des données."));
  }
}
