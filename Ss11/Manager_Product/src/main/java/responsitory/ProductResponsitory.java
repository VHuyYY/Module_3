package responsitory;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductResponsitory implements IProductResponsitory<Product> {
    List<Product> products = new ArrayList<Product>();

    public ProductResponsitory() {
        products.add(new Product(1, "Huy", 100, "ABC", "Huy"));
        products.add(new Product(2, "Khanh", 200, "ABC", "Khanh"));
        products.add(new Product(3, "Quang", 100, "ABC", "Quang"));
    }

    @Override
    public List<Product> showAll() {
        return products;
    }

    public void add(Product product) {
        products.add(product);
    }

    public void delete(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                products.remove(i);
                return;
            }
        }
    }

    @Override
    public void edit(Product product) {

    }
}
