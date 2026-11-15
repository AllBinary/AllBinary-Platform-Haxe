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
package org.allbinary.data.tables.staticpages;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.init.db.StaticPagesDbInitInfo;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.control.search.SearchData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class StaticPagesEntity extends AbSqlBean implements StaticPagesEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private final TABLENAME : String = "staticpages";
    public function new() {
        super(new StaticPagesDbInitInfo());
        this.setTableName(this.TABLENAME);
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

    public function getFile(store : String, keywords : String) : String {
        var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
        whereHashMap.put(StoreFrontData.getInstance().NAME, store);
        whereHashMap.put(basicItemData.KEYWORDS, keywords);
        var file : String = super.getField(whereHashMap, SearchData.PAGE);
        return file;
    }

    public function delete(keywords : String) : Void {
        super.deleteWhere(basicItemData.KEYWORDS, keywords);
    }

    public function dropTable() : String {
        var returnStr : String = super.dropTable();
        return returnStr;
    }

    public function update(updatedValues : HashMap) : Void {
        super.updateWhere(basicItemData.KEYWORDS, (cast updatedValues.get(basicItemData.KEYWORDS) : String), updatedValues);
    }

    public function createTableStatement() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(TABLENAME).append(this.sqlStrings.START).append(StoreFrontData.getInstance().NAME).append(this.sqlTypeStrings.SIXTY_CHAR_COLUMN_NOT_NULL).append(basicItemData.KEYWORDS).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(SearchData.PAGE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(StoreFrontData.getInstance().NAME).append(CommonSeps.getInstance().COMMA_SEP).append(basicItemData.KEYWORDS).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

}

