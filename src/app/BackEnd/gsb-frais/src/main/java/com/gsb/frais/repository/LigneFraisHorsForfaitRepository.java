package com.gsb.frais.repository;

import com.gsb.frais.model.LigneFraisHorsForfait;
import com.gsb.frais.model.FicheFrais;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LigneFraisHorsForfaitRepository extends JpaRepository<LigneFraisHorsForfait, Long> {

    // Recherche les lignes de frais hors forfait associées à une fiche de frais spécifique
    List<LigneFraisHorsForfait> findByFicheFrais(FicheFrais ficheFrais);
}
