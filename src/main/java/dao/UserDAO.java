package dao;

import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class UserDAO {
    private SessionFactory sessionFactory;

    public UserDAO() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    public User findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(User.class, id);
        }
    }

    public boolean create(User user) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.persist(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public boolean update(int id, String email, String motdepasse) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            User user = session.get(User.class, id);
            if (user == null) return false;
            user.setEmail(email);
            user.setMotdepasse(motdepasse);
            tx = session.beginTransaction();
            session.merge(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public boolean delete(int id) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            User user = session.get(User.class, id);
            if (user == null) return false;
            tx = session.beginTransaction();
            session.remove(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public List<User> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from User", User.class).getResultList();
        }
    }

    /**
     * Récupère tous les utilisateurs selon leur rôle admin ou non.
     * @param estAdmin true pour admins, false pour utilisateurs normaux
     * @return liste des utilisateurs filtrés par rôle
     */
    public List<User> findByRole(boolean estAdmin) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from User where estAdmin = :estAdmin", User.class)
                    .setParameter("estAdmin", estAdmin)
                    .getResultList();
        }
    }

    public User findByEmail(String email) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from User where email = :email", User.class)
                    .setParameter("email", email)
                    .uniqueResult();
        }
    }

    public boolean bloquerUtilisateur(int id) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            User user = session.get(User.class, id);
            if (user == null) return false;

            user.setEstBanned(true);

            tx = session.beginTransaction();
            session.merge(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public boolean debloquerUtilisateur(int id) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            User user = session.get(User.class, id);
            if (user == null) return false;

            user.setEstBanned(false);

            tx = session.beginTransaction();
            session.merge(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

}
