package com.gsb.frais.repository;

import com.gsb.frais.model.LigneFraisForfait;
import com.gsb.frais.model.FicheFrais;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LigneFraisForfaitRepository extends JpaRepository<LigneFraisForfait, Long> {

    // Recherche les lignes de frais forfaitaires associées à une fiche de frais spécifique
    List<LigneFraisForfait> findByFicheFrais(FicheFrais ficheFrais);
}
