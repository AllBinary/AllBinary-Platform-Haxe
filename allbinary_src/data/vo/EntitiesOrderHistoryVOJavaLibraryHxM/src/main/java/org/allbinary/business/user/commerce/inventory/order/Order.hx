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

//import java.io.Serializable;
//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class Order implements OrderInterface implements Serializable {
    private final basket : BasketInterface;
    private var paymentMethod : String;
    private var shippingType : String;
    private var storeName : String;
    private var special : String;
    private var id : String;
    private var userComment : String = null;
    private var userCancelComment : String = null;
    private var storeComment : String = null;
    private var storeCancelComment : String = null;
    public function new(basket : BasketInterface) {
        this.basket = basket;
        this.id = null;
        this.shippingType = StringUtil.getInstance().EMPTY_STRING;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(storeName : String, basket : BasketInterface, id : String, shippingType : String, special : String, paymentMethod : String) {
        this.storeName = storeName;
        this.basket = basket;
        this.id = id;
        this.shippingType = shippingType;
        this.special = special;
        this.paymentMethod = paymentMethod;
    }

    public function isIdValid() : Null<Bool> {
        if (this.getId() == null || this.getId().compareTo(StringUtil.getInstance().EMPTY_STRING) == 0 || this.getId().length() > OrderHistoryData.MAXIDLEN || !StringValidationUtil.getInstance().isNumber(this.getId())) {
            return false;
        }
        return true;
    }

    public function isValid() : Null<Bool> {
        return true;
    }

    public function getIdValidationInfo() : String {
        final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
        if (this.getId() == null || this.getId().compareTo(EMPTY_STRING) == 0 || this.getId().length() > OrderHistoryData.MAXIDLEN || !StringValidationUtil.getInstance().isNumber(this.getId())) {
            return "Please enter a valid order Id < " + OrderHistoryData.MAXIDLEN + " digits in length.<br>";
        }
        return EMPTY_STRING;
    }

    public function setShippingMethod(shippingType : String) : Void {
        this.shippingType = shippingType;
    }

    public function setPaymentMethod(value : String) : Void {
        this.paymentMethod = value;
    }

    public function setSpecial(special : String) : Void {
        this.special = special;
    }

    public function setId(value : String) : Void {
        this.id = value;
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
    }

    public function setUserComments(value : String) : Void {
        this.userComment = value;
    }

    public function setUserCancelComments(value : String) : Void {
        this.userCancelComment = value;
    }

    public function setStoreComments(value : String) : Void {
        this.storeComment = value;
    }

    public function setStoreCancelComments(value : String) : Void {
        this.storeCancelComment = value;
    }

    public function getBasket() : BasketInterface {
        return this.basket;
    }

    public function getShippingMethod() : String {
        return this.shippingType;
    }

    public function getPaymentMethod() : String {
        return this.paymentMethod;
    }

    public function getSpecial() : String {
        return this.special;
    }

    public function getId() : String {
        return this.id;
    }

    public function getStoreName() : String {
        return this.storeName;
    }

    public function getUserComments() : String {
        return this.userComment;
    }

    public function getUserCancelComments() : String {
        return this.userCancelComment;
    }

    public function getStoreComments() : String {
        return this.storeComment;
    }

    public function getStoreCancelComments() : String {
        return this.storeCancelComment;
    }

    public function reviewOrder(paymentMethod : String) : String {
        return "Create your own Order.reviewOrder";
    }

    public function viewOrder(paymentMethod : String) : String {
        return "Create your own Order.viewOrder";
    }

    public function emailOrder(userName : String, paymentMethod : String, storeFrontInterface : StoreFrontInterface) : String {
        return "Create your own Order.emailOrder";
    }

    public function toHashMapOrder() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(PaymentData.METHOD, this.paymentMethod);
        hashMap.put(ShippingMethodData.NAME, this.shippingType);
        hashMap.put(StoreFrontData.getInstance().NAME, this.storeName);
        hashMap.put(EntryData.getInstance().SPECIAL, this.special);
        hashMap.put(OrderData.ID, this.id);
        hashMap.put(OrderData.CUSTOMERCOMMENT, this.userComment);
        hashMap.put(OrderData.CUSTOMERCANCELCOMMENT, this.userCancelComment);
        hashMap.put(OrderData.STORECOMMENT, this.storeComment);
        hashMap.put(OrderData.STORECANCELCOMMENT, this.storeCancelComment);
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMapOrder();
        var keySet : Set = hashMap.keySet();
        var keyArray : haxe.ds.Vector<Any> = keySet.toArray();
        var size : Int = keyArray.length;
        var node : Node = document.createElement(OrderData.ORDER);
        for (i in 0...size) {
            var name : String = (cast keyArray[i] : String);
            var value : String = (cast hashMap.get(name) : String);
            value = StringUtil.getInstance().getNonNull(value);
            node.appendChild(ModDomHelper.createNameValueNodes(document, name, value));
        }
        return node;
    }

}

