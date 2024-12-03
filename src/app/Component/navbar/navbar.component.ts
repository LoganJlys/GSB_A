import { Component } from '@angular/core'; 
// Le décorateur `Component` permet de définir ce fichier comme un composant Angular. Il est utilisé pour configurer le composant, y compris son template et son style.
import { Router } from '@angular/router'; 
// Le service `Router` est utilisé pour naviguer entre les différentes pages (ou routes) de l'application.
import { RouterModule } from '@angular/router';  
// Importation de `RouterModule`, nécessaire pour utiliser des liens de routage dans un composant standalone.

@Component({
  selector: 'app-navbar', 
  // Le sélecteur est le nom du composant qui peut être utilisé pour l'intégrer dans d'autres parties de l'application.
  standalone: true, 
  // Définit ce composant comme "standalone", ce qui signifie qu'il peut être utilisé indépendamment d'un module Angular spécifique.
  imports: [RouterModule], 
  // Le module `RouterModule` est importé ici pour permettre l'utilisation de `routerLink` et d'autres fonctionnalités liées au routage.
  templateUrl: './navbar.component.html', 
  // Spécifie le fichier HTML qui contient le template de ce composant.
  styleUrls: ['./navbar.component.css'] 
  // Spécifie le fichier CSS contenant les styles associés à ce composant.
})
export class NavbarComponent {
  activeTab: string = ''; 
  // La propriété `activeTab` est utilisée pour suivre l'onglet actif dans la barre de navigation. Elle est initialisée avec une chaîne vide.

  constructor(private router: Router) {
    // Le service `Router` est injecté dans le constructeur pour permettre la navigation programmatique et la gestion des événements de routage.
    
    this.router.events.subscribe(() => {
      // S'abonner aux événements du routeur pour mettre à jour l'onglet actif chaque fois que la route change.
      this.activeTab = this.getActiveTab();
      // Appelle la méthode `getActiveTab` pour définir l'onglet actif en fonction de l'URL actuelle.
    });
  }

  setActiveTab(tab: string): void {
    // Cette méthode permet de définir l'onglet actif manuellement en fonction du paramètre `tab`.
    this.activeTab = tab;
  }

  getActiveTab(): string {
    // Cette méthode détermine quel onglet doit être actif en fonction de l'URL actuelle de la route.
    const currentUrl = this.router.url;
    // Récupère l'URL actuelle de l'application.

    // En fonction de l'URL, retourne un identifiant d'onglet spécifique pour appliquer une classe active.
    if (currentUrl.includes('forfait')) {
      return 'forfait';
    } else if (currentUrl.includes('hors-forfait')) {
      return 'hors-forfait';
    } else if (currentUrl.includes('consultation')) {
      return 'consultation';
    } else if (currentUrl.includes('login')) {
      return 'deconnexion';
    } else {
      return 'saisie'; // Valeur par défaut si aucune correspondance n'est trouvée.
    }
  }
}
