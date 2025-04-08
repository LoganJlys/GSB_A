import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  role: string = "Visiteur"; // Default value

  constructor(private router: Router) {}

  ngOnInit(): void {
    this.updateUserRole(); // Check role when component is initialized
  }

  updateUserRole(): void {
    if (typeof window !== 'undefined') {  // Ensure we are on the client side
      const storedUser = localStorage.getItem('currentUser');
      if (storedUser) {
        try {
          const user = JSON.parse(storedUser);
          if (user && user.role) {
            this.role = user.role; // Update role if available
          }
        } catch (error) {
          console.error("Error parsing JSON:", error);
        }
      }
    }
  }

  goToLogin(): void {
    this.router.navigate(['/login']); // Navigate to login page
  }
}
