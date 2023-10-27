package Model;

import Model.Products;
import Model.ShoppingcartPK;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2566-10-28T02:06:20")
@StaticMetamodel(Shoppingcart.class)
public class Shoppingcart_ { 

    public static volatile SingularAttribute<Shoppingcart, ShoppingcartPK> shoppingcartPK;
    public static volatile SingularAttribute<Shoppingcart, Integer> quantity;
    public static volatile SingularAttribute<Shoppingcart, Products> products;

}