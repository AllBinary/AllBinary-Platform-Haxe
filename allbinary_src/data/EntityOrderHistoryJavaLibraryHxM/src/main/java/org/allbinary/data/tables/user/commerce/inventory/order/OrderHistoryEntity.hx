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
package org.allbinary.data.tables.user.commerce.inventory.order;

//import java.util.Calendar;
//import java.util.HashMap;
//import java.util.Random;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.HistoryDbInitInfo;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.address.BillingAddressData;
import org.allbinary.business.user.address.ShippingAddressData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.inventory.basket.Basket;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.inventory.order.Order;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.business.user.commerce.money.payment.PaymentInterface;
import org.allbinary.business.user.commerce.money.tax.TaxFactory;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.business.user.commerce.shipping.ShippingMethods;
import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface;
import org.allbinary.data.generator.OrderHistoryIdGenerator;
import org.allbinary.data.tables.TableDataFactory;
import org.allbinary.data.tables.user.address.billing.BillingAddressesEntity;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity;
import org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.control.crypt.SuperCrypt;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class OrderHistoryEntity extends AbSqlBean implements OrderHistoryEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final tableName : String = "orderhistory";
    public function new() {
        super(new HistoryDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function insert(userName : String, order : Order) : Void {
        final vector : BasicArrayList = new BasicArrayListD();
        try {
            final paymentInterface : PaymentInterface = new PaymentEntity().getDefault(userName);
            final billingAddress : StreetAddress = new BillingAddressesEntity(userName).getDefault();
            final shippingAddress : StreetAddress = new ShippingAddressesEntity(userName).getDefault();
            final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
            final storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(order.getStoreName());
            final shippingInterface : ShippingInterface = new ShippingMethods(abeClientInformation, storeFrontInterface).getShippingInterface(order.getShippingMethod());
            final shippingCost : Money = shippingInterface.getCost(order);
            final basketInterface : BasketInterface = order.getBasket();
            final subTotal : Money = basketInterface.getSubTotal();
            final taxRate : Null<Float> = TaxFactory.getInstance().getInstance(abeClientInformation, storeFrontInterface).getTaxRate(shippingAddress, storeFrontInterface);
            final tax : Money = new Money();
            final total : Money = new Money();
            total.add(Std.string(shippingCost));
            total.add(Std.string(subTotal));
            tax.add(Std.string(total));
            tax.multiply(taxRate);
            total.add(Std.string(tax));
            final empty : String = StringUtil.getInstance().EMPTY_STRING;
            vector.add(new OrderHistoryIdGenerator().getNext());
            final ZERO : String = TableDataFactory.getInstance().ZERO_STRING;
            vector.add(order.getId());
            vector.add(userName);
            vector.add(order.getStoreName());
            var calendar : Calendar = Calendar.getInstance();
            var time : String = Std.string(calendar.getTimeInMillis());
            vector.add(ZERO);
            vector.add(time);
            vector.add(ZERO);
            vector.add(ZERO);
            vector.add(OrderHistoryData.PREPROCESSING);
            vector.add(order.getPaymentMethod());
            if (paymentInterface != null) {
                vector.add(paymentInterface.getName());
                vector.add(paymentInterface.getType());
                vector.add(paymentInterface.getExpiration());
                var random : Int = new Random().nextInt(SuperCrypt.KEYMAX);
                vector.add(new SuperCrypt(random).encrypt(paymentInterface.getNumber()));
                vector.add(Std.string(random));
            } else {
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(ZERO);
            }
            if (billingAddress != null) {
                vector.add(billingAddress.getName());
                vector.add(billingAddress.getStreet());
                vector.add(billingAddress.getCity());
                vector.add(billingAddress.getState());
                vector.add(billingAddress.getCode());
                vector.add(billingAddress.getCountry());
            } else {
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
            }
            if (shippingAddress != null) {
                vector.add(shippingAddress.getName());
                vector.add(shippingAddress.getStreet());
                vector.add(shippingAddress.getCity());
                vector.add(shippingAddress.getState());
                vector.add(shippingAddress.getCode());
                vector.add(shippingAddress.getCountry());
            } else {
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
                vector.add(empty);
            }
            vector.add(order.getShippingMethod());
            vector.add(Std.string(subTotal));
            vector.add(Std.string(shippingCost));
            vector.add(Std.string(tax));
            vector.add(Std.string(total));
            vector.add(order.getSpecial());
            vector.add(order.getUserComments());
            vector.add(order.getUserCancelComments());
            vector.add(order.getStoreComments());
            vector.add(order.getStoreCancelComments());
            this.insert(vector);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, INSERT);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put("Command Failed: " + vector, this, INSERT, e);
            }
        }
    }

    public function insert(values : BasicArrayList) : Void {
        try {
            super.insert(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, INSERT);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, INSERT, e);
            }
        }
    }

    public function setStatus(orderId : String, status : String) : Void {
        try {
            var calendar : Calendar = Calendar.getInstance();
            var time : String = Std.string(calendar.getTimeInMillis());
            var updateHashMap : HashMap = StdUtil.getInstance().createHashMap();
            updateHashMap.put(OrderHistoryData.STATUS, status);
            if (Reflect.compare(status, OrderHistoryData.CANCELLED) == 0) {
                updateHashMap.put(OrderHistoryData.CANCELDATE, time);
            } else if (Reflect.compare(status, OrderHistoryData.SHIPPED) == 0) {
                updateHashMap.put(OrderHistoryData.SHIPPEDDATE, time);
            }
            super.updateWhere(OrderData.ID, orderId, updateHashMap);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "setStatus", e);
            }
        }
    }

    public function setPaymentMethod(orderId : String, paymentMethod : String) : Void {
        try {
            var calendar : Calendar = Calendar.getInstance();
            var time : String = Std.string(calendar.getTimeInMillis());
            var updateHashMap : HashMap = StdUtil.getInstance().createHashMap();
            updateHashMap.put(PaymentData.METHOD, paymentMethod);
            updateHashMap.put(OrderHistoryData.TRANSDATE, time);
            super.updateWhere(OrderData.ID, orderId, updateHashMap);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "setPaymentMethod", e);
            }
        }
    }

    // throws Exception
    public function getStoreOrders(storeFrontInterface : StoreFrontInterface) : BasicArrayList {
        var orderReviewVector : BasicArrayList = new BasicArrayListD();
        var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
        whereHashMap.put(StoreFrontData.getInstance().NAME, storeFrontInterface.getName());
        var orderHashMapVector : BasicArrayList = super.getRows(whereHashMap);
        var size : Int = orderHashMapVector.size();
        for (i in 0...size) {
            var orderReviewHashMap : HashMap = (cast orderHashMapVector.get(i) : HashMap);
            var orderReview : OrderHistory = new OrderHistory(new Basket(), orderReviewHashMap);
            orderReviewVector.add(orderReview);
        }
        return orderReviewVector;
    }

    // throws Exception
    public function getOrders(userName : String) : BasicArrayList {
        var orderReviewVector : BasicArrayList = new BasicArrayListD();
        var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
        whereHashMap.put(UserData.USERNAME, userName);
        var orderHashMapVector : BasicArrayList = super.getRows(whereHashMap);
        final size : Int = orderHashMapVector.size();
        for (index in 0...size) {
            var orderReviewHashMap : HashMap = (cast orderHashMapVector.get(index) : HashMap);
            var orderReview : OrderHistory = new OrderHistory(new Basket(), orderReviewHashMap);
            orderReviewVector.add(orderReview);
        }
        return orderReviewVector;
    }

    // throws Exception
    public function getOrders(status : String, fromDate : String, toDate : String) : BasicArrayList {
        var orderReviewVector : BasicArrayList = new BasicArrayListD();
        var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
        whereHashMap.put(OrderHistoryData.STATUS, status);
        var orderHashMapVector : BasicArrayList = super.getRowsWhereBetween(whereHashMap, OrderHistoryData.ORDERDATE, fromDate, toDate);
        final size : Int = orderHashMapVector.size();
        for (index in 0...size) {
            var orderReviewHashMap : HashMap = (cast orderHashMapVector.get(index) : HashMap);
            var orderReview : OrderHistory = new OrderHistory(new Basket(), orderReviewHashMap);
            orderReviewVector.add(orderReview);
        }
        return orderReviewVector;
    }

    // throws Exception
    public function getOrders(fromDate : String, toDate : String) : BasicArrayList {
        var orderReviewVector : BasicArrayList = new BasicArrayListD();
        var orderHashMapVector : BasicArrayList = super.getRowsWhereBetween(OrderHistoryData.ORDERDATE, fromDate, toDate);
        final size : Int = orderHashMapVector.size();
        for (index in 0...size) {
            var orderReviewHashMap : HashMap = (cast orderHashMapVector.get(index) : HashMap);
            var orderReview : OrderHistory = new OrderHistory(new Basket(), orderReviewHashMap);
            orderReviewVector.add(orderReview);
        }
        return orderReviewVector;
    }

    // throws Exception
    public function getOrder(id : String) : OrderHistory {
        var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
        whereHashMap.put(OrderData.ID, id);
        var orderReviewHashMap : HashMap = super.getRow(whereHashMap);
        if (orderReviewHashMap != null) {
            var orderHistory : OrderHistory = new OrderHistory(new Basket(), orderReviewHashMap);
            return orderHistory;
        } else {
            return null;
        }
    }

    public function createTableStatement() : String {
        var entryData : EntryData = EntryData.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("CREATE TABLE ");
        stringBuffer.append(this.tableName);
        stringBuffer.append(" (");
        stringBuffer.append(entryData.ID);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(OrderData.ID);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(UserData.USERNAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(StoreFrontData.getInstance().NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.SHIPPEDDATE);
        stringBuffer.append(" BIGINT(19) UNSIGNED ,");
        stringBuffer.append(OrderHistoryData.ORDERDATE);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(OrderHistoryData.TRANSDATE);
        stringBuffer.append(" BIGINT(19) UNSIGNED ,");
        stringBuffer.append(OrderHistoryData.CANCELDATE);
        stringBuffer.append(" BIGINT(19) UNSIGNED ,");
        stringBuffer.append(OrderHistoryData.STATUS);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentData.METHOD);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentData.NAME);
        stringBuffer.append(" VARCHAR(255) ,");
        stringBuffer.append(PaymentData.TYPE);
        stringBuffer.append(" VARCHAR(255) ,");
        stringBuffer.append(PaymentData.EXPIRATION);
        stringBuffer.append(" VARCHAR(255) ,");
        stringBuffer.append(PaymentData.NUMBER);
        stringBuffer.append(" VARCHAR(255) ,");
        stringBuffer.append(entryData.ENCRYPTION);
        stringBuffer.append(" BIGINT(19) UNSIGNED ,");
        stringBuffer.append(BillingAddressData.NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(BillingAddressData.STREET);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(BillingAddressData.CITY);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(BillingAddressData.STATE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(BillingAddressData.CODE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(BillingAddressData.COUNTRY);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(ShippingAddressData.NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(ShippingAddressData.STREET);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(ShippingAddressData.CITY);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(ShippingAddressData.STATE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(ShippingAddressData.CODE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(ShippingAddressData.COUNTRY);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(ShippingMethodData.NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.SUBTOTAL);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.SHIPPINGCOST);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.TAX);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.TOTAL);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(entryData.SPECIAL);
        stringBuffer.append(" VARCHAR(255) ,");
        stringBuffer.append(OrderData.CUSTOMERCOMMENT);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(OrderData.CUSTOMERCANCELCOMMENT);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(OrderData.STORECOMMENT);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(OrderData.STORECANCELCOMMENT);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append("PRIMARY KEY(");
        stringBuffer.append(entryData.ID);
        stringBuffer.append(") )");
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

    // throws Exception
    public function update(whereHashMap : HashMap, orderHashMap : HashMap) : Void {
        try {
            updateWhere(whereHashMap, orderHashMap);
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

