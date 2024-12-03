package com.gsb.frais.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class FicheFrais {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate dateModif;  // Changer de String à LocalDate

    @Column(nullable = false)
    private int idVisiteur;

    @Column(nullable = false)
    private int mois;

    @Column(nullable = false)
    private double montantValide;

    @Column(nullable = false)
    private int nbJustificatifs;

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDateModif() {  // Changer le type du getter pour correspondre à LocalDate
        return dateModif;
    }

    public void setDateModif(LocalDate dateModif) {  // Changer le type du setter
        this.dateModif = dateModif;
    }

    public int getIdVisiteur() {
        return idVisiteur;
    }

    public void setIdVisiteur(int idVisiteur) {
        this.idVisiteur = idVisiteur;
    }

    public int getMois() {
        return mois;
    }

    public void setMois(int mois) {
        this.mois = mois;
    }

    public double getMontantValide() {
        return montantValide;
    }

    public void setMontantValide(double montantValide) {
        this.montantValide = montantValide;
    }

    public int getNbJustificatifs() {
        return nbJustificatifs;
    }

    public void setNbJustificatifs(int nbJustificatifs) {
        this.nbJustificatifs = nbJustificatifs;
    }
}
