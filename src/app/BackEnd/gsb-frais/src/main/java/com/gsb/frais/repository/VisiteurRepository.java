package com.gsb.frais.repository;

import com.gsb.frais.model.Visiteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface VisiteurRepository extends JpaRepository<Visiteur, String> {

    // Recherche un visiteur par son identifiant
    Optional<Visiteur> findById(Long id);

    // Recherche un visiteur par son nom
    Optional<Visiteur> findByNom(String nom);
}
