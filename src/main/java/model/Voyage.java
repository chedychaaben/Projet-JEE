package model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "Voyage")
public class Voyage {

    public enum ClasseDeVoyage {
        PREMIERE,
        DEUXIEME,
        ECONOMIQUE
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "lieu_depart")
    private String lieuDepart;

    @Column(name = "lieu_arrivee")
    private String lieuArrivee;

    @Column(name = "date_depart")
    private LocalDate dateDepart;

    @Column(name = "heure_depart")
    private LocalTime heureDepart;

    @Column(name = "date_arrivee")
    private LocalDate dateArrivee;

    @Column(name = "heure_arrivee")
    private LocalTime heureArrivee;

    @Column(name = "prix")
    private double prix;

    @Enumerated(EnumType.STRING)
    @Column(name = "classe_de_voyage")
    private ClasseDeVoyage classeDeVoyage;

    @Column(name = "place_cote_fenetre")
    private boolean placeCoteFenetre;

    @Column(name = "espace_famille")
    private boolean espaceFamille;

    @Column(name = "wagon_non_fumeur")
    private boolean wagonNonFumeur;

    public Voyage() {
        // Constructeur par défaut requis par JPA
    }

    public Voyage(String lieuDepart, String lieuArrivee,
                  LocalDate dateDepart, LocalTime heureDepart,
                  LocalDate dateArrivee, LocalTime heureArrivee,
                  double prix, ClasseDeVoyage classeDeVoyage,
                  boolean placeCoteFenetre, boolean espaceFamille,
                  boolean wagonNonFumeur) {
        this.lieuDepart = lieuDepart;
        this.lieuArrivee = lieuArrivee;
        this.dateDepart = dateDepart;
        this.heureDepart = heureDepart;
        this.dateArrivee = dateArrivee;
        this.heureArrivee = heureArrivee;
        this.prix = prix;
        this.classeDeVoyage = classeDeVoyage;
        this.placeCoteFenetre = placeCoteFenetre;
        this.espaceFamille = espaceFamille;
        this.wagonNonFumeur = wagonNonFumeur;
    }

    public int getId() {
        return id;
    }

    public String getLieuDepart() {
        return lieuDepart;
    }

    public void setLieuDepart(String lieuDepart) {
        this.lieuDepart = lieuDepart;
    }

    public String getLieuArrivee() {
        return lieuArrivee;
    }

    public void setLieuArrivee(String lieuArrivee) {
        this.lieuArrivee = lieuArrivee;
    }

    public LocalDate getDateDepart() {
        return dateDepart;
    }

    public void setDateDepart(LocalDate dateDepart) {
        this.dateDepart = dateDepart;
    }

    public LocalTime getHeureDepart() {
        return heureDepart;
    }

    public void setHeureDepart(LocalTime heureDepart) {
        this.heureDepart = heureDepart;
    }

    public LocalDate getDateArrivee() {
        return dateArrivee;
    }

    public void setDateArrivee(LocalDate dateArrivee) {
        this.dateArrivee = dateArrivee;
    }

    public LocalTime getHeureArrivee() {
        return heureArrivee;
    }

    public void setHeureArrivee(LocalTime heureArrivee) {
        this.heureArrivee = heureArrivee;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
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
