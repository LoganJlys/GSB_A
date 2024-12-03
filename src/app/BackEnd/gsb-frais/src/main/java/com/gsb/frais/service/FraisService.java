package com.gsb.frais.service;

import com.gsb.frais.model.Frais;
import com.gsb.frais.repository.FraisRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class FraisService {

    private final FraisRepository fraisRepository;

    public FraisService(FraisRepository fraisRepository) {
        this.fraisRepository = fraisRepository;
    }

    // Récupérer tous les frais
    public List<Frais> getAllFrais() {
        return fraisRepository.findAll();
    }

    // Récupérer un frais par ID
    public Frais getFraisById(String id) {
        return fraisRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Frais non trouvé avec l'ID : " + id));
    }

    // Ajouter un nouveau frais
    public Frais createFrais(Frais frais) {
        validateFrais(frais);
        return fraisRepository.save(frais);
    }

    // Mettre à jour un frais
    public Frais updateFrais(String id, Frais fraisDetails) {
        validateFrais(fraisDetails);

        return fraisRepository.findById(id)
                .map(frais -> {
                    frais.setDescription(fraisDetails.getDescription());
                    frais.setMontant(fraisDetails.getMontant());
                    frais.setDate(fraisDetails.getDate());
                    return fraisRepository.save(frais);
                })
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Frais non trouvé avec l'ID : " + id));
    }

    // Supprimer un frais
    public void deleteFrais(String id) {
        if (!fraisRepository.existsById(id)) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "Frais non trouvé avec l'ID : " + id);
        }
        fraisRepository.deleteById(id);
    }

    // Méthode de validation des frais
    private void validateFrais(Frais frais) {
        if (frais.getMontant() <= 0) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Le montant doit être supérieur à zéro.");
        }
        if (frais.getDescription() == null || frais.getDescription().isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "La description ne peut pas être vide.");
        }
        if (frais.getDate() == null) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "La date est obligatoire.");
        }
    }
}
