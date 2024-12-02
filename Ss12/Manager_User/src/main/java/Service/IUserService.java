package Service;

import java.util.List;

public interface IUserService<E> {
    void add(E e);

    void update(int id, E e);

    void delete(int id);

    List<E> getAll();

    E findById(int id);

}
