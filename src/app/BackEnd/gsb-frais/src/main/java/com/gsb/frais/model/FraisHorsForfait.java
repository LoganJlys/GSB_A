package com.gsb.frais.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import java.util.Objects;

@Entity
public class FraisHorsForfait {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Identifiant unique pour chaque frais hors forfait

    @Column(nullable = false, length = 100)
    private String libelle; // Libellé du frais hors forfait (ex: transport, repas, hébergement)

    @Column(nullable = false)
    private double montant; // Montant du frais hors forfait

    @Column(nullable = false)
    private String date; // Date à laquelle le frais hors forfait a été effectué

    // Constructeurs
    public FraisHorsForfait() {
        // Constructeur par défaut
    }

    public FraisHorsForfait(String libelle, double montant, String date) {
        this.libelle = libelle;
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

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    // hashCode et equals pour comparer les objets correctement
    @Override
    public int hashCode() {
        return Objects.hash(id, libelle, montant, date);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FraisHorsForfait that = (FraisHorsForfait) o;
        return Double.compare(that.montant, montant) == 0 &&
                Objects.equals(id, that.id) &&
                Objects.equals(libelle, that.libelle) &&
                Objects.equals(date, that.date);
    }

    // toString pour un affichage lisible
    @Override
    public String toString() {
        return "FraisHorsForfait{" +
                "id=" + id +
                ", libelle='" + libelle + '\'' +
                ", montant=" + montant +
                ", date='" + date + '\'' +
                '}';
    }
}
