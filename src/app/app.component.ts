import { Component, OnInit } from '@angular/core'; 
// Le décorateur `Component` est utilisé pour déclarer un composant dans Angular.
// OnInit est une interface qui permet d'implémenter la méthode `ngOnInit()`, appelée lorsque le composant est initialisé.
import { Router, RouterModule } from '@angular/router';  
// Le `Router` et `RouterModule` sont importés pour gérer la navigation entre différentes routes de l'application.
import { NavbarComponent } from './Component/navbar/navbar.component';  
// Importation du composant de la barre de navigation (navbar) pour l'utiliser dans le template.
import { AuthService } from './Service/auth.service';  
// Importation du service d'authentification pour gérer l'état de connexion de l'utilisateur.
import { CommonModule } from '@angular/common';  
// Importation de `CommonModule`, nécessaire pour utiliser des directives comme `*ngIf` dans ce composant standalone.

@Component({
  selector: 'app-root', 
  // Le sélecteur `app-root` est le nom utilisé dans le template HTML pour insérer ce composant.
  standalone: true,  
  // Le composant est autonome (standalone), ce qui signifie qu'il ne dépend pas d'un module spécifique.
  imports: [RouterModule, NavbarComponent, CommonModule],  
  // Importation des modules nécessaires : `RouterModule` pour la gestion des routes, `NavbarComponent` pour afficher la barre de navigation et `CommonModule` pour utiliser des directives Angular comme `*ngIf`.
  templateUrl: './app.component.html', 
  // Spécifie le fichier HTML à utiliser pour le template du composant.
  styleUrls: ['./app.component.css']  
  // Spécifie le fichier CSS contenant les styles associés à ce composant.
})
export class AppComponent implements OnInit {
  isAuthenticated: boolean = false;  
  // Déclare une propriété `isAuthenticated` qui indique si l'utilisateur est authentifié ou non. Initialisée à `false`.
  
  isLoginPage: boolean = false;  
  // Déclare une propriété `isLoginPage` qui vérifie si la page actuelle est la page de connexion. Initialisée à `false`.

  constructor(private authService: AuthService, private router: Router) {}  
  // Le constructeur injecte deux services : 
  // - `authService` pour gérer l'authentification.
  // - `router` pour accéder aux événements de routage et effectuer des redirections si nécessaire.

  ngOnInit(): void {
    // `ngOnInit` est une méthode du cycle de vie du composant qui est appelée lorsque le composant est initialisé.
    
    // Observer l'état d'authentification de l'utilisateur à partir du service `authService`.
    this.authService.isAuthenticated.subscribe(isAuth => {
      this.isAuthenticated = isAuth;  
      // Met à jour `isAuthenticated` en fonction de la valeur renvoyée par le service (si l'utilisateur est connecté ou non).
    });

    // Observer les événements de routage pour vérifier si nous sommes sur la page de connexion.
    this.router.events.subscribe(() => {
      // Vérifie si l'URL actuelle est "/login" et met à jour `isLoginPage` en conséquence.
      this.isLoginPage = this.router.url === '/login';
    });
  }
}
