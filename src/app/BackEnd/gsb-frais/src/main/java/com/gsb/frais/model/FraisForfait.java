package com.gsb.frais.model;

import javax.persistence.Entity;
import java.util.Objects;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class FraisForfait {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idFraisForfait;  // Identifiant unique du frais forfait

    private String libelle;  // Libellé du frais forfait (ex. : "Nuitée", "Repas")
    private double montant;   // Montant associé au frais forfait

    // Constructeurs
    public FraisForfait() {
    }

    public FraisForfait(String libelle, double montant) {
        this.libelle = libelle;
        this.montant = montant;
    }

    // Getters et Setters
    public Long getIdFraisForfait() {
        return idFraisForfait;
    }

    public void setIdFraisForfait(Long idFraisForfait) {
        this.idFraisForfait = idFraisForfait;
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

    // Méthode toString() pour faciliter l'affichage
    @Override
    public String toString() {
        return "FraisForfait{" +
                "idFraisForfait=" + idFraisForfait +
                ", libelle='" + libelle + '\'' +
                ", montant=" + montant +
                '}';
    }
    
    // Méthode equals() et hashCode() pour comparer les objets
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FraisForfait that = (FraisForfait) o;
        return Double.compare(that.montant, montant) == 0 && idFraisForfait.equals(that.idFraisForfait) && libelle.equals(that.libelle);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idFraisForfait, libelle, montant);
    }
}
