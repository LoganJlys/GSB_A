import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common'; // Nécessaire pour *ngIf et autres directives Angular
import { FormsModule } from '@angular/forms'; // Nécessaire pour [(ngModel)]

@Component({
  selector: 'app-login',
  standalone: true, // Standalone component
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  imports: [CommonModule, FormsModule] // Tu dois importer FormsModule et CommonModule ici
})
export class LoginComponent {
  email: string = '';
  password: string = '';
  errorMessage: string = '';

  constructor(private router: Router) {}

  login() {
    if (this.email === 'comptable@gmail.com' && this.password === '123') {
      this.router.navigate(['/home-comptable']);
    } else if (this.email === 'medecin@gmail.com' && this.password === '123') {
      this.router.navigate(['/home-medecin']);
    } else {
      this.errorMessage = 'Identifiants incorrects. Veuillez réessayer.';
    }
  }
}
