package com.gsb.frais.repository;

import com.gsb.frais.model.FicheFrais;
import com.gsb.frais.model.Visiteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface FicheFraisRepository extends JpaRepository<FicheFrais, Long> {

    // Recherche une fiche de frais par son identifiant
    Optional<FicheFrais> findById(Long id);  // Changer de String à Long

    // Recherche une fiche de frais par son visiteur
    List<FicheFrais> findByVisiteur(Visiteur visiteur);

    // Recherche des fiches de frais dans une plage de dates
    List<FicheFrais> findByDateCreationBetween(LocalDate startDate, LocalDate endDate);

    // Recherche des fiches de frais d'un visiteur et dans une période donnée
    List<FicheFrais> findByVisiteurAndDateCreationBetween(Visiteur visiteur, LocalDate startDate, LocalDate endDate);
}
