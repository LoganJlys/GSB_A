import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  login: string = '';  // Identifiant (login)
  motDePasse: string = '';  // Mot de passe
  role: string = 'visiteur';  // Valeur par défaut du rôle
  errorMessage: string = '';  // Message d'erreur pour l'interface utilisateur

  constructor(private authService: AuthService, private router: Router) {}

  // Méthode appelée lors de la soumission du formulaire de connexion
  onSubmit(): void {
    // Vérification des champs avant l'envoi
    if (!this.login || !this.motDePasse || !this.role) {
      this.errorMessage = "Tous les champs sont obligatoires.";  // Message si un champ est vide
      return;
    }

    // Appel du service AuthService pour authentifier l'utilisateur
    this.authService.login(this.login, this.motDePasse, this.role).subscribe({
      next: (user) => {
        if (user && user.role === this.role) {
          // Sauvegarde de l'utilisateur dans localStorage
          localStorage.setItem('currentUser', JSON.stringify(user));
          localStorage.setItem('userId', user.id.toString());

          // Redirection vers le tableau de bord approprié en fonction du rôle
          if (user.role === 'visiteur') {
            this.router.navigate(['/visiteur-dashboard']);  // Redirection vers le tableau de bord du visiteur
          } else if (user.role === 'comptable') {
            this.router.navigate(['/comptable-dashboard']);  // Redirection vers le tableau de bord du comptable
          } else {
            this.router.navigate(['/']);  // Redirection vers la page d'accueil par défaut
          }
        } else {
          this.errorMessage = "Rôle incorrect. Vérifiez votre sélection.";
        }
      },
      error: (err) => {
        console.error('Erreur lors de la connexion:', err);
        if (err.status === 400) {
          // Affichage du message d'erreur retourné par l'API
          this.errorMessage = err.error.error || 'Identifiants incorrects.';
        } else {
          this.errorMessage = "Erreur de connexion. Veuillez réessayer.";
        }
      }
    });
  }
}
