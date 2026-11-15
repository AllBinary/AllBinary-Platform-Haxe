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
package org.allbinary.data.tables.user.quoterequest;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.business.quoterequest.QuoteRequestData;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.quoterequest.QuoteRequest;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class QuoteRequestEntity extends AbSqlBean implements QuoteRequestEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tableName : String = "quoterequest";
    public function new() {
        super(new UserDbInitInfo());
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

    // throws Exception
    public function get(userName : String, id : Int) : QuoteRequest {
        var row : HashMap = StdUtil.getInstance().createHashMap();
        row.put(UserData.USERNAME, userName);
        row.put(QuoteRequestData.getInstance().ID, Std.string(id));
        var quoteRequestHashMap : HashMap = super.getRow(row);
        if (quoteRequestHashMap != null) {
            return new org.allbinary.business.user.quoterequest.QuoteRequest(quoteRequestHashMap);
        } else {
            return null;
        }
    }

    public function getIds(userName : String) : BasicArrayList {
        return super.getColumnWhere(QuoteRequestData.getInstance().ID, UserData.USERNAME, userName);
    }

    public function deleteWhere(key : String, value : String) : Void {
        try {
            super.deleteWhere(key, value);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "deleteWhere");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "deleteWhere", e);
            }
        }
    }

    public function createTableStatement() : String {
        var quoteRequestData : QuoteRequestData = QuoteRequestData.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(tableName).append(this.sqlStrings.START);
        stringBuffer.append(quoteRequestData.ID).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(UserData.USERNAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(quoteRequestData.PROJECT_INFO);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(quoteRequestData.CUSTOMER_COMMENTS);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(quoteRequestData.BUDGET);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(quoteRequestData.TIMEFRAME);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(quoteRequestData.COMMENTS);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().TIMECREATED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().LASTMODIFIED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(this.sqlStrings.PRIMARY_KEY);
        stringBuffer.append(quoteRequestData.ID);
        stringBuffer.append(this.sqlStrings.END);
        return stringBuffer.toString();
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        var result : String = super.dropTable();
        return result;
    }

    public function update(userName : String, updatedValues : HashMap) : Void {
        super.updateWhere(UserData.USERNAME, userName, updatedValues);
    }

}

