package com.gsb.frais.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "comptable")
public class Comptable implements Serializable {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    @Column(name = "login")
    private String login;

    @Column(name = "mdp")
    private String mdp;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "cp")
    private String cp;

    @Column(name = "ville")
    private String ville;

    @Column(name = "dateembauche")
    private String dateembauche;

    // Constructeur par défaut
    public Comptable() {}

    // Constructeur avec tous les champs
    public Comptable(Long id, String nom, String prenom, String login, String mdp, 
                     String adresse, String cp, String ville, String dateembauche) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.login = login;
        this.mdp = mdp;
        this.adresse = adresse;
        this.cp = cp;
        this.ville = ville;
        this.dateembauche = dateembauche;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getDateembauche() {
        return dateembauche;
    }

    public void setDateembauche(String dateembauche) {
        this.dateembauche = dateembauche;
    }

    // Méthode toString (optionnelle mais utile pour le débogage)
    @Override
    public String toString() {
        return "Comptable{" +
                "id='" + id + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", login='" + login + '\'' +
                ", mdp='" + mdp + '\'' +
                ", adresse='" + adresse + '\'' +
                ", cp='" + cp + '\'' +
                ", ville='" + ville + '\'' +
                ", dateembauche='" + dateembauche + '\'' +
                '}';
    }

    // Equals et HashCode (optionnel mais recommandé pour les entités JPA)
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Comptable comptable = (Comptable) o;
        return id.equals(comptable.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
