package model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "Trajet")
public class Trajet {

    public enum ClasseDeVoyage {
        PREMIERE,
        DEUXIEME,
        ECONOMIQUE
    }

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

    @ManyToOne
    @JoinColumn(name = "gare_depart_id")
    private Gare gareDepart;

    @ManyToOne
    @JoinColumn(name = "gare_arrivee_id")
    private Gare gareArrivee;

    @Column(name = "date")
    private LocalDate date;

    @Column(name = "prix")
    private double prix;

    @Column(name = "places_disponibles")
    private int placesDisponibles;

    @Enumerated(EnumType.STRING)
    @Column(name = "classe_de_voyage")
    private ClasseDeVoyage classeDeVoyage;

    @Column(name = "place_cote_fenetre")
    private boolean placeCoteFenetre;

    @Column(name = "espace_famille")
    private boolean espaceFamille;

    @Column(name = "wagon_non_fumeur")
    private boolean wagonNonFumeur;

    public Trajet() {
        // Constructeur requis par JPA
    }

    public Trajet(String villeDepart, LocalTime heureDepart, String villeArrivee, LocalTime heureArrivee,
                  LocalDate date, double prix, int placesDisponibles, ClasseDeVoyage classeDeVoyage,
                  boolean placeCoteFenetre, boolean espaceFamille, boolean wagonNonFumeur) {
        this.villeDepart = villeDepart;
        this.heureDepart = heureDepart;
        this.villeArrivee = villeArrivee;
        this.heureArrivee = heureArrivee;
        this.date = date;
        this.prix = prix;
        this.placesDisponibles = placesDisponibles;
        this.classeDeVoyage = classeDeVoyage;
        this.placeCoteFenetre = placeCoteFenetre;
        this.espaceFamille = espaceFamille;
        this.wagonNonFumeur = wagonNonFumeur;
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

    public ClasseDeVoyage getClasseDeVoyage() {
        return classeDeVoyage;
    }

    public void setClasseDeVoyage(ClasseDeVoyage classeDeVoyage) {
        this.classeDeVoyage = classeDeVoyage;
    }

    public boolean isPlaceCoteFenetre() {
        return placeCoteFenetre;
    }

    public void setPlaceCoteFenetre(boolean placeCoteFenetre) {
        this.placeCoteFenetre = placeCoteFenetre;
    }

    public boolean isEspaceFamille() {
        return espaceFamille;
    }

    public void setEspaceFamille(boolean espaceFamille) {
        this.espaceFamille = espaceFamille;
    }

    public boolean isWagonNonFumeur() {
        return wagonNonFumeur;
    }

    public void setWagonNonFumeur(boolean wagonNonFumeur) {
        this.wagonNonFumeur = wagonNonFumeur;
    }
}
