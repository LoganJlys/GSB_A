package com.gsb.frais.controller;

import com.gsb.frais.model.FicheFrais;
import com.gsb.frais.service.FicheFraisService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/fichefrais")
public class FicheFraisController {

    private final FicheFraisService ficheFraisService;

    public FicheFraisController(FicheFraisService ficheFraisService) {
        this.ficheFraisService = ficheFraisService;
    }

    @GetMapping
    public List<FicheFrais> getAllFicheFrais() {
        return ficheFraisService.getAllFicheFrais();
    }

    @GetMapping("/{id}")
    public ResponseEntity<FicheFrais> getFicheFraisById(@PathVariable Long id) {
        return ResponseEntity.ok(ficheFraisService.getFicheFraisById(id));
    }

    @PostMapping
    public ResponseEntity<FicheFrais> createFicheFrais(@RequestBody FicheFrais ficheFrais) {
        FicheFrais createdFicheFrais = ficheFraisService.createFicheFrais(ficheFrais);
        return ResponseEntity.status(201).body(createdFicheFrais);
    }

    @PutMapping("/{id}")
    public ResponseEntity<FicheFrais> updateFicheFrais(@PathVariable Long id, @RequestBody FicheFrais ficheFraisDetails) {
        try {
            FicheFrais updatedFicheFrais = ficheFraisService.updateFicheFrais(id, ficheFraisDetails);
            return ResponseEntity.ok(updatedFicheFrais);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteFicheFrais(@PathVariable Long id) {
        try {
            ficheFraisService.deleteFicheFrais(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
