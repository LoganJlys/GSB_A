// Importation des modules nécessaires
import { Component } from '@angular/core'; // Le décorateur Component est utilisé pour définir le composant.
import { Router } from '@angular/router'; // Importation du module Router pour la navigation entre les pages dans l'application.

@Component({
  selector: 'app-home', // Le sélecteur utilisé pour insérer ce composant dans un autre fichier HTML.
  templateUrl: './home.component.html', // Le fichier template (HTML) associé à ce composant.
  styleUrls: ['./home.component.css'] // Le fichier de styles (CSS) pour ce composant.
})
export class HomeComponent {
  // Constructeur pour injecter le service Router dans le composant
  constructor(private router: Router) {}

  // Méthode pour rediriger l'utilisateur vers la page de connexion
  goToLogin(): void {
    this.router.navigate(['/login']); // Utilisation du service Router pour naviguer vers la route '/login'
  }
}
