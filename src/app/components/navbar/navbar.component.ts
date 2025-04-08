import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service'; // Assure-toi que le chemin est correct

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  activeTab: string = '';
  isLoggedIn: boolean = false; // Cette variable contrôle l'affichage de la navbar

  constructor(private router: Router, private authService: AuthService) {}

  ngOnInit() {
    // S'abonner au service d'authentification pour suivre l'état de la connexion
    this.authService.currentUser.subscribe(user => {
      this.isLoggedIn = !!user; // Si l'utilisateur est défini, il est connecté
    });
    
    // Mettre à jour l'onglet actif à chaque changement de route
    this.router.events.subscribe(() => {
      this.activeTab = this.getActiveTab();
    });
  }

  setActiveTab(tab: string): void {
    this.activeTab = tab;
  }

  getActiveTab(): string {
    const currentUrl = this.router.url;
    if (currentUrl.includes('forfait')) {
      return 'forfait';
    } else if (currentUrl.includes('hors-forfait')) {
      return 'hors-forfait';
    } else if (currentUrl.includes('consultation')) {
      return 'consultation';
    } else if (currentUrl.includes('login')) {
      return 'deconnexion';
    } else {
      return 'saisie';
    }
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']); // Rediriger vers la page de login après la déconnexion
  }
}
