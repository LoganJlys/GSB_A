import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private _isAuthenticated = new BehaviorSubject<boolean>(false); // Initialisation de l'état d'authentification

  constructor() {}

  // Getter pour observer l'état d'authentification
  get isAuthenticated() {
    return this._isAuthenticated.asObservable();
  }

  // Méthode pour se connecter (simuler l'authentification)
  login() {
    // Logique de connexion (ici simplement simulation)
    this._isAuthenticated.next(true); // L'utilisateur est maintenant authentifié
  }

  // Méthode pour se déconnecter
  logout() {
    // Logique de déconnexion (ici simplement simulation)
    this._isAuthenticated.next(false); // L'utilisateur est maintenant déconnecté
  }
}
