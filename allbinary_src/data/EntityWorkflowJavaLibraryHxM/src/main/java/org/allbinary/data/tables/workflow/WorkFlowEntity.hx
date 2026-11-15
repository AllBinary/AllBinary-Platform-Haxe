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
package org.allbinary.data.tables.workflow;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.DynamicObjectData;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.control.workflow.DbWorkFlowFactory;
import org.allbinary.logic.control.workflow.WorkFlowData;
import org.allbinary.logic.control.workflow.WorkFlowInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class WorkFlowEntity extends AbSqlBean implements WorkFlowEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    public final tableName : String = "workflows";
    private final METHOD_GET : String = "get()";
    private final METHOD_UPDATE : String = "update";
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

    public function delete(name : String, storeName : String) : Void {
        try {
            final keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
            keysAndValues.put(WorkFlowData.getInstance().NAME, name);
            keysAndValues.put(StoreFrontData.getInstance().NAME, storeName);
            super.deleteWhere(keysAndValues);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, this.commonStrings.delete);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.delete, e);
            }
        }
    }

    // throws Exception, LicensingException
    public function get(name : String, storeName : String) : WorkFlowInterface {
        try {
            final keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
            keysAndValues.put(WorkFlowData.getInstance().NAME, name);
            keysAndValues.put(StoreFrontData.getInstance().NAME, storeName);
            final hashMap : HashMap = super.getRow(keysAndValues);
            return (cast DbWorkFlowFactory.getInstance().getInstance(this.abeClientInformation, hashMap) : WorkFlowInterface);
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, METHOD_GET, e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, METHOD_GET, e);
            }
            throw e;
        }
    }

    public function get(storeName : String) : BasicArrayList {
        try {
            var workFlowsVector : BasicArrayList = new BasicArrayListD();
            var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
            keysAndValues.put(StoreFrontData.getInstance().NAME, storeName);
            var hashMapVector : BasicArrayList = super.getRows(keysAndValues);
            var size : Int = hashMapVector.size();
            for (i in 0...size) {
                var workFlowHashMap : HashMap = (cast hashMapVector.get(i) : HashMap);
                if (workFlowHashMap != null) {
                    workFlowsVector.add(DbWorkFlowFactory.getInstance().getInstance(abeClientInformation, workFlowHashMap));
                }
            }
            return workFlowsVector;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.METHOD_GET, e);
            }
            return null;
        }
    }

    public function update(updatedValues : HashMap) : Void {
        try {
            var wherekeysAndValues : HashMap = StdUtil.getInstance().createHashMap();
            wherekeysAndValues.put(WorkFlowData.getInstance().NAME, (cast updatedValues.get(WorkFlowData.getInstance().NAME) : String));
            wherekeysAndValues.put(StoreFrontData.getInstance().NAME, (cast updatedValues.get(StoreFrontData.getInstance().NAME) : String));
            super.updateWhere(wherekeysAndValues, updatedValues);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, METHOD_UPDATE, e);
            }
        }
    }

    public function createTableStatement() : String {
        final workFlowData : WorkFlowData = WorkFlowData.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(tableName).append(this.sqlStrings.START).append(workFlowData.NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(StoreFrontData.getInstance().NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(DynamicObjectData.NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(workFlowData.DATA).append(this.sqlTypeStrings.BLOB_NOT_NULL).append(EntryData.getInstance().TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(workFlowData.NAME).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

