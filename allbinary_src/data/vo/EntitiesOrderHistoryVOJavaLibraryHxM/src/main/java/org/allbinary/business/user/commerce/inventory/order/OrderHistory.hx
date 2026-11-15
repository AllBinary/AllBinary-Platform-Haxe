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
package org.allbinary.business.user.commerce.inventory.order;

//import java.util.Date;
//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.address.BillingAddressData;
import org.allbinary.business.user.address.ShippingAddressData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.business.user.commerce.money.payment.Payment;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class OrderHistory extends Order implements OrderHistoryInterface {
    private var userName : String;
    private var shippingAddress : StreetAddress;
    private var billingAddress : StreetAddress;
    private var payment : Payment;
    private var shipDate : String;
    private var orderDate : String;
    private var transDate : String;
    private var cancelDate : String;
    private var status : String;
    private var subTotal : Money;
    private var shippingCost : Money;
    private var taxes : Money;
    private var total : Money;
    public function new(basketInterface : BasketInterface) {
        super(basketInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(basketInterface : BasketInterface, orderHistory : OrderHistory) {
        super(orderHistory.getStoreName(), basketInterface, orderHistory.getId(), orderHistory.getShippingMethod(), orderHistory.getSpecial(), orderHistory.getPaymentMethod());
        this.userName = orderHistory.getUserName();
        this.shippingAddress = orderHistory.getShippingAddress();
        this.billingAddress = orderHistory.getBillingAddress();
        this.payment = orderHistory.getPaymentInfo();
        this.shipDate = orderHistory.getShipDate();
        this.orderDate = orderHistory.getOrderDate();
        this.transDate = orderHistory.getTransDate();
        this.cancelDate = orderHistory.getCancelDate();
        this.status = orderHistory.getStatus();
        this.subTotal = orderHistory.getSubTotal();
        this.shippingCost = orderHistory.getShippingCost();
        this.taxes = orderHistory.getTaxes();
        this.total = orderHistory.getTotal();
        super.setUserComments((cast orderHistory.getUserComments() : String));
        super.setUserCancelComments((cast orderHistory.getUserCancelComments() : String));
        super.setStoreComments((cast orderHistory.getStoreComments() : String));
        super.setStoreCancelComments((cast orderHistory.getStoreCancelComments() : String));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(basketInterface : BasketInterface, orderHistoryHashMap : HashMap) {
        super((cast orderHistoryHashMap.get(StoreFrontData.getInstance().NAME) : String), basketInterface, (cast orderHistoryHashMap.get(OrderData.ID) : String), (cast orderHistoryHashMap.get(ShippingMethodData.NAME) : String), (cast orderHistoryHashMap.get(EntryData.getInstance().SPECIAL) : String), (cast orderHistoryHashMap.get(PaymentData.METHOD) : String));
        this.shippingAddress = new StreetAddress((cast orderHistoryHashMap.get(ShippingAddressData.NAME) : String), (cast orderHistoryHashMap.get(ShippingAddressData.STREET) : String), (cast orderHistoryHashMap.get(ShippingAddressData.CITY) : String), (cast orderHistoryHashMap.get(ShippingAddressData.STATE) : String), (cast orderHistoryHashMap.get(ShippingAddressData.CODE) : String), (cast orderHistoryHashMap.get(ShippingAddressData.COUNTRY) : String));
        this.billingAddress = new StreetAddress((cast orderHistoryHashMap.get(BillingAddressData.NAME) : String), (cast orderHistoryHashMap.get(BillingAddressData.STREET) : String), (cast orderHistoryHashMap.get(BillingAddressData.CITY) : String), (cast orderHistoryHashMap.get(BillingAddressData.STATE) : String), (cast orderHistoryHashMap.get(BillingAddressData.CODE) : String), (cast orderHistoryHashMap.get(BillingAddressData.COUNTRY) : String));
        this.payment = new Payment(orderHistoryHashMap);
        this.userName = (cast orderHistoryHashMap.get(UserData.USERNAME) : String);
        this.orderDate = (cast orderHistoryHashMap.get(OrderHistoryData.ORDERDATE) : String);
        this.shipDate = (cast orderHistoryHashMap.get(OrderHistoryData.SHIPPEDDATE) : String);
        this.transDate = (cast orderHistoryHashMap.get(OrderHistoryData.TRANSDATE) : String);
        this.cancelDate = (cast orderHistoryHashMap.get(OrderHistoryData.CANCELDATE) : String);
        this.status = (cast orderHistoryHashMap.get(OrderHistoryData.STATUS) : String);
        this.subTotal = new Money((cast orderHistoryHashMap.get(OrderHistoryData.SUBTOTAL) : String));
        this.total = new Money((cast orderHistoryHashMap.get(OrderHistoryData.TOTAL) : String));
        this.shippingCost = new Money((cast orderHistoryHashMap.get(OrderHistoryData.SHIPPINGCOST) : String));
        this.taxes = new Money((cast orderHistoryHashMap.get(OrderHistoryData.TAX) : String));
        super.setUserComments((cast orderHistoryHashMap.get(OrderData.CUSTOMERCOMMENT) : String));
        super.setUserCancelComments((cast orderHistoryHashMap.get(OrderData.CUSTOMERCANCELCOMMENT) : String));
        super.setStoreComments((cast orderHistoryHashMap.get(OrderData.STORECOMMENT) : String));
        super.setStoreCancelComments((cast orderHistoryHashMap.get(OrderData.STORECANCELCOMMENT) : String));
    }

    public function setUserName(value : String) : Void {
        this.userName = value;
    }

    public function setDefaultShippingAddress(shippingAddress : StreetAddress) : Void {
        this.shippingAddress = shippingAddress;
    }

    public function setBillingAddress(billingAddress : StreetAddress) : Void {
        this.billingAddress = billingAddress;
    }

    public function setPaymentInfo(payment : Payment) : Void {
        this.payment = payment;
    }

    public function setShipDate(value : String) : Void {
        this.shipDate = value;
    }

    public function setOrderDate(value : String) : Void {
        this.orderDate = value;
    }

    public function setTransDate(value : String) : Void {
        this.transDate = value;
    }

    public function setCancelDate(value : String) : Void {
        this.cancelDate = value;
    }

    public function setStatus(value : String) : Void {
        this.status = value;
    }

    public function setSubTotal(value : Money) : Void {
        this.subTotal = value;
    }

    public function setShippingCost(value : Money) : Void {
        this.shippingCost = value;
    }

    public function setTaxes(value : Money) : Void {
        this.taxes = value;
    }

    public function setTotal(value : Money) : Void {
        this.total = value;
    }

    public function getUserName() : String {
        return this.userName;
    }

    public function getShippingAddress() : StreetAddress {
        return this.shippingAddress;
    }

    public function getBillingAddress() : StreetAddress {
        return this.billingAddress;
    }

    public function getPaymentInfo() : Payment {
        return this.payment;
    }

    public function getShipDate() : String {
        return this.shipDate;
    }

    public function getOrderDate() : String {
        return this.orderDate;
    }

    public function getTransDate() : String {
        return this.transDate;
    }

    public function getCancelDate() : String {
        return this.cancelDate;
    }

    public function getStatus() : String {
        return this.status;
    }

    public function getSubTotal() : Money {
        return this.subTotal;
    }

    public function getShippingCost() : Money {
        return this.shippingCost;
    }

    public function getTaxes() : Money {
        return this.taxes;
    }

    public function getTotal() : Money {
        return this.total;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(UserData.USERNAME, this.userName);
        hashMap.put(OrderHistoryData.ORDERDATE, this.orderDate);
        hashMap.put(OrderHistoryData.SHIPPEDDATE, this.shipDate);
        hashMap.put(OrderHistoryData.TRANSDATE, this.transDate);
        hashMap.put(OrderHistoryData.CANCELDATE, this.cancelDate);
        hashMap.put(OrderHistoryData.ORDERDATEFORMATTED, Std.string(new Date(haxe.Int64.ofInt(this.orderDate))));
        hashMap.put(OrderHistoryData.SHIPPEDDATEFORMATTED, Std.string(new Date(haxe.Int64.ofInt(this.shipDate))));
        hashMap.put(OrderHistoryData.TRANSDATEFORMATTED, Std.string(new Date(haxe.Int64.ofInt(this.transDate))));
        hashMap.put(OrderHistoryData.CANCELDATEFORMATTED, Std.string(new Date(haxe.Int64.ofInt(this.cancelDate))));
        hashMap.put(OrderHistoryData.STATUS, this.status);
        hashMap.put(OrderHistoryData.SUBTOTAL, Std.string(this.subTotal));
        hashMap.put(OrderHistoryData.TOTAL, Std.string(this.total));
        hashMap.put(OrderHistoryData.SHIPPINGCOST, Std.string(this.shippingCost));
        hashMap.put(OrderHistoryData.TAX, Std.string(this.taxes));
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMap();
        var keySet : Set = hashMap.keySet();
        var keyArray : haxe.ds.Vector<Any> = keySet.toArray();
        var size : Int = keyArray.length;
        var node : Node = document.createElement(OrderHistoryData.ORDERHISTORY);
        node.appendChild(super.toXmlNode(document));
        var billingAddressNode : Node = document.createElement(BillingAddressData.BILLINGADDRESS);
        billingAddressNode.appendChild(this.billingAddress.toXmlNode(document));
        var shippingAddressNode : Node = document.createElement(ShippingAddressData.SHIPPINGADDRESS);
        shippingAddressNode.appendChild(this.shippingAddress.toXmlNode(document));
        node.appendChild(billingAddressNode);
        node.appendChild(shippingAddressNode);
        node.appendChild(this.payment.toXmlNode(document));
        for (i in 0...size) {
            var name : String = (cast keyArray[i] : String);
            var value : String = (cast hashMap.get(name) : String);
            value = StringUtil.getInstance().getNonNull(value);
            node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
        }
        return node;
    }

    public override function getPaymentMethod() : String {
        return super.getPaymentMethod();
    }

}

