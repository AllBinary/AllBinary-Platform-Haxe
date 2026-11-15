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
package org.allbinary.logic.communication.sql;

import org.allbinary.business.installer.Portion;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class AbSqlTableUtil {
    private static final instance : AbSqlTableUtil = new AbSqlTableUtil();
    public static function getInstance() : AbSqlTableUtil {
        return AbSqlTableUtil.instance;
    }

    private final TABLE_LABEL : String = "Table: ";
    public final stringUtil : StringUtil = StringUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    public final sqlStrings : SqlStrings = SqlStrings.getInstance();
    // synchronized
    public function backupTable(abSqlTable : AbSqlTable) : String {
        final tableName : String = abSqlTable.getTableName();
        return this.TABLE_LABEL + tableName + " Backup Failed";
    }

    // synchronized
    public function restoreTable(abSqlTable : AbSqlTable, portion : Portion) : String {
        final tableName : String = abSqlTable.getTableName();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.TABLE_LABEL);
        stringBuffer.append(tableName);
        stringBuffer.append(" Restoration Failed");
        return Std.string(stringBuffer);
    }

    public function new() {
    }
}

