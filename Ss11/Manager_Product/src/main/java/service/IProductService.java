package service;

import model.Product;

import java.util.List;

public interface IProductService <E> {
    List<Product> showAll();
    void add(Product product);
    void update(int id, E product);
    void delete(int id);
}
