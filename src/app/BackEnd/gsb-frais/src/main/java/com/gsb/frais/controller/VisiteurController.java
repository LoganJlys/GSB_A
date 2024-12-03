package com.gsb.frais.controller;

import com.gsb.frais.model.Visiteur;
import com.gsb.frais.service.VisiteurService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/visiteurs")
public class VisiteurController {

    private final VisiteurService visiteurService;

    public VisiteurController(VisiteurService visiteurService) {
        this.visiteurService = visiteurService;
    }

    @GetMapping
    public List<Visiteur> getAllVisiteurs() {
        return visiteurService.getAllVisiteurs();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Visiteur> getVisiteurById(@PathVariable String id) {
        return ResponseEntity.ok(visiteurService.getVisiteurById(id));
    }

    @PostMapping
    public ResponseEntity<Visiteur> createVisiteur(@RequestBody Visiteur visiteur) {
        Visiteur createdVisiteur = visiteurService.createVisiteur(visiteur);
        return ResponseEntity.status(201).body(createdVisiteur);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Visiteur> updateVisiteur(@PathVariable String id, @RequestBody Visiteur visiteurDetails) {
        try {
            Visiteur updatedVisiteur = visiteurService.updateVisiteur(id, visiteurDetails);
            return ResponseEntity.ok(updatedVisiteur);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteVisiteur(@PathVariable String id) {
        try {
            visiteurService.deleteVisiteur(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
