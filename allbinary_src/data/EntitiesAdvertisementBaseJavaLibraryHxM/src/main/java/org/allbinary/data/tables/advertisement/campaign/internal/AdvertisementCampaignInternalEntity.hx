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
package org.allbinary.data.tables.advertisement.campaign.internal;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.advertisement.campaign.AdvertisementCampaign;
import org.allbinary.business.advertisement.campaign.AdvertisementCampaignData;
import org.allbinary.business.advertisement.campaign.AdvertisementCampaignInterface;
import org.allbinary.business.advertisement.campaign.AdvertisementCampaigns;
import org.allbinary.business.advertisement.campaign.AdvertisementCampaignsInterface;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.business.time.TimeData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class AdvertisementCampaignInternalEntity extends AbSqlBean implements AdvertisementCampaignInternalEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final tableName : String = "adCampaignInternal";
    public function new() {
        super(new UserDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function delete(value : String) : Void {
        try {
            super.deleteWhere(StoreFrontData.getInstance().NAME, value);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, this.commonStrings.delete);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.delete, e);
            }
        }
    }

    public function getCampaignsInStore(storeName : String) : AdvertisementCampaignsInterface {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(StoreFrontData.getInstance().NAME, storeName);
        var hashMapVector : BasicArrayList = super.getRows(keysAndValues);
        var vector : BasicArrayList = new BasicArrayListD();
        final size : Int = hashMapVector.size();
        for (index in 0...size) {
            var hashMap : HashMap = (cast hashMapVector.get(index) : HashMap);
            if (hashMap != null) {
                vector.add((cast new AdvertisementCampaign(hashMap) : AdvertisementCampaignInterface));
            }
        }
        return (cast new AdvertisementCampaigns(vector) : AdvertisementCampaignsInterface);
    }

    public function get(storeName : String, name : String) : AdvertisementCampaignInterface {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(StoreFrontData.getInstance().NAME, storeName);
        keysAndValues.put(AdvertisementCampaignData.getInstance().NAME, name);
        var hashMap : HashMap = super.getRow(keysAndValues);
        if (hashMap != null) {
            return (cast new AdvertisementCampaign(hashMap) : AdvertisementCampaignInterface);
        } else {
            return null;
        }
    }

    public function update(updatedValues : HashMap) : Void {
        super.updateWhere(EntryData.getInstance().getInstance().ID, (cast updatedValues.get(EntryData.getInstance().getInstance().ID) : String), updatedValues);
    }

    public function createTableStatement() : String {
        var entryData : EntryData = EntryData.getInstance().getInstance();
        var advertisementCampaignData : AdvertisementCampaignData = AdvertisementCampaignData.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.START);
        stringBuffer.append(entryData.ID).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(StoreFrontData.getInstance().NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(advertisementCampaignData.NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(advertisementCampaignData.DESCRIPTION).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(advertisementCampaignData.CONFIG).append(this.sqlTypeStrings.BLOB_NOT_NULL).append(TimeData.getInstance().START).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(TimeData.getInstance().END).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(entryData.TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(entryData.LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(entryData.ID).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        var returnStr : String = super.createTable(this.createTableStatement());
        return returnStr;
    }

    public function dropTable() : String {
        return super.dropTable();
    }

    public override function insert(values : BasicArrayList) : Void {
        super.insert(values);
    }

}

