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
package org.allbinary.data.tables.user.commerce.inventory.item;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.InventoryDbInitInfo;
import org.allbinary.business.user.commerce.inventory.item.BasicItem;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;

class InventoryEntity extends AbSqlBean implements InventoryEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private final tableName : String = "basicinventory";
    public function new() {
        super(new InventoryDbInitInfo());
        this.setTableName(this.tableName);
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

    public function delete(value : String) : Void {
        try {
            super.deleteWhere(basicItemData.ID, value);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, this.commonStrings.delete);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.delete, e);
            }
        }
    }

    // throws Exception
    public function getItems(storeFrontInterface : StoreFrontInterface) : BasicArrayList {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
            this.logUtil.putF("Getting Items For: " + storeFrontInterface.getName(), this, "getItems");
        }
        var itemVector : BasicArrayList = new BasicArrayListD();
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        var itemHashMapVector : BasicArrayList = super.getRows(keysAndValues);
        var size : Int = itemHashMapVector.size();
        for (i in 0...size) {
            var itemHashMap : HashMap = (cast itemHashMapVector.get(i) : HashMap);
            if (itemHashMap != null) {
                var category : String = (cast itemHashMap.get(basicItemData.CATEGORY) : String);
                if (!StringValidationUtil.getInstance().isEmpty(category) && StringTools.startsWith(category, storeFrontInterface.getCategoryPath())) {
                    itemVector.add(new BasicItem(itemHashMap));
                }
            }
        }
        return itemVector;
    }

    // throws MoneyException
    public function getItem(id : String) : ItemInterface {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(basicItemData.ID, id);
        var itemHashMap : HashMap = super.getRow(keysAndValues);
        if (itemHashMap != null) {
            return new BasicItem(itemHashMap);
        } else {
            return null;
        }
    }

    public function getWeight(id : String) : String {
        return super.getField(basicItemData.ID, id, basicItemData.WEIGHT);
    }

    public function createTableStatement() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.START);
        stringBuffer.append(basicItemData.ID);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.NUMBER);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.INBASKETS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.WEIGHT);
        stringBuffer.append(" VARCHAR(20) NOT NULL,");
        stringBuffer.append(EntryData.getInstance().ENABLE);
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
        stringBuffer.append(EntryData.getInstance().LASTMODIFIED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().TIMECREATED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.PRICE);
        stringBuffer.append(" VARCHAR(20) NOT NULL,");
        stringBuffer.append(basicItemData.COMMENT);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(basicItemData.CUSTOMS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.DOWNLOADS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.GROUPS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.OPTIONS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.PERMISSIONS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(basicItemData.SPECIALS);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(this.sqlStrings.PRIMARY_KEY);
        stringBuffer.append(basicItemData.ID);
        stringBuffer.append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function update(updatedValues : HashMap) : Void {
        super.updateWhere(basicItemData.ID, (cast updatedValues.get(basicItemData.ID) : String), updatedValues);
    }

    public function dropTable() : String {
        return super.dropTable();
    }

    public override function deleteWhere(key : String, value : String) : Void {
        super.deleteWhere(key, value);
    }

}

