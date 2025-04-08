import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Importation des composants
import { LoginComponent } from './components/login/login.component';
import { HomeComponent } from './components/home/home.component';
import { HorsForfaitComponent } from './components/saisie/hors-forfait/hors-forfait.component';
import { FicheFraisComponent } from './components/saisie/fiche-frais/fiche-frais.component';
import { ConsultationComponent } from './components/consultation/consultation.component'; // Import ConsultationComponent

// Définition des routes
const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'comptable-dashboard', component: HomeComponent },  // Page comptable
  { path: 'visiteur-dashboard', component: HomeComponent },   // Page visiteur
  { path: 'forfait', component: FicheFraisComponent },
  { path: 'hors-forfait', component: HorsForfaitComponent },
  { path: 'consultation', component: ConsultationComponent },  // ✅ Ajout de la route pour la consultation
  { path: '', redirectTo: '/login', pathMatch: 'full' },  // Redirection vers /login par défaut
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],  
  exports: [RouterModule]  
})
export class AppRoutingModule {}
