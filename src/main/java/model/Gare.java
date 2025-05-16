package model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "Gare")
public class Gare {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true)
    private String nom;

    @Column(nullable = false)
    private String ville;

    @OneToMany(mappedBy = "gareDepart")
    private List<Trajet> departs;

    @OneToMany(mappedBy = "gareArrivee")
    private List<Trajet> arrivees;

    // Constructeurs, getters et setters
    public Gare() {}

    public Gare(String nom, String ville) {
        this.nom = nom;
        this.ville = ville;
    }

    // ... getters et setters
}