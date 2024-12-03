package com.gsb.frais.service;

import com.gsb.frais.model.FicheFrais;
import com.gsb.frais.repository.FicheFraisRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class FicheFraisService {

    private final FicheFraisRepository ficheFraisRepository;

    public FicheFraisService(FicheFraisRepository ficheFraisRepository) {
        this.ficheFraisRepository = ficheFraisRepository;
    }

    // Récupérer toutes les fiches de frais
    public List<FicheFrais> getAllFicheFrais() {
        return ficheFraisRepository.findAll();
    }

    // Récupérer une fiche de frais par ID
    public FicheFrais getFicheFraisById(Long id) {
        return ficheFraisRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Fiche de frais non trouvée avec l'ID : " + id));
    }

    // Ajouter une nouvelle fiche de frais
    public FicheFrais createFicheFrais(FicheFrais ficheFrais) {
        return ficheFraisRepository.save(ficheFrais);
    }

    // Mettre à jour une fiche de frais
    public FicheFrais updateFicheFrais(Long id, FicheFrais ficheFraisDetails) {
        return ficheFraisRepository.findById(id)
                .map(ficheFrais -> {
                    ficheFrais.setMontantValide(ficheFraisDetails.getMontantValide());
                    ficheFrais.setNbJustificatifs(ficheFraisDetails.getNbJustificatifs());
                    ficheFrais.setDateModif(ficheFraisDetails.getDateModif());
                    return ficheFraisRepository.save(ficheFrais);
                })
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Fiche de frais non trouvée avec l'ID : " + id));
    }

    // Supprimer une fiche de frais
    public void deleteFicheFrais(Long id) {
        if (!ficheFraisRepository.existsById(id)) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "Fiche de frais non trouvée avec l'ID : " + id);
        }
        ficheFraisRepository.deleteById(id);
    }
}
