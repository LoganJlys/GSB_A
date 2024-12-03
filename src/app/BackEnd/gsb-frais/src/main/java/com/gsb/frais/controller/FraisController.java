package com.gsb.frais.controller;

import com.gsb.frais.model.Frais;
import com.gsb.frais.service.FraisService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/api/frais")
public class FraisController {

    private final FraisService fraisService;

    public FraisController(FraisService fraisService) {
        this.fraisService = fraisService;
    }

    // Récupérer tous les frais
    @GetMapping
    public List<Frais> getAllFrais() {
        return fraisService.getAllFrais();
    }

    // Récupérer un frais par ID
    @GetMapping("/{id}")
    public ResponseEntity<Frais> getFraisById(@PathVariable String id) {
        try {
            Frais frais = fraisService.getFraisById(id);
            return ResponseEntity.ok(frais); // Renvoie l'objet Frais avec un statut HTTP 200
        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatusCode()).build(); // Gère les erreurs 404 ou autres
        }
    }

    // Ajouter un nouveau frais
    @PostMapping
    public ResponseEntity<Frais> createFrais(@RequestBody Frais frais) {
        try {
            Frais createdFrais = fraisService.createFrais(frais);
            return ResponseEntity.status(201).body(createdFrais); // Code 201 pour la création
        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatusCode()).build(); // Gère les erreurs de validation
        }
    }

    // Mettre à jour un frais
    @PutMapping("/{id}")
    public ResponseEntity<Frais> updateFrais(@PathVariable String id, @RequestBody Frais fraisDetails) {
        try {
            Frais updatedFrais = fraisService.updateFrais(id, fraisDetails);
            return ResponseEntity.ok(updatedFrais); // Renvoie l'objet mis à jour avec un statut HTTP 200
        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatusCode()).build(); // Gère les erreurs 404 ou autres
        }
    }

    // Supprimer un frais
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteFrais(@PathVariable String id) {
        try {
            fraisService.deleteFrais(id);
            return ResponseEntity.noContent().build(); // Code 204 pour suppression réussie
        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatusCode()).build(); // Gère les erreurs 404
        }
    }
}
