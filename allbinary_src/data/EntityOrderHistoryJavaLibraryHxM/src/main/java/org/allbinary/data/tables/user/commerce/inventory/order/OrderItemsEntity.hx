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

//import java.util.HashMap;
//import java.util.ListIterator;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.HistoryDbInitInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.address.ShippingAddressData;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.inventory.basket.BasketReview;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.Item;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.data.generator.OrderItemIdGenerator;
import org.allbinary.data.tables.TableDataFactory;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class OrderItemsEntity extends AbSqlBean implements OrderItemsEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    public final tableName : String = "orderitems";
    public function new() {
        super(new HistoryDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function insert(userName : String, order : OrderInterface) : Void {
        var vector : BasicArrayList = new BasicArrayListD();
        try {
            var basket : BasketInterface = order.getBasket();
            var items : Set = basket.getIds();
            final ZERO_STRING : String = TableDataFactory.getInstance().ZERO_STRING;
            final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
            var inventoryEntity : InventoryEntity = InventoryEntityFactory.getInstance().getInventoryEntityInstance();
            var itemsArray : haxe.ds.Vector<Any> = items.toArray();
            var itemsSize : Int = itemsArray.length;
            for (i in 0...itemsSize) {
                var item : String = (cast itemsArray[i] : String);
                var itemInterface : ItemInterface = inventoryEntity.getItem(item);
                vector = new BasicArrayListD();
                vector.add(new OrderItemIdGenerator().getNext());
                vector.add(order.getId());
                vector.add(TableDataFactory.getInstance().INTEGER_MAX_VALUE_STRING);
                vector.add(userName);
                vector.add(order.getStoreName());
                vector.add(itemInterface.getId());
                vector.add(basket.getNumberOf(item).toString());
                vector.add(itemInterface.getNewOrUsed());
                vector.add(itemInterface.getSummary());
                vector.add(itemInterface.getDistributor());
                vector.add(itemInterface.getIdUsedByDistributor());
                vector.add(itemInterface.getProducedBy());
                vector.add(itemInterface.getProductionDate());
                vector.add(itemInterface.getStartProductionDate());
                vector.add(itemInterface.getDescription());
                vector.add(itemInterface.getKeywords());
                vector.add(itemInterface.getCategory());
                vector.add(itemInterface.getType());
                vector.add(itemInterface.getSmallImage());
                vector.add(itemInterface.getMediumImage());
                vector.add(itemInterface.getLargeImage());
                vector.add(itemInterface.getWeight());
                vector.add(itemInterface.getPrice().toString());
                vector.add(itemInterface.getComment());
                vector.add(itemInterface.getCustoms());
                vector.add(itemInterface.getDownloads());
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(EMPTY_STRING);
                vector.add(ZERO_STRING);
                vector.add(ZERO_STRING);
                vector.add(ZERO_STRING);
                vector.add(ZERO_STRING);
                this.insert(vector);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF("Command Success Added: " + items.size(), this, INSERT);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put("Command Failed: " + vector.toString(), this, INSERT, e);
            }
        }
    }

    public function setStatus(orderId : String, groupId : String, status : String) : Void {
        try {
            var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
            var updateHashMap : HashMap = StdUtil.getInstance().createHashMap();
            whereHashMap.put(OrderData.ID, orderId);
            whereHashMap.put(ShippingMethodData.GROUP, groupId);
            updateHashMap.put(OrderHistoryData.STATUS, status);
            super.updateWhere(whereHashMap, updateHashMap);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "setStatus", e);
            }
        }
    }

    public function isEverythingShipped(orderId : String) : Bool {
        try {
            final itemStatusVector : BasicArrayList = super.getColumnWhere(OrderHistoryData.STATUS, OrderData.ID, orderId);
            final size : Int = itemStatusVector.size();
            for (index in 0...size) {
                var status : String = (cast itemStatusVector.get(index) : String);
                if (Reflect.compare(status, OrderHistoryData.SHIPPED) != 0) {
                    return false;
                }
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "isEverythingShipped", e);
            }
            return false;
        }
    }

    public function getBasketReview(orderId : String) : BasketReview {
        try {
            var basketReview : BasketReview = new BasketReview();
            var keyValues : HashMap = StdUtil.getInstance().createHashMap();
            keyValues.put(OrderData.ID, orderId);
            var items : BasicArrayList = super.getRows(keyValues);
            var entryData : EntryData = EntryData.getInstance();
            if (items != null && items.size() > 0) {
                final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
                var itemsArray : haxe.ds.Vector<Any> = items.toArray();
                var itemsSize : Int = itemsArray.length;
                for (i in 0...itemsSize) {
                    var itemHashMap : HashMap = (cast itemsArray[i] : HashMap);
                    itemHashMap.put(basicItemData.INBASKETS, EMPTY_STRING);
                    itemHashMap.put(entryData.ENABLE, EMPTY_STRING);
                    itemHashMap.put(entryData.TIMECREATED, EMPTY_STRING);
                    itemHashMap.put(entryData.LASTMODIFIED, EMPTY_STRING);
                    itemHashMap.put(basicItemData.GROUPS, EMPTY_STRING);
                    itemHashMap.put(basicItemData.OPTIONS, EMPTY_STRING);
                    itemHashMap.put(basicItemData.PERMISSIONS, EMPTY_STRING);
                    itemHashMap.put(basicItemData.SPECIALS, EMPTY_STRING);
                    var item : Item = new Item(itemHashMap);
                    basketReview.addItem(item);
                }
                return basketReview;
            } else {
                return null;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "getBasketReview", e);
            }
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
        stringBuffer.append(ShippingMethodData.GROUP);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(UserData.USERNAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(StoreFrontData.getInstance().NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.ID);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.NUMBER);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.NEWORUSED);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.SUMMARY);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.DISTRIBUTOR);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.IDUSEDBYDISTRIBUTOR);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.PRODUCEDBY);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.PRODUCTIONDATE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.STARTPRODUCTIONDATE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.DESCRIPTION);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(basicItemData.KEYWORDS);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.CATEGORY);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.TYPE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.SMALLIMAGE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.MEDIUMIMAGE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.LARGEIMAGE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.WEIGHT);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(basicItemData.PRICE);
        stringBuffer.append(" VARCHAR(20) NOT NULL,");
        stringBuffer.append(basicItemData.COMMENT);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(basicItemData.CUSTOMS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.DOWNLOADS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(ShippingMethodData.COST);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.TAX);
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
        stringBuffer.append(entryData.SPECIAL);
        stringBuffer.append(" VARCHAR(255) ,");
        stringBuffer.append(OrderHistoryData.STATUS);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.CANCELINFO);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.CANCELTYPE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(OrderHistoryData.SHIPPEDDATE);
        stringBuffer.append(" BIGINT(19) UNSIGNED ,");
        stringBuffer.append(OrderHistoryData.ORDERDATE);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(OrderHistoryData.TRANSDATE);
        stringBuffer.append(" BIGINT(19) UNSIGNED ,");
        stringBuffer.append(OrderHistoryData.CANCELDATE);
        stringBuffer.append(" BIGINT(19) UNSIGNED ,");
        stringBuffer.append("PRIMARY KEY(");
        stringBuffer.append(entryData.ID);
        stringBuffer.append(") )");
        return stringBuffer.toString();
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

