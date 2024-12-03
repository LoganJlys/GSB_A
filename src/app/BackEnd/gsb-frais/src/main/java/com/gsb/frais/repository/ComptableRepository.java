package com.gsb.frais.repository;

import com.gsb.frais.model.Comptable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.lang.NonNull;  // Import de NonNull

import java.util.Optional;

@Repository
public interface ComptableRepository extends JpaRepository<Comptable, Long> {

    @Override
    Optional<Comptable> findById(@NonNull Long id);  // Ajout de l'annotation @NonNull

    // Recherche un comptable par son nom
    Optional<Comptable> findByNom(String nom);
}
