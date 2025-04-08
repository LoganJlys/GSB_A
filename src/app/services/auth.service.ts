import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private baseUrl = 'http://localhost:8080/api/users'; // URL du backend
  private currentUserSubject: BehaviorSubject<any>;
  public currentUser: Observable<any>;

  constructor(private http: HttpClient) {
    // Charger l'utilisateur depuis le localStorage uniquement côté client
    const storedUser = typeof window !== 'undefined' && localStorage.getItem('currentUser');
    const user = storedUser ? JSON.parse(storedUser) : null;

    if (user && !user.id) {
      console.warn("⚠️ L'utilisateur ne contient pas d'ID ! Vérifiez la réponse du backend.");
    }

    this.currentUserSubject = new BehaviorSubject<any>(user);
    this.currentUser = this.currentUserSubject.asObservable();
  }

  // Getter pour récupérer l'utilisateur courant
  public get currentUserValue(): any {
    return this.currentUserSubject.value;
  }

  // Connexion de l'utilisateur
  login(login: string, motDePasse: string, role: string): Observable<any> {
    const headers = new HttpHeaders({ 'Content-Type': 'application/json' });

    return this.http.post<any>(`${this.baseUrl}/login`, { login, motDePasse, role }, { headers })
      .pipe(
        tap(response => {
          if (response?.id && response.role) {
            console.log("✅ Utilisateur connecté avec succès :", response);
            if (typeof window !== 'undefined') {
              localStorage.setItem('currentUser', JSON.stringify(response)); // Sauvegarde dans le localStorage
            }
            this.currentUserSubject.next(response);
          } else {
            console.error("❌ La réponse du serveur ne contient pas d'ID ou de rôle !");
            this.logout();
          }
        })
      );
  }

  // Déconnexion de l'utilisateur
  logout(): void {
    console.log("👋 Déconnexion de l'utilisateur.");
    if (typeof window !== 'undefined') {
      localStorage.removeItem('currentUser'); // Retirer du localStorage
    }
    this.currentUserSubject.next(null);
  }

  // Vérifie si l'utilisateur est authentifié
  isAuthenticated(): boolean {
    return typeof window !== 'undefined' && localStorage.getItem('currentUser') !== null;
  }

  // Récupérer directement l'ID utilisateur
  public getUserId(): number | null {
    const user = this.currentUserValue;

    if (!user || !user.id) {
      console.error("❌ ID utilisateur manquant !");
      return null;
    }

    console.log("✅ ID utilisateur récupéré :", user.id);
    return user.id;
  }

  // Méthode pour récupérer les infos de l'utilisateur actuel
  getCurrentUser(): Observable<any> {
    const userId = this.getUserId();

    if (!userId) {
      console.error("❌ Impossible de récupérer les infos : ID utilisateur non défini.");
      return new Observable(observer => {
        observer.error("ID utilisateur non défini.");
        observer.complete();
      });
    }

    return this.http.get<any>(`${this.baseUrl}/${userId}`)
      .pipe(
        tap(user => console.log("ℹ️ Données utilisateur récupérées :", user))
      );
  }
}
