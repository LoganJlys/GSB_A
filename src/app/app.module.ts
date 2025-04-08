import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

// Composants
import { HomeComponent } from './components/home/home.component';
import { ConsultationComponent } from './components/consultation/consultation.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { FicheFraisComponent } from './components/saisie/fiche-frais/fiche-frais.component';
import { HorsForfaitComponent } from './components/saisie/hors-forfait/hors-forfait.component';
import { LoginComponent } from './components/login/login.component';

// Services
import { AuthService } from './services/auth.service';
import { ConsultationService } from './services/consultation.service';
import { FicheFraisService } from './services/fiche-frais.service';
import { HorsForfaitService } from './services/hors-forfait.service';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ConsultationComponent,
    NavbarComponent,
    FicheFraisComponent,
    HorsForfaitComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    CommonModule,
    FormsModule,
    HttpClientModule,
    RouterModule
  ],
  providers: [
    AuthService,
    ConsultationService,
    FicheFraisService,
    HorsForfaitService,
    provideClientHydration()
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
