import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../Service/AUTH/auth.service';

@Injectable({
  providedIn: 'root'
})
export class RoleGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(route: any): boolean {
    const requiredRole = route.data['role']; // Récupérer le rôle nécessaire à partir des données de la route
    const userRole = this.authService.getRole();

    if (this.authService.isLoggedIn() && userRole === requiredRole) {
      return true;
    } else {
      this.router.navigate(['/login']);
      return false;
    }
  }
}
