package responsitory;

import java.util.List;

public interface IProductResponsitory <E>{
    List<E> showAll();
    void add(E e);
    void delete(int id);
    void edit(E e);
}
