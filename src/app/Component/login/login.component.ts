import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms'; // Import pour ngModel
import { CommonModule } from '@angular/common'; // Import nécessaire pour les directives comme *ngIf
import { Router } from '@angular/router'; // Import manquant pour Router
import { AuthService } from '../../Service/AUTH/auth.service'; // Import du service Authentification

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],  // Importation de tous les modules nécessaires
  templateUrl: './Login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  email: string = '';  // Variable pour stocker l'email
  password: string = '';  // Variable pour stocker le mot de passe
  errorMessage: string = '';  // Déclaration de la propriété errorMessage

  constructor(private authService: AuthService, private router: Router) {}

  // Méthode de connexion
  login() {
    this.authService.login(this.email, this.password).subscribe({
      next: () => {
        this.router.navigate(['/home-comptable']);  // Redirection après une connexion réussie
      },
      error: (err) => {
        this.errorMessage = 'Erreur de connexion : ' + err.message;  // Affecte le message d'erreur
        console.error('Erreur de connexion :', err);
      }
    });
  }
}
