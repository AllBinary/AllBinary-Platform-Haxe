/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
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
package org.allbinary.data.tables.generator;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class IdGeneratorEntity extends AbSqlBean implements IdGeneratorEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tableName : String = "idgenerator";
    private final tableData : String;
    public final NAME : String = "NAME";
    public final VALUE : String = "VALUE";
    public function new() {
        super(new UserDbInitInfo());
        this.tableData = new StringMaker().append(this.sqlStrings.CREATE_TABLE).append(tableName).append(this.sqlStrings.START).append(NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(VALUE).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(NAME).append(this.sqlStrings.END).toString();
        super.setTableName(this.tableName);
    }

    // throws Exception
    public function get(name : String) : Null<haxe.Int64> {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(this.NAME, name);
        var hashMap : HashMap = super.getRow(keysAndValues);
        if (((cast hashMap.get(this.NAME) : String)).compareTo(name) != 0) {
            throw new haxe.Exception("results do not match");
        }
        var value : String = (cast hashMap.get(this.VALUE) : String);
        return haxe.Int64.parseString(value);
    }

    public function insert(values : BasicArrayList) : Void {
        try {
            super.insert(values);
            this.logUtil.putF(this.commonStrings.SUCCESS, this, INSERT);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.FAILURE, this, INSERT, e);
        }
    }

    public function delete(value : String) : Void {
        try {
            super.deleteWhere(this.NAME, value);
            this.logUtil.putF(this.commonStrings.SUCCESS, this, this.commonStrings.delete);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.delete, e);
        }
    }

    public function update(name : String, value : Null<haxe.Int64>) : Void {
        final map : HashMap = StdUtil.getInstance().createHashMap();
        map.put(this.NAME, name);
        map.put(this.VALUE, value);
        this.update(map);
    }

    public function update(hashMap : HashMap) : Void {
        super.updateWhere(this.NAME, (cast hashMap.get(this.NAME) : String), hashMap);
    }

    public function createTable() : String {
        var returnStr : String = super.createTable(tableData);
        return returnStr;
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

