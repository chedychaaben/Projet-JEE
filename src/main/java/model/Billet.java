package model;

import jakarta.persistence.*;
import java.time.LocalDate;
import model.User;
import model.Trajet;

@Entity
@Table(name = "Billet")
public class Billet {

    public enum Etat {
        ACHETE,
        UTILISE,
        ENCOURSDANNULATION,
        ANNULE
    }

    public enum Classe {
        PREMIERE,
        DEUXIEME,
        ECONOMIQUE
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    private Etat etat;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private LocalDate dateAchat;
    private LocalDate dateAnnulation;

    // Trajet aller
    @ManyToOne
    @JoinColumn(name = "trajet_aller_id")
    private Trajet trajetAller;

    @Enumerated(EnumType.STRING)
    @Column(name = "trajet_aller_classe")
    private Classe trajetAllerClasse;

    @Column(name = "trajet_aller_place_cote_fenetre")
    private boolean trajetAllerPlaceCoteFenetre;

    @Column(name = "trajet_aller_espace_famille")
    private boolean trajetAllerEspaceFamille;

    @Column(name = "trajet_aller_wagon_non_fumeur")
    private boolean trajetAllerWagonNonFumeur;

    // Trajet retour
    @ManyToOne
    @JoinColumn(name = "trajet_retour_id")
    private Trajet trajetRetour;

    @Enumerated(EnumType.STRING)
    @Column(name = "trajet_retour_classe")
    private Classe trajetRetourClasse;

    @Column(name = "trajet_retour_place_cote_fenetre")
    private boolean trajetRetourPlaceCoteFenetre;

    @Column(name = "trajet_retour_espace_famille")
    private boolean trajetRetourEspaceFamille;

    @Column(name = "trajet_retour_wagon_non_fumeur")
    private boolean trajetRetourWagonNonFumeur;

    // Constructeur par défaut
    public Billet() {}

    // Constructeur complet
    public Billet(Etat etat, User user, LocalDate dateAchat, LocalDate dateAnnulation,
                  Trajet trajetAller, Classe trajetAllerClasse, boolean trajetAllerPlaceCoteFenetre,
                  boolean trajetAllerEspaceFamille, boolean trajetAllerWagonNonFumeur,
                  Trajet trajetRetour, Classe trajetRetourClasse, boolean trajetRetourPlaceCoteFenetre,
                  boolean trajetRetourEspaceFamille, boolean trajetRetourWagonNonFumeur) {
        this.etat = etat;
        this.user = user;
        this.dateAchat = dateAchat;
        this.dateAnnulation = dateAnnulation;
        this.trajetAller = trajetAller;
        this.trajetAllerClasse = trajetAllerClasse;
        this.trajetAllerPlaceCoteFenetre = trajetAllerPlaceCoteFenetre;
        this.trajetAllerEspaceFamille = trajetAllerEspaceFamille;
        this.trajetAllerWagonNonFumeur = trajetAllerWagonNonFumeur;
        this.trajetRetour = trajetRetour;
        this.trajetRetourClasse = trajetRetourClasse;
        this.trajetRetourPlaceCoteFenetre = trajetRetourPlaceCoteFenetre;
        this.trajetRetourEspaceFamille = trajetRetourEspaceFamille;
        this.trajetRetourWagonNonFumeur = trajetRetourWagonNonFumeur;
    }

    // Getters et Setters
    public int getId() {
        return id;
    }

    public Etat getEtat() {
        return etat;
    }

    public void setEtat(Etat etat) {
        this.etat = etat;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDate getDateAchat() {
        return dateAchat;
    }

    public void setDateAchat(LocalDate dateAchat) {
        this.dateAchat = dateAchat;
    }

    public LocalDate getDateAnnulation() {
        return dateAnnulation;
    }

    public void setDateAnnulation(LocalDate dateAnnulation) {
        this.dateAnnulation = dateAnnulation;
    }

    public Trajet getTrajetAller() {
        return trajetAller;
    }

    public void setTrajetAller(Trajet trajetAller) {
        this.trajetAller = trajetAller;
    }

    public Classe getTrajetAllerClasse() {
        return trajetAllerClasse;
    }

    public void setTrajetAllerClasse(Classe trajetAllerClasse) {
        this.trajetAllerClasse = trajetAllerClasse;
    }

    public boolean isTrajetAllerPlaceCoteFenetre() {
        return trajetAllerPlaceCoteFenetre;
    }

    public void setTrajetAllerPlaceCoteFenetre(boolean trajetAllerPlaceCoteFenetre) {
        this.trajetAllerPlaceCoteFenetre = trajetAllerPlaceCoteFenetre;
    }

    public boolean isTrajetAllerEspaceFamille() {
        return trajetAllerEspaceFamille;
    }

    public void setTrajetAllerEspaceFamille(boolean trajetAllerEspaceFamille) {
        this.trajetAllerEspaceFamille = trajetAllerEspaceFamille;
    }

    public boolean isTrajetAllerWagonNonFumeur() {
        return trajetAllerWagonNonFumeur;
    }

    public void setTrajetAllerWagonNonFumeur(boolean trajetAllerWagonNonFumeur) {
        this.trajetAllerWagonNonFumeur = trajetAllerWagonNonFumeur;
    }

    public Trajet getTrajetRetour() {
        return trajetRetour;
    }

    public void setTrajetRetour(Trajet trajetRetour) {
        this.trajetRetour = trajetRetour;
    }

    public Classe getTrajetRetourClasse() {
        return trajetRetourClasse;
    }

    public void setTrajetRetourClasse(Classe trajetRetourClasse) {
        this.trajetRetourClasse = trajetRetourClasse;
    }

    public boolean isTrajetRetourPlaceCoteFenetre() {
        return trajetRetourPlaceCoteFenetre;
    }

    public void setTrajetRetourPlaceCoteFenetre(boolean trajetRetourPlaceCoteFenetre) {
        this.trajetRetourPlaceCoteFenetre = trajetRetourPlaceCoteFenetre;
    }

    public boolean isTrajetRetourEspaceFamille() {
        return trajetRetourEspaceFamille;
    }

    public void setTrajetRetourEspaceFamille(boolean trajetRetourEspaceFamille) {
        this.trajetRetourEspaceFamille = trajetRetourEspaceFamille;
    }

    public boolean isTrajetRetourWagonNonFumeur() {
        return trajetRetourWagonNonFumeur;
    }

    public void setTrajetRetourWagonNonFumeur(boolean trajetRetourWagonNonFumeur) {
        this.trajetRetourWagonNonFumeur = trajetRetourWagonNonFumeur;
    }
}
