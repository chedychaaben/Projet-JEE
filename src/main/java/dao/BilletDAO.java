package dao;

import model.Billet;
import model.Trajet;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class BilletDAO {

    private final SessionFactory sessionFactory;

    public BilletDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    public Billet findById(int id) {
        Session session = sessionFactory.openSession();
        Billet billet = session.get(Billet.class, id);
        session.close();
        return billet;
    }

    public boolean create(Billet billet) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();

            session.persist(billet);

            Trajet trajetAller = billet.getTrajetAller();
            if (trajetAller != null) {
                trajetAller.setPlacesDisponibles(trajetAller.getPlacesDisponibles() - 1);
                session.merge(trajetAller);
            }

            Trajet trajetRetour = billet.getTrajetRetour();
            if (trajetRetour != null) {
                trajetRetour.setPlacesDisponibles(trajetRetour.getPlacesDisponibles() - 1);
                session.merge(trajetRetour);
            }

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


    public boolean update(Billet billet) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.merge(billet);
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
        Billet billet = session.get(Billet.class, id);
        boolean success = false;
        if (billet != null) {
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.remove(billet);
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

    public List<Billet> findAll() {
        Session session = sessionFactory.openSession();
        List<Billet> result = session.createQuery("from Billet", Billet.class).getResultList();
        session.close();
        return result;
    }

    public List<Billet> findByUserId(int userId) {
        Session session = sessionFactory.openSession();
        List<Billet> result = session.createQuery("from Billet where user.id = :userId", Billet.class)
                .setParameter("userId", userId)
                .getResultList();
        session.close();
        return result;
    }

    public List<Billet> findByEtat(Billet.Etat etat) {
        Session session = sessionFactory.openSession();
        List<Billet> result = session.createQuery("from Billet where etat = :etat", Billet.class)
                .setParameter("etat", etat)
                .getResultList();
        session.close();
        return result;
    }

    public List<Billet> findByTrajetAllerId(int trajetId) {
        Session session = sessionFactory.openSession();
        List<Billet> result = session.createQuery("from Billet where trajetAller.id = :trajetId", Billet.class)
                .setParameter("trajetId", trajetId)
                .getResultList();
        session.close();
        return result;
    }

    public List<Billet> findByTrajetRetourId(int trajetId) {
        Session session = sessionFactory.openSession();
        List<Billet> result = session.createQuery("from Billet where trajetRetour.id = :trajetId", Billet.class)
                .setParameter("trajetId", trajetId)
                .getResultList();
        session.close();
        return result;
    }

    public boolean passerDeEncoursAnnulationAAnnule(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;

        try {
            tx = session.beginTransaction();
            Billet billet = session.get(Billet.class, id);
            if (billet != null && billet.getEtat() == Billet.Etat.ENCOURSDANNULATION) {
                // Add back places on trajets
                Trajet trajetAller = billet.getTrajetAller();
                Trajet trajetRetour = billet.getTrajetRetour();

                if (trajetAller != null) {
                    trajetAller.setPlacesDisponibles(trajetAller.getPlacesDisponibles() + 1);
                    session.merge(trajetAller);
                }
                if (trajetRetour != null) {
                    trajetRetour.setPlacesDisponibles(trajetRetour.getPlacesDisponibles() + 1);
                    session.merge(trajetRetour);
                }

                billet.setEtat(Billet.Etat.ANNULE);
                session.merge(billet);
                tx.commit();
                success = true;
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }

        return success;
    }

    public boolean passerDeEncoursAnnulationAAchete(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;

        try {
            tx = session.beginTransaction();
            Billet billet = session.get(Billet.class, id);
            if (billet != null && billet.getEtat() == Billet.Etat.ENCOURSDANNULATION) {
                billet.setEtat(Billet.Etat.ACHETE);
                session.merge(billet);
                tx.commit();
                success = true;
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }

        return success;
    }

    public boolean passerDeAcheteAEncoursAnnulation(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;

        try {
            tx = session.beginTransaction();
            Billet billet = session.get(Billet.class, id);
            if (billet != null && billet.getEtat() == Billet.Etat.ACHETE) {
                billet.setEtat(Billet.Etat.ENCOURSDANNULATION);
                session.merge(billet);
                tx.commit();
                success = true;
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }

        return success;
    }


}
