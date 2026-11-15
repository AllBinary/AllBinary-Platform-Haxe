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
package org.allbinary.data.tables.advertisement.areas;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.advertisement.area.AdvertisementArea;
import org.allbinary.business.advertisement.area.AdvertisementAreaData;
import org.allbinary.business.advertisement.area.AdvertisementAreaInterface;
import org.allbinary.business.advertisement.campaign.AdvertisementCampaignData;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class AdvertisementAreasEntity extends AbSqlBean implements AdvertisementAreasEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final tableName : String = "advertisements";
    public function new() {
        super(new UserDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function delete(value : String) : Void {
        try {
            super.deleteWhere(EntryData.getInstance().ID, value);
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
    public function get(storeName : String) : BasicArrayList {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(StoreFrontData.getInstance().NAME, storeName);
        var hashMapVector : BasicArrayList = super.getRows(keysAndValues);
        var vector : BasicArrayList = new BasicArrayListD();
        final size : Int = hashMapVector.size();
        for (index in 0...size) {
            var hashMap : HashMap = (cast hashMapVector.get(index) : HashMap);
            if (hashMap != null) {
                vector.add((cast new AdvertisementArea(hashMap) : AdvertisementAreaInterface));
            }
        }
        return vector;
    }

    // throws Exception
    public function get(storeName : String, advertisementAreaName : String) : AdvertisementAreaInterface {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(StoreFrontData.getInstance().NAME, storeName);
        keysAndValues.put(AdvertisementAreaData.getInstance().NAME, advertisementAreaName);
        var hashMap : HashMap = super.getRow(keysAndValues);
        if (hashMap != null) {
            return (cast new AdvertisementArea(hashMap) : AdvertisementAreaInterface);
        } else {
            return null;
        }
    }

    public function createTableStatement() : String {
        var advertisementAreaData : AdvertisementAreaData = AdvertisementAreaData.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.START);
        stringBuffer.append(advertisementAreaData.NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(StoreFrontData.getInstance().NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(advertisementAreaData.DESCRIPTION).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(advertisementAreaData.CONSTRAINTS).append(this.sqlTypeStrings.BLOB_NOT_NULL).append(AdvertisementCampaignData.getInstance().NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(EntryData.getInstance().TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(advertisementAreaData.NAME).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        var returnStr : String = super.createTable(this.createTableStatement());
        return returnStr;
    }

    public function update(updatedValues : HashMap) : Void {
        super.updateWhere(AdvertisementAreaData.getInstance().NAME, (cast updatedValues.get(AdvertisementAreaData.getInstance().NAME) : String), updatedValues);
    }

    public function dropTable() : String {
        return super.dropTable();
    }

    public override function insert(values : BasicArrayList) : Void {
        super.insert(values);
    }

}

