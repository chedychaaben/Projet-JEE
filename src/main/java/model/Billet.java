package model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Billet")
public class Billet {

    public enum Etat {
        ACHETE,
        UTILISE,
        ANNULE
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(name = "etat")
    private Etat etat;

    @Column(name = "date_achat")
    private LocalDate dateAchat;

    @Column(name = "date_annulation")
    private LocalDate dateAnnulation;

    @ManyToOne
    @JoinColumn(name = "voyage_aller_id")
    private Voyage voyageAller;

    @ManyToOne
    @JoinColumn(name = "voyage_retour_id")
    private Voyage voyageRetour;

    public Billet() {
        // Constructeur par défaut requis par JPA
    }

    public Billet(Etat etat, LocalDate dateAchat, LocalDate dateAnnulation, Voyage voyageAller, Voyage voyageRetour) {
        this.etat = etat;
        this.dateAchat = dateAchat;
        this.dateAnnulation = dateAnnulation;
        this.voyageAller = voyageAller;
        this.voyageRetour = voyageRetour;
    }

    public int getId() {
        return id;
    }

    public Etat getEtat() {
        return etat;
    }

    public void setEtat(Etat etat) {
        this.etat = etat;
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

    public Voyage getVoyageAller() {
        return voyageAller;
    }

    public void setVoyageAller(Voyage voyageAller) {
        this.voyageAller = voyageAller;
    }

    public Voyage getVoyageRetour() {
        return voyageRetour;
    }

    public void setVoyageRetour(Voyage voyageRetour) {
        this.voyageRetour = voyageRetour;
    }
}
