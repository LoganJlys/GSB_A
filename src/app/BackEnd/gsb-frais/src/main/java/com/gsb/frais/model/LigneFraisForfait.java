package com.gsb.frais.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import java.util.Objects;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;



@Entity
public class LigneFraisForfait {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_visiteur", nullable = false)
    private Visiteur visiteur; // Lien vers l'entité Visiteur

    @ManyToOne
    @JoinColumn(name = "id_frais_forfait", nullable = false)
    private FraisForfait fraisForfait; // Lien vers l'entité FraisForfait

    @Column(nullable = false)
    private int quantite; // Quantité de frais forfaitaire pour ce visiteur

    @Column(nullable = false)
    private String mois; // Mois de l'enregistrement du frais forfaitaire

    // Constructeurs
    public LigneFraisForfait() {
    }

    public LigneFraisForfait(Visiteur visiteur, FraisForfait fraisForfait, int quantite, String mois) {
        this.visiteur = visiteur;
        this.fraisForfait = fraisForfait;
        this.quantite = quantite;
        this.mois = mois;
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

    public FraisForfait getFraisForfait() {
        return fraisForfait;
    }

    public void setFraisForfait(FraisForfait fraisForfait) {
        this.fraisForfait = fraisForfait;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getMois() {
        return mois;
    }

    public void setMois(String mois) {
        this.mois = mois;
    }

    // hashCode et equals
    @Override
    public int hashCode() {
        return Objects.hash(id, visiteur, fraisForfait, quantite, mois);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LigneFraisForfait that = (LigneFraisForfait) o;
        return quantite == that.quantite && Objects.equals(id, that.id) && 
               Objects.equals(visiteur, that.visiteur) && 
               Objects.equals(fraisForfait, that.fraisForfait) && 
               Objects.equals(mois, that.mois);
    }

    @Override
    public String toString() {
        return "LigneFraisForfait{" +
                "id=" + id +
                ", visiteur=" + visiteur +
                ", fraisForfait=" + fraisForfait +
                ", quantite=" + quantite +
                ", mois='" + mois + '\'' +
                '}';
    }
}
