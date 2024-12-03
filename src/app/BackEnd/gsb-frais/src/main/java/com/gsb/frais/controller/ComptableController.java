package com.gsb.frais.controller;

import com.gsb.frais.model.Comptable;
import com.gsb.frais.service.ComptableService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/comptables")
public class ComptableController {

    private final ComptableService comptableService;

    public ComptableController(ComptableService comptableService) {
        this.comptableService = comptableService;
    }

    @GetMapping
    public List<Comptable> getAllComptables() {
        return comptableService.getAllComptables();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Comptable> getComptableById(@PathVariable String id) {
        return ResponseEntity.ok(comptableService.getComptableById(id));
    }

    @PostMapping
    public ResponseEntity<Comptable> createComptable(@RequestBody Comptable comptable) {
        Comptable createdComptable = comptableService.createComptable(comptable);
        return ResponseEntity.status(201).body(createdComptable);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Comptable> updateComptable(@PathVariable String id, @RequestBody Comptable comptableDetails) {
        try {
            Comptable updatedComptable = comptableService.updateComptable(id, comptableDetails);
            return ResponseEntity.ok(updatedComptable);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteComptable(@PathVariable String id) {
        try {
            comptableService.deleteComptable(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
