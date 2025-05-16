package dao;

import model.Gare;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class GareDAO {
    private final SessionFactory sessionFactory;

    public GareDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    // Méthodes CRUD similaires à UserDAO
    public void create(Gare gare) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.persist(gare);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    public List<Gare> findAll() {
        Session session = sessionFactory.openSession();
        List<Gare> result = session.createQuery("from Gare", Gare.class).getResultList();
        session.close();
        return result;
    }

    // ... autres méthodes
}