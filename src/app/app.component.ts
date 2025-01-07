import { Component, OnInit } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // Pour ngModel
import { NavbarComponent } from './Component/navbar/navbar.component';
import { AuthService } from './Service/AUTH/auth.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterModule, NavbarComponent, CommonModule, FormsModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  isAuthenticated: boolean = false; // Indique si l'utilisateur est connecté
  isLoginPage: boolean = false; // Vérifie si l'utilisateur est sur la page de connexion

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit(): void {
    // Surveille l'état de l'authentification à partir du AuthService
    this.authService.isAuthenticated$.subscribe((status) => {
      this.isAuthenticated = status;
    });

    // Surveille les changements de route pour savoir si on est sur la page login
    this.router.events.subscribe(() => {
      this.isLoginPage = this.router.url === '/login';
    });
  }
}
