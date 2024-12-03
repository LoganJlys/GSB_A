package com.gsb.frais.repository;

import com.gsb.frais.model.Frais;
import com.gsb.frais.model.Visiteur;
import com.gsb.frais.model.FicheFrais;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface FraisRepository extends JpaRepository<Frais, String> {

    // Recherche des frais par description contenant un mot clé
    List<Frais> findByDescriptionContainingIgnoreCase(String description);

    // Recherche des frais dont le montant est supérieur à une certaine valeur
    List<Frais> findByMontantGreaterThan(double montant);

    // Recherche des frais par date
    List<Frais> findByDateBetween(LocalDate startDate, LocalDate endDate);

    // Recherche des frais par un montant spécifique
    Optional<Frais> findByMontant(double montant);

    // Recherche des frais par une description exacte
    Optional<Frais> findByDescription(String description);

    // Recherche des frais associés à un visiteur spécifique
    List<Frais> findByVisiteur(Visiteur visiteur);

    // Recherche des frais associés à une fiche de frais spécifique
    List<Frais> findByFicheFrais(FicheFrais ficheFrais);

    // Recherche des frais associés à un visiteur et dans une période spécifique
    List<Frais> findByVisiteurAndDateBetween(Visiteur visiteur, LocalDate startDate, LocalDate endDate);

    // Recherche des frais associés à une fiche de frais et avec un montant spécifique
    List<Frais> findByFicheFraisAndMontant(FicheFrais ficheFrais, double montant);

    // Recherche des frais d'un visiteur et dont le montant est supérieur à une valeur donnée
    List<Frais> findByVisiteurAndMontantGreaterThan(Visiteur visiteur, double montant);
}
