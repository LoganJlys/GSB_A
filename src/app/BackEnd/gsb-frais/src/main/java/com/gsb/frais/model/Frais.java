package com.gsb.frais.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.LocalDate;

@Entity
public class Frais {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Identifiant unique du frais

    private String description; // Description du frais
    private double montant;     // Montant du frais
    private LocalDate date;     // Date à laquelle le frais a été engagé

    // Constructeurs
    public Frais() {
    }

    public Frais(String description, double montant, LocalDate date) {
        this.description = description;
        this.montant = montant;
        this.date = date;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    // Méthode toString() pour le débogage ou l'affichage
    @Override
    public String toString() {
        return "Frais{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", montant=" + montant +
                ", date=" + date +
                '}';
    }
}
