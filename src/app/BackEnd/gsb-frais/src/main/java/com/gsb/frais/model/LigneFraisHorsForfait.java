package com.gsb.frais.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.Column;
import java.util.Objects;


@Entity
public class LigneFraisHorsForfait {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // Identifiant de la ligne

    @ManyToOne
    @JoinColumn(name = "id_visiteur", nullable = false)
    private Visiteur visiteur; // Lien vers l'entité Visiteur

    @ManyToOne
    @JoinColumn(name = "id_frais_hors_forfait", nullable = false)
    private FraisHorsForfait fraisHorsForfait; // Lien vers l'entité FraisHorsForfait

    @Column(nullable = false)
    private String date; // Date du frais hors forfait

    @Column(nullable = false)
    private double montant; // Montant du frais hors forfait

    @Column(nullable = true)
    private String libelle; // Libelle descriptif du frais hors forfait

    // Constructeurs
    public LigneFraisHorsForfait() {
    }

    public LigneFraisHorsForfait(Visiteur visiteur, FraisHorsForfait fraisHorsForfait, String date, double montant, String libelle) {
        this.visiteur = visiteur;
        this.fraisHorsForfait = fraisHorsForfait;
        this.date = date;
        this.montant = montant;
        this.libelle = libelle;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Visiteur getVisiteur() {
        return visiteur;
    }

    public void setVisiteur(Visiteur visiteur) {
        this.visiteur = visiteur;
    }

    public FraisHorsForfait getFraisHorsForfait() {
        return fraisHorsForfait;
    }

    public void setFraisHorsForfait(FraisHorsForfait fraisHorsForfait) {
        this.fraisHorsForfait = fraisHorsForfait;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    // hashCode et equals
    @Override
    public int hashCode() {
        return Objects.hash(id, visiteur, fraisHorsForfait, date, montant, libelle);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LigneFraisHorsForfait that = (LigneFraisHorsForfait) o;
        return Double.compare(that.montant, montant) == 0 &&
                Objects.equals(id, that.id) &&
                Objects.equals(visiteur, that.visiteur) &&
                Objects.equals(fraisHorsForfait, that.fraisHorsForfait) &&
                Objects.equals(date, that.date) &&
                Objects.equals(libelle, that.libelle);
    }

    @Override
    public String toString() {
        return "LigneFraisHorsForfait{" +
                "id=" + id +
                ", visiteur=" + visiteur +
                ", fraisHorsForfait=" + fraisHorsForfait +
                ", date='" + date + '\'' +
                ", montant=" + montant +
                ", libelle='" + libelle + '\'' +
                '}';
    }
}
