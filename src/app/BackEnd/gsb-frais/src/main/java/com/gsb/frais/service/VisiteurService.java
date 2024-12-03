package com.gsb.frais.service;

import com.gsb.frais.model.Visiteur;
import com.gsb.frais.repository.VisiteurRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class VisiteurService {

    private final VisiteurRepository visiteurRepository;

    public VisiteurService(VisiteurRepository visiteurRepository) {
        this.visiteurRepository = visiteurRepository;
    }

    // Récupérer tous les visiteurs
    public List<Visiteur> getAllVisiteurs() {
        return visiteurRepository.findAll();
    }

    // Récupérer un visiteur par ID
    public Visiteur getVisiteurById(String id) {
        return visiteurRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Visiteur non trouvé avec l'ID : " + id));
    }

    // Ajouter un nouveau visiteur
    public Visiteur createVisiteur(Visiteur visiteur) {
        validateVisiteur(visiteur);
        return visiteurRepository.save(visiteur);
    }

    // Mettre à jour un visiteur
    public Visiteur updateVisiteur(String id, Visiteur visiteurDetails) {
        validateVisiteur(visiteurDetails);

        return visiteurRepository.findById(id)
                .map(visiteur -> {
                    visiteur.setNom(visiteurDetails.getNom());
                    visiteur.setPrenom(visiteurDetails.getPrenom());
                    visiteur.setLogin(visiteurDetails.getLogin());
                    visiteur.setMdp(visiteurDetails.getMdp());
                    visiteur.setAdresse(visiteurDetails.getAdresse());
                    visiteur.setCp(visiteurDetails.getCp());
                    visiteur.setVille(visiteurDetails.getVille());
                    visiteur.setDateEmbauche(visiteurDetails.getDateEmbauche());
                    return visiteurRepository.save(visiteur);
                })
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Visiteur non trouvé avec l'ID : " + id));
    }

    // Supprimer un visiteur
    public void deleteVisiteur(String id) {
        if (!visiteurRepository.existsById(id)) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "Visiteur non trouvé avec l'ID : " + id);
        }
        visiteurRepository.deleteById(id);
    }

    // Méthode de validation
    private void validateVisiteur(Visiteur visiteur) {
        if (visiteur.getNom() == null || visiteur.getNom().isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Le nom du visiteur est obligatoire.");
        }
        if (visiteur.getLogin() == null || visiteur.getLogin().isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Le login du visiteur est obligatoire.");
        }
    }
}
