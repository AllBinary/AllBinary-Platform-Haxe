/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.business.user.commerce.inventory.basket;

//import java.io.Serializable;
//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.logic.StdUtil;

class Basket implements BasketInterface implements Serializable {
    private var items : HashMap = StdUtil.getInstance().createHashMap();
    public function new() {
    }

    public function addItem(id : String, num : String) : Void {
        if (this.items.containsKey(id)) {
            var oldNumStr : String = (cast this.items.get(id) : String);
            var oldNumInt : Null<Int> = Std.string(oldNumStr);
            var numInt : Null<Int> = Std.string(num);
            var newNumInt : Null<Int> = Std.int(oldNumInt) + Std.int(numInt);
            this.items.put(id, newNumInt.toString());
        } else {
            this.items.put(id, num);
        }
    }

    public function removeItem(id : String) : Void {
        this.items.remove(id);
    }

    public function adjustItem(id : String, num : String) : Void {
        if (Std.int(Std.string(num)) > 0) {
            this.items.put(id, num);
        } else {
            this.items.remove(id);
        }
    }

    public function getTotalWeight() : String {
        final itemsAndNumberInBasket : HashMap = this.getItems();
        final totalWeight : Money = new Money();
        if (itemsAndNumberInBasket.size() > 0) {
            final items : Set = itemsAndNumberInBasket.keySet();
            var product : String = null;
            var weightFloat : Null<Float> = null;
            final itemArray : haxe.ds.Vector<Any> = items.toArray();
            final size : Int = itemArray.length;
            for (index in 0...size) {
                product = (cast itemArray[index] : String);
                weightFloat = new InventoryEntity().getWeight(product);
                weightFloat = getNumberOf(product) * weightFloat;
                totalWeight.add(weightFloat.toString());
            }
        }
        return totalWeight.toString();
    }

    public function getNumberOfItems() : Null<Int> {
        return this.items.size();
    }

    public function getIds() : Set {
        var set : Set = this.items.keySet();
        return set;
    }

    public function getItems() : HashMap {
        return this.items;
    }

    public function getNumberOf(product : String) : Null<Int> {
        var numStr : String = (cast this.items.get(product) : String);
        return Std.string(numStr);
    }

    // throws MoneyException
    public function getSubTotal() : Money {
        var itemsAndNumberInBasket : HashMap = this.getItems();
        var subTotal : Money = new Money();
        if (itemsAndNumberInBasket.size() > 0) {
            var items : Set = itemsAndNumberInBasket.keySet();
            var inventoryEntityFactory : InventoryEntityFactory = InventoryEntityFactory.getInstance();
            var inventoryEntity : InventoryEntity = (cast inventoryEntityFactory.getInventoryEntityInstance() : InventoryEntity);
            final itemArray : haxe.ds.Vector<Any> = items.toArray();
            final size : Int = itemArray.length;
            for (index in 0...size) {
                var product : String = (cast itemArray[index] : String);
                var itemInterface : ItemInterface = inventoryEntity.getItem(product);
                var productTotal : Money = itemInterface.getPrice();
                productTotal.multiply(Std.int(getNumberOf(product)));
                subTotal.add(productTotal.toString());
            }
        }
        return subTotal;
    }

}

