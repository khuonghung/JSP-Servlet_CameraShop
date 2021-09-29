package polymart.xyz.ass_jv4.utils;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class EntityUtils {

    private static EntityUtils entityUtils;
    private static EntityManager entityManagerFactory;

    public EntityManager getEntityManager() {
        if (entityManagerFactory == null) {
            return entityManagerFactory = Persistence.createEntityManagerFactory("POLY_ASS_JAVA4")
                    .createEntityManager();
        }
        return entityManagerFactory;
    }

    public static EntityUtils getEntityUtils() {
        if (entityUtils == null) {
            return entityUtils = new EntityUtils();
        }
        return entityUtils;
    }

}
