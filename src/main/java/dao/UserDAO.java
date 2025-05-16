package dao;

import model.User;
import model.User.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;

public class UserDAO {
    SessionFactory sessionFactory;

    public UserDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    public User findById(int id) {
        Session session = sessionFactory.openSession();
        User user = session.get(User.class, id);
        session.close();
        return user;
    }

    public boolean create(User user) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.persist(user);
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

    public boolean update(int id, String email, String motdepasse) {
        Session session = sessionFactory.openSession();
        User user = session.get(User.class, id);
        boolean success = false;
        if (user != null) {
            user.setEmail(email);
            user.setMotdepasse(motdepasse);
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.merge(user);
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

    public boolean delete(int id) {
        Session session = sessionFactory.openSession();
        User user = session.get(User.class, id);
        boolean success = false;
        if (user != null) {
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.remove(user);
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

    public List<User> findAll() {
        Session session = sessionFactory.openSession();
        List<User> result = session.createQuery("from User", User.class).getResultList();
        session.close();
        return result;
    }

    public List<User> findByRole(Role role) {
        Session session = sessionFactory.openSession();
        List<User> users = session.createQuery("from User where role = :role", User.class)
                .setParameter("role", role)
                .getResultList();
        session.close();
        return users;
    }
}
