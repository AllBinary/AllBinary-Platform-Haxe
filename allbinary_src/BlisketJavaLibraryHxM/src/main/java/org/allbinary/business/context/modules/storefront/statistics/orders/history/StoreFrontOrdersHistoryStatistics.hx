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
package org.allbinary.business.context.modules.storefront.statistics.orders.history;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface;
import org.allbinary.logic.StdUtil;

class StoreFrontOrdersHistoryStatistics implements StoreFrontOrdersHistoryStatisticsInterface {
    private var numberOfOrdersLong : Null<haxe.Int64>;
    private var subTotalMoney : Money;
    private var shippingCostMoney : Money;
    private var taxesMoney : Money;
    private var totalMoney : Money;
    public function new(storeFrontInterface : StoreFrontInterface) {
        this.subTotalMoney = new Money();
        this.shippingCostMoney = new Money();
        this.taxesMoney = new Money();
        this.totalMoney = new Money();
        final orderHistoryEntityInterface : OrderHistoryEntityInterface = OrderHistoryEntityFactory.getInstance();
        final orderHistoryInterfaceVector : BasicArrayList = orderHistoryEntityInterface.getStoreOrders(storeFrontInterface);
        var numberOfOrders : haxe.Int64 = 0;
        var orderHistoryInterface : OrderHistoryInterface = null;
        final size : Int = orderHistoryInterfaceVector.size();
        for (index in 0...size) {
            orderHistoryInterface = (cast orderHistoryInterfaceVector.get(index) : OrderHistoryInterface);
            numberOfOrders = numberOfOrders + 1;
            this.subTotalMoney.add(orderHistoryInterface.getSubTotal());
            this.shippingCostMoney.add(orderHistoryInterface.getShippingCost());
            this.taxesMoney.add(orderHistoryInterface.getTaxes());
            this.totalMoney.add(orderHistoryInterface.getTotal());
        }
        this.numberOfOrdersLong = numberOfOrders;
    }

    public function getNumberOfOrders() : Null<haxe.Int64> {
        return this.numberOfOrdersLong;
    }

    public function getSubTotal() : Money {
        return this.subTotalMoney;
    }

    public function getShippingCost() : Money {
        return this.shippingCostMoney;
    }

    public function getTaxes() : Money {
        return this.taxesMoney;
    }

    public function getTotal() : Money {
        return this.totalMoney;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        var storeFrontOrdersHistoryStatisticsData : StoreFrontOrdersHistoryStatisticsData = StoreFrontOrdersHistoryStatisticsData.getInstance();
        hashMap.put(storeFrontOrdersHistoryStatisticsData.NUMBEROFORDERS, this.getNumberOfOrders().toString());
        hashMap.put(storeFrontOrdersHistoryStatisticsData.SUBTOTAL, this.getSubTotal().toString());
        hashMap.put(storeFrontOrdersHistoryStatisticsData.SHIPPINGCOST, this.getShippingCost().toString());
        hashMap.put(storeFrontOrdersHistoryStatisticsData.TAXES, this.getTaxes().toString());
        hashMap.put(storeFrontOrdersHistoryStatisticsData.TOTAL, this.getTotal().toString());
        return hashMap;
    }

    public function toVector() : BasicArrayList {
        return null;
    }

    public function getKey() : Any {
        return null;
    }

}

