package model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "Trajet")
public class Trajet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "ville_depart")
    private String villeDepart;

    @Column(name = "heure_depart")
    private LocalTime heureDepart;

    @Column(name = "ville_arrivee")
    private String villeArrivee;

    @Column(name = "heure_arrivee")
    private LocalTime heureArrivee;

    @Column(name = "date")
    private LocalDate date;

    @Column(name = "prix")
    private double prix;

    @Column(name = "places_disponibles")
    private int placesDisponibles;


    @Column(name = "estSupprimer")
    private boolean estSupprimer = false;

    public Trajet() {
        // Constructeur requis par JPA
    }

    public Trajet(String villeDepart, LocalTime heureDepart, String villeArrivee, LocalTime heureArrivee,
                  LocalDate date, double prix, int placesDisponibles) {
        this.villeDepart = villeDepart;
        this.heureDepart = heureDepart;
        this.villeArrivee = villeArrivee;
        this.heureArrivee = heureArrivee;
        this.date = date;
        this.prix = prix;
        this.placesDisponibles = placesDisponibles;
    }


    public Trajet(int id, String villeDepart, LocalTime heureDepart, String villeArrivee, LocalTime heureArrivee,
                  LocalDate date, double prix, int placesDisponibles) {
        this.id = id;
        this.villeDepart = villeDepart;
        this.heureDepart = heureDepart;
        this.villeArrivee = villeArrivee;
        this.heureArrivee = heureArrivee;
        this.date = date;
        this.prix = prix;
        this.placesDisponibles = placesDisponibles;
    }

    // Getters et Setters

    public int getId() {
        return id;
    }

    public String getVilleDepart() {
        return villeDepart;
    }

    public void setVilleDepart(String villeDepart) {
        this.villeDepart = villeDepart;
    }

    public LocalTime getHeureDepart() {
        return heureDepart;
    }

    public void setHeureDepart(LocalTime heureDepart) {
        this.heureDepart = heureDepart;
    }

    public String getVilleArrivee() {
        return villeArrivee;
    }

    public void setVilleArrivee(String villeArrivee) {
        this.villeArrivee = villeArrivee;
    }

    public LocalTime getHeureArrivee() {
        return heureArrivee;
    }

    public void setHeureArrivee(LocalTime heureArrivee) {
        this.heureArrivee = heureArrivee;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public int getPlacesDisponibles() {
        return placesDisponibles;
    }

    public void setPlacesDisponibles(int placesDisponibles) {
        this.placesDisponibles = placesDisponibles;
    }

    public boolean isEstSupprimer() {
        return estSupprimer;
    }

    public void setEstSupprimer(boolean estSupprimer) {
        this.estSupprimer = estSupprimer;
    }
}
