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
package org.allbinary.data.tables.user.commerce.inventory.item.downloads;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.InventoryDbInitInfo;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class DownloadItemsEntity extends AbSqlBean implements DownloadItemsEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    public final tableName : String = "downloaditems";
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
            super.deleteWhere(DownloadItemData.ID, value);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, this.commonStrings.delete);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.delete, e);
            }
        }
    }

    public function update(updatedValues : HashMap) : Void {
        super.updateWhere(DownloadItemData.ID, (cast updatedValues.get(DownloadItemData.ID) : String), updatedValues);
    }

    public function getForItem(id : String) : BasicArrayList {
        var returnVector : BasicArrayList = new BasicArrayListD();
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(basicItemData.ID, id);
        var vector : BasicArrayList = super.getRows(keysAndValues);
        final size : Int = vector.size();
        for (index in 0...size) {
            var hashMap : HashMap = (cast vector.get(index) : HashMap);
            returnVector.add(new DownloadableItem(hashMap));
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
            this.logUtil.putF("Found: " + size, this, "getForItem");
        }
        return returnVector;
    }

    public function getForItem(id : String, downloadItemId : String) : BasicArrayList {
        var returnVector : BasicArrayList = new BasicArrayListD();
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(basicItemData.ID, id);
        keysAndValues.put(DownloadItemData.ID, downloadItemId);
        var vector : BasicArrayList = super.getRows(keysAndValues);
        final size : Int = vector.size();
        for (index in 0...size) {
            var hashMap : HashMap = (cast vector.get(index) : HashMap);
            returnVector.add(new DownloadableItem(hashMap));
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
            this.logUtil.putF("Found: " + size, this, "getForItem");
        }
        return returnVector;
    }

    public function createTableStatement() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(tableName).append(this.sqlStrings.START).append(DownloadItemData.ID).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(basicItemData.ID).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().ENABLE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(DownloadItemData.SPECIAL_NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(DownloadItemData.VERSION).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(DownloadItemData.CHANGES).append(this.sqlTypeStrings.BLOB_NOT_NULL).append(DownloadItemData.SYSTEM).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(DownloadItemData.PLATFORM).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(DownloadItemData.LICENSE_FILE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(DownloadItemData.FILE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(DownloadItemData.SIZE).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(DownloadItemData.VALID_TIME).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(DownloadItemData.RETRIES).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(DownloadItemData.ID).append(this.sqlStrings.END);
        return stringBuffer.toString();
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

