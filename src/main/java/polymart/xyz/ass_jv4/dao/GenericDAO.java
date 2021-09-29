package polymart.xyz.ass_jv4.dao;

import javax.persistence.TypedQuery;
import java.util.List;

public interface GenericDAO<T> {

    boolean update(T entity, String sql);

    TypedQuery<T> query(TypedQuery<T> query, Object... parameters);
}
