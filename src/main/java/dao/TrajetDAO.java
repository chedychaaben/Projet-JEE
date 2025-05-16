package dao;

import model.Trajet;
import model.Trajet.ClasseDeVoyage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.time.LocalDate;
import java.util.List;

public class TrajetDAO {
    private final SessionFactory sessionFactory;

    public TrajetDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    public Trajet findById(int id) {
        Session session = sessionFactory.openSession();
        Trajet trajet = session.get(Trajet.class, id);
        session.close();
        return trajet;
    }

    public boolean create(Trajet trajet) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.persist(trajet);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
        return success;
    }

    public boolean update(Trajet trajet) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.merge(trajet);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
        return success;
    }

    public boolean delete(int id) {
        Session session = sessionFactory.openSession();
        Trajet trajet = session.get(Trajet.class, id);
        boolean success = false;
        if (trajet != null) {
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.remove(trajet);
                tx.commit();
                success = true;
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                throw e;
            } finally {
                session.close();
            }
        }
        return success;
    }

    public List<Trajet> findAll() {
        Session session = sessionFactory.openSession();
        List<Trajet> result = session.createQuery("from Trajet", Trajet.class).getResultList();
        session.close();
        return result;
    }

    public List<Trajet> findByVilleDepart(String villeDepart) {
        Session session = sessionFactory.openSession();
        List<Trajet> result = session.createQuery("from Trajet where villeDepart = :ville", Trajet.class)
                .setParameter("ville", villeDepart)
                .getResultList();
        session.close();
        return result;
    }

    public List<Trajet> findByClasse(ClasseDeVoyage classe) {
        Session session = sessionFactory.openSession();
        List<Trajet> result = session.createQuery("from Trajet where classeDeVoyage = :classe", Trajet.class)
                .setParameter("classe", classe)
                .getResultList();
        session.close();
        return result;
    }

    public List<Trajet> findByDate(LocalDate date) {
        Session session = sessionFactory.openSession();
        List<Trajet> result = session.createQuery("from Trajet where date = :date", Trajet.class)
                .setParameter("date", date)
                .getResultList();
        session.close();
        return result;
    }

    public List<Trajet> findByVillesAndDate(String villeDepart, String villeArrivee, LocalDate date) {
        Session session = sessionFactory.openSession();
        List<Trajet> result = session.createQuery(
                        "from Trajet where villeDepart = :villeDepart and villeArrivee = :villeArrivee and date = :date",
                        Trajet.class)
                .setParameter("villeDepart", villeDepart)
                .setParameter("villeArrivee", villeArrivee)
                .setParameter("date", date)
                .getResultList();
        session.close();
        return result;
    }
}
