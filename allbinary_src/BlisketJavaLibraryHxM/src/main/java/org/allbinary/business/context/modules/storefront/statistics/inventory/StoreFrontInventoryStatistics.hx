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
package org.allbinary.business.context.modules.storefront.statistics.inventory;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface;
import org.allbinary.logic.StdUtil;

class StoreFrontInventoryStatistics implements StoreFrontInventoryStatisticsInterface {
    private var totalNumberOfItems : haxe.Int64 = haxe.Int64.ofInt(0);
    private var totalInventorySaleValueMoney : Money;
    public function new(storeFrontInterface : StoreFrontInterface) {
        this.totalInventorySaleValueMoney = new Money();
        var inventoryEntityInterface : InventoryEntityInterface = InventoryEntityFactory.getInstance().getInventoryEntityInstance();
        var itemVector : BasicArrayList = inventoryEntityInterface.getItems(storeFrontInterface);
        final size : Int = itemVector.size();
        for (index in 0...size) {
            var itemInterface : ItemInterface = (cast itemVector.get(index) : ItemInterface);
            var numberInStock : Int = Std.int(Std.string(itemInterface.getNumber()));
            this.totalNumberOfItems = this.totalNumberOfItems + haxe.Int64.ofInt(numberInStock);
            var itemPriceMoney : Money = itemInterface.getPrice();
            itemPriceMoney.multiply(numberInStock);
            this.totalInventorySaleValueMoney.add(Std.string(itemPriceMoney));
        }
    }

    public function getNumber() : Null<haxe.Int64> {
        return this.totalNumberOfItems;
    }

    public function getTotal() : Money {
        return this.totalInventorySaleValueMoney;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(StoreFrontInventoryStatisticsData.getInstance().NUMBEROFITEMS, Std.string(this.getNumber()));
        hashMap.put(StoreFrontInventoryStatisticsData.getInstance().TOTALVALUE, Std.string(this.getTotal()));
        return hashMap;
    }

    public function toVector() : BasicArrayList {
        return null;
    }

    public function getKey() : Any {
        return null;
    }

}

