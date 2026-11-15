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
package org.allbinary.data.tables.transform.info;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.control.crypt.Encoder;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoFactoryInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase;
import org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactoryInterface;

class TransformInfoEntity extends AbSqlBean implements TransformInfoEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final tableName : String = "transforminfo";
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private final transformInfoFactoryInterface : TransformInfoFactoryInterface;
    private final transformInfoObjectConfigAndManipulatorFactoryInterface : TransformInfoObjectConfigAndManipulatorFactoryBase;
    private final transformInfoObjectConfigGeneratorFactoryInterface : TransformInfoObjectConfigGeneratorFactoryInterface;
    public function new(transformInfoObjectConfigGeneratorFactoryInterface : TransformInfoObjectConfigGeneratorFactoryInterface, transformInfoObjectConfigAndManipulatorFactoryInterface : TransformInfoObjectConfigAndManipulatorFactoryBase, transformInfoFactoryInterface : TransformInfoFactoryInterface) {
        super(new UserDbInitInfo());
        this.setTableName(this.tableName);
        this.transformInfoObjectConfigGeneratorFactoryInterface = transformInfoObjectConfigGeneratorFactoryInterface;
        this.transformInfoObjectConfigAndManipulatorFactoryInterface = transformInfoObjectConfigAndManipulatorFactoryInterface;
        this.transformInfoFactoryInterface = transformInfoFactoryInterface;
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
            super.deleteWhere(TransformInfoData.getInstance().NAME, value);
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
    public function get(name : String, propertiesHashMap : HashMap, pageContext : PageContext) : TransformInfoInterface {
        var transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(transformInfoData.NAME, name);
        var hashMap : HashMap = super.getRow(keysAndValues);
        if (hashMap != null) {
            var anyType : Any = hashMap.get(transformInfoData.OBJECTCONFIG);
            if (anyType != null) {
                var string : String = (cast anyType : String);
                hashMap.put(transformInfoData.OBJECTCONFIG, Encoder.decode(string));
            }
            var objectData : Any = hashMap.get(transformInfoData.DATA);
            if (objectData != null) {
                var string : String = (cast objectData : String);
                hashMap.put(transformInfoData.DATA, Encoder.decode(string));
            }
            return this.transformInfoFactoryInterface.getInstance(hashMap, propertiesHashMap, pageContext);
        } else {
            return null;
        }
    }

    // throws Exception
    public function getObjectConfigs(storeName : String) : BasicArrayList {
        var objectConfigVector : BasicArrayList = new BasicArrayListD();
        var objectConfigColumnVector : BasicArrayList = this.getColumnWhere(TransformInfoData.getInstance().OBJECTCONFIG, StoreFrontData.getInstance().NAME, storeName);
        var size : Int = objectConfigColumnVector.size();
        for (i in 0...size) {
            var objectConfigString : String = (cast objectConfigColumnVector.get(i) : String);
            objectConfigString = Encoder.decode(objectConfigString);
            objectConfigVector.add(this.transformInfoObjectConfigAndManipulatorFactoryInterface.getInstance(this.abeClientInformation, (cast this : TransformInfoInterface), DomDocumentHelper.create(objectConfigString)));
        }
        return objectConfigVector;
    }

    // throws Exception
    public function getNames(storeName : String) : BasicArrayList {
        var viewNameVector : BasicArrayList = new BasicArrayListD();
        var columnVector : BasicArrayList = this.getColumnWhere(TransformInfoData.getInstance().NAME, StoreFrontData.getInstance().NAME, storeName);
        var size : Int = columnVector.size();
        for (i in 0...size) {
            var viewNameString : String = (cast columnVector.get(i) : String);
            viewNameVector.add(viewNameString);
        }
        return viewNameVector;
    }

    public function createTableStatement() : String {
        var transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.START);
        stringBuffer.append(transformInfoData.NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(StoreFrontData.getInstance().NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(transformInfoData.OBJECTFILENAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(transformInfoData.OBJECT);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(transformInfoData.OBJECTCONFIGFILENAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(transformInfoData.OBJECTCONFIG);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(transformInfoData.TEMPLATEFILENAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(transformInfoData.TEMPLATE);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(transformInfoData.DATAFILENAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(transformInfoData.DATA);
        stringBuffer.append(this.sqlTypeStrings.BLOB_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().LASTMODIFIED);
        stringBuffer.append(EntryData.getInstance().TIMECREATED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(this.sqlStrings.PRIMARY_KEY);
        stringBuffer.append(transformInfoData.NAME);
        stringBuffer.append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function update(updatedValues : HashMap) : Void {
        super.updateWhere(TransformInfoData.getInstance().NAME, (cast updatedValues.get(TransformInfoData.getInstance().NAME) : String), updatedValues);
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

