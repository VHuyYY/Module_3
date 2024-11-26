package service;

import model.Product;
import responsitory.IProductResponsitory;
import responsitory.ProductResponsitory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService<Product> {
    private final IProductResponsitory<Product> iProductResponsitory = new ProductResponsitory();

    @Override
    public List<Product> showAll() {
        return iProductResponsitory.showAll();
    }
    public void add(Product product) {
        this.iProductResponsitory.add(product);
    }

    @Override
    public void update(int id, Product product) {

    }

    public void update(Product product) {
        this.iProductResponsitory.edit(product);
    }

    @Override
    public void delete(int id) {
        this.iProductResponsitory.delete(id);
    }
}
