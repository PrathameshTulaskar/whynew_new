
import 'package:whynew_new/model/cart.dart';
import 'package:whynew_new/model/cartProductExist.dart';
import 'package:whynew_new/model/product.dart';

CartProductExist cartProductExist(Product product,List<Cart> cartItemList){
    for (var item in cartItemList) {
      if(product.productId == item.productId)
    
      return CartProductExist(currentQty: item.productQty,productExist: true);
    }
    return CartProductExist(currentQty: 0,productExist: false);
  }
  