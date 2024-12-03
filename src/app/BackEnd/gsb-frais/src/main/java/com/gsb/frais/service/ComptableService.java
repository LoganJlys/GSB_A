package com.gsb.frais.service;

import com.gsb.frais.model.Comptable;
import com.gsb.frais.repository.ComptableRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class ComptableService {

    private final ComptableRepository comptableRepository;

    public ComptableService(ComptableRepository comptableRepository) {
        this.comptableRepository = comptableRepository;
    }

    // Récupérer tous les comptables
    public List<Comptable> getAllComptables() {
        return comptableRepository.findAll();
    }

    // Récupérer un comptable par ID
    public Comptable getComptableById(String id) {
        return comptableRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Comptable non trouvé avec l'ID : " + id));
    }

    // Ajouter un nouveau comptable
    public Comptable createComptable(Comptable comptable) {
        validateComptable(comptable);
        return comptableRepository.save(comptable);
    }

    // Mettre à jour un comptable
    public Comptable updateComptable(String id, Comptable comptableDetails) {
        validateComptable(comptableDetails);

        return comptableRepository.findById(id)
                .map(comptable -> {
                    comptable.setNom(comptableDetails.getNom());
                    comptable.setPrenom(comptableDetails.getPrenom());
                    comptable.setLogin(comptableDetails.getLogin());
                    comptable.setMdp(comptableDetails.getMdp());
                    comptable.setAdresse(comptableDetails.getAdresse());
                    comptable.setCp(comptableDetails.getCp());
                    comptable.setVille(comptableDetails.getVille());
                    comptable.setDateembauche(comptableDetails.getDateembauche());
                    return comptableRepository.save(comptable);
                })
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Comptable non trouvé avec l'ID : " + id));
    }

    // Supprimer un comptable
    public void deleteComptable(String id) {
        if (!comptableRepository.existsById(id)) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "Comptable non trouvé avec l'ID : " + id);
        }
        comptableRepository.deleteById(id);
    }

    // Méthode de validation
    private void validateComptable(Comptable comptable) {
        if (comptable.getNom() == null || comptable.getNom().isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Le nom du comptable est obligatoire.");
        }
        if (comptable.getLogin() == null || comptable.getLogin().isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Le login du comptable est obligatoire.");
        }
    }
}
