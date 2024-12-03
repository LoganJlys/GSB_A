import { Routes } from '@angular/router';
import { LoginComponent } from './Component/login/login.component';
import { HomeComponent } from './Component/home/home.component';
import { ForfaitComponent } from './Component/Saisie/forfait/forfait.component';
import { HorsForfaitComponentyComponent } from './Component/Saisie/hors-forfait/hors-forfait.component';
import { ConsultationComponent } from './Component/consultation/consultation.component';

export const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'home-comptable', component: HomeComponent },
  { path: 'home-medecin', component: HomeComponent },
  { path: 'forfait', component: ForfaitComponent },
  { path: 'hors-forfait', component: HorsForfaitComponentyComponent },
  { path: 'consultation', component: ConsultationComponent },
];
