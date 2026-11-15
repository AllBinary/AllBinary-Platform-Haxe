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
package org.allbinary.business.user.commerce.inventory.item;

//import java.util.HashMap;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.address.ShippingAddressData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.address.StreetAddressData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.logic.string.StringUtil;

class Item extends BasicItem implements OrderItemInterface {
    private var group : String;
    private var tax : String;
    private var shippingType : String;
    private var shippingCost : String;
    private var shippedDate : String = null;
    private var shippingAddress : StreetAddress;
    private var special : String = null;
    public function new(itemHashMap : HashMap) {
        super(itemHashMap);
        this.setData(itemHashMap);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super();
        final EMPTY : String = StringUtil.getInstance().EMPTY_STRING;
        this.group = EMPTY;
        this.tax = EMPTY;
        this.shippingType = EMPTY;
        this.shippingCost = EMPTY;
        this.shippingAddress = new StreetAddress();
    }

    private function setData(itemHashMap : HashMap) : Void {
        this.group = (cast itemHashMap.get(ShippingMethodData.GROUP) : String);
        this.tax = (cast itemHashMap.get(OrderHistoryData.TAX) : String);
        this.shippingType = (cast itemHashMap.get(ShippingMethodData.NAME) : String);
        this.shippingCost = (cast itemHashMap.get(ShippingMethodData.COST) : String);
        this.shippedDate = (cast itemHashMap.get(OrderHistoryData.SHIPPEDDATE) : String);
        itemHashMap.put(StreetAddressData.NAME, itemHashMap.get(ShippingAddressData.NAME));
        itemHashMap.put(StreetAddressData.STREET, itemHashMap.get(ShippingAddressData.STREET));
        itemHashMap.put(StreetAddressData.CITY, itemHashMap.get(ShippingAddressData.CITY));
        itemHashMap.put(StreetAddressData.STATE, itemHashMap.get(ShippingAddressData.STATE));
        itemHashMap.put(StreetAddressData.CODE, itemHashMap.get(ShippingAddressData.CODE));
        itemHashMap.put(StreetAddressData.COUNTRY, itemHashMap.get(ShippingAddressData.COUNTRY));
        this.shippingAddress = new StreetAddress(itemHashMap);
    }

    public function setGroup(value : String) : Void {
        this.group = value;
    }

    public function setTax(value : String) : Void {
        this.tax = value;
    }

    public function setShippingType(value : String) : Void {
        this.shippingType = value;
    }

    public function setShippingCost(value : String) : Void {
        this.shippingCost = value;
    }

    public function setShippingAddress(value : StreetAddress) : Void {
        this.shippingAddress = value;
    }

    public function setSpecial(value : String) : Void {
        this.special = value;
    }

    public function getGroup() : String {
        return this.group;
    }

    public function getTax() : String {
        return this.tax;
    }

    public function getShippingType() : String {
        return this.shippingType;
    }

    public function getShippingCost() : String {
        return this.shippingCost;
    }

    public function getShippingAddress() : StreetAddress {
        return this.shippingAddress;
    }

    public function getSpecial() : String {
        return this.special;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = super.toHashMap();
        hashMap.put(ShippingMethodData.GROUP, this.group);
        hashMap.put(OrderHistoryData.TAX, this.tax);
        hashMap.put(ShippingMethodData.NAME, this.shippingType);
        hashMap.put(ShippingMethodData.COST, this.shippingCost);
        hashMap.put(OrderHistoryData.SHIPPEDDATE, this.shippedDate);
        hashMap.put(EntryData.getInstance().SPECIAL, this.special);
        return hashMap;
    }

}

