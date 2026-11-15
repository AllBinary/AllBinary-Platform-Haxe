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
package org.allbinary.logic.visual.transform.info;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.Encoder;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.OutputTypeData;
import org.allbinary.logic.io.path.AbFilePath;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.logic.visual.transform.info.data.TransformInfoDataData;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface;
import org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData;
import org.allbinary.logic.visual.transform.info.viewObject.TransformInfoObjectData;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;

class TransformInfo implements TransformInfoInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var isChild : Bool = false;
    private var name : String = null;
    private var storeName : String = null;
    private var objectFileName : String = null;
    private var anyType : Any = null;
    private var objectConfigFileName : String = null;
    private var objectConfigInterface : TransformInfoObjectConfigInterface = null;
    private var template : String = null;
    private var templateFileName : String = null;
    private var dataFileName : String = null;
    private var data : String = StringUtil.getInstance().EMPTY_STRING;
    public function new() {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String) {
        this.setName(name);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String, objectFileName : String, objectConfigFileName : String, templateFileName : String, dataFileName : String) {
        this.setName(name);
        this.setObjectFile(objectFileName);
        this.setObjectConfigFile(objectConfigFileName);
        this.setTemplateFile(templateFileName);
        this.setDataFile(dataFileName);
    }

    // throws Exception
    public function override_(hashMap : HashMap) : Void {
        var transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        var aName : String = (cast hashMap.get(transformInfoData.NAME) : String);
        if (!stringValidationUtil.isEmpty(aName)) {
            this.name = aName;
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("TransformInfo properties overridden for: ");
            stringBuffer.append(this.getName());
            stringBuffer.append("\n properties: ");
            stringBuffer.append(hashMap.toString());
            this.logUtil.putF(stringBuffer.toString(), this, "override(HashMap hashMap)");
        }
        var aStoreName : String = (cast hashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (!stringValidationUtil.isEmpty(aStoreName)) {
            this.storeName = aStoreName;
        }
        var aObjectFileName : String = (cast hashMap.get(transformInfoData.OBJECTFILENAME) : String);
        if (!stringValidationUtil.isEmpty(aObjectFileName)) {
            this.objectFileName = aObjectFileName;
        }
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getMainPath());
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
        stringBuffer.append(this.storeName);
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        var fileAbPath : AbPath = new AbPath(stringBuffer.toString(), StringUtil.getInstance().EMPTY_STRING);
        var aObject : String = (cast hashMap.get(transformInfoData.OBJECT) : String);
        if (!stringValidationUtil.isEmpty(aObject)) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("TransformInfo override view Object for: " + this.getName(), this, "override(HashMap hashMap)");
            }
            var fileDataString : String = new CryptFileReader(TransformInfoObjectData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectData.getInstance().ENCRYPTED_EXTENSION).get(new AbPath(fileAbPath.toString(), aObject));
            if (fileDataString != null) {
                this.anyType = fileDataString;
            }
        }
        if (!stringValidationUtil.isEmpty((cast hashMap.get(transformInfoData.OBJECTCONFIG) : String))) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("TransformInfo override ObjectConfig for: " + this.getName(), this, "override(HashMap hashMap)");
            }
            this.setObjectConfig((cast hashMap.get(transformInfoData.OBJECTCONFIG) : String));
        }
        var objectConfigFileName : String = (cast hashMap.get(transformInfoData.OBJECTCONFIGFILENAME) : String);
        if (!stringValidationUtil.isEmpty(objectConfigFileName)) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("TransformInfo override ObjectConfig File for: " + this.getName(), this, "override(HashMap hashMap)");
            }
            this.setObjectConfigFile(objectConfigFileName);
        }
        var type : String = (cast hashMap.get(OutputTypeData.getInstance().NAME) : String);
        if (!stringValidationUtil.isEmpty(type)) {
            if (this.getObjectConfigInterface() == null) {
                this.setObjectConfigInterface(new TransformInfoObjectConfig(this));
            }
            this.getObjectConfigInterface().setOutputTypeName(type);
        }
        var aTemplateFileName : String = (cast hashMap.get(transformInfoData.TEMPLATEFILENAME) : String);
        if (!stringValidationUtil.isEmpty(aTemplateFileName)) {
            this.templateFileName = aTemplateFileName;
        }
        var aTemplate : String = (cast hashMap.get(transformInfoData.TEMPLATE) : String);
        if (!stringValidationUtil.isEmpty(aTemplate)) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("TransformInfo override Template for: " + this.getName(), this, "override(HashMap hashMap)");
            }
            var fileDataString : String = new CryptFileReader(TransformInfoTemplateData.getInstance().UNCRYPTED_EXTENSION, TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION).get(new AbPath(fileAbPath.toString(), aTemplate));
            if (!stringValidationUtil.isEmpty(fileDataString)) {
                this.template = fileDataString;
            }
        }
        var aDataFileName : String = (cast hashMap.get(transformInfoData.DATAFILENAME) : String);
        if (!stringValidationUtil.isEmpty(aDataFileName)) {
            this.dataFileName = aDataFileName;
        }
        var aData : String = (cast hashMap.get(transformInfoData.DATA) : String);
        if (!stringValidationUtil.isEmpty(aData)) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("TransformInfo override Data for: " + this.getName(), this, "override(HashMap hashMap)");
            }
            var fileDataString : String = new CryptFileReader(TransformInfoDataData.getInstance().UNCRYPTED_EXTENSION, TransformInfoDataData.getInstance().ENCRYPTED_EXTENSION).get(new AbPath(fileAbPath.toString(), aData));
            if (!stringValidationUtil.isEmpty(fileDataString)) {
                this.data = fileDataString;
            }
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            stringBuffer = new StringMaker();
            stringBuffer.append("Name: ");
            stringBuffer.append(aName);
            stringBuffer.append("\nTemp Object File: ");
            stringBuffer.append(aObject);
            stringBuffer.append("\nTemp Object Config File: ");
            stringBuffer.append(this.getObjectConfigFilePath().toString());
            stringBuffer.append("\nTemp Template File: ");
            stringBuffer.append(aTemplate);
            stringBuffer.append("\nTemp Data File: ");
            stringBuffer.append(aData);
            stringBuffer.append("\nStore Name: ");
            stringBuffer.append(aStoreName);
            stringBuffer.append("\nObjectFile: ");
            stringBuffer.append(this.getObjectFile());
            stringBuffer.append("->TransformInfo");
            this.logUtil.putF(stringBuffer.toString(), this, "TransformInfoInterface(HashMap)");
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
            this.logUtil.putF(this.log(), this, "override");
        }
    }

    public function log() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Name: ");
        stringBuffer.append(this.name);
        stringBuffer.append("\nObject File: ");
        stringBuffer.append(this.objectFileName);
        stringBuffer.append("\nObject Config File Path: ");
        stringBuffer.append(this.getObjectConfigFile());
        stringBuffer.append("\nTemplate File: ");
        stringBuffer.append(this.templateFileName);
        stringBuffer.append("\nData File: ");
        stringBuffer.append(this.dataFileName);
        stringBuffer.append("\nStore Name: ");
        stringBuffer.append(this.storeName);
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append(this.getObjectFile());
        stringBuffer.append("->TransformInfo");
        stringBuffer.append("TransformInfoInterface(HashMap)");
        return stringBuffer.toString();
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
    }

    public function getStoreName() : String {
        return this.storeName;
    }

    public function setObject(anyType : Any) : Void {
        this.anyType = anyType;
    }

    public function setObjectFile(value : String) : Void {
        this.objectFileName = value;
    }

    public function setTemplate(value : String) : Void {
        this.template = value;
    }

    public function setTemplateFile(value : String) : Void {
        this.templateFileName = value;
    }

    // throws Exception
    public function setObjectConfigFileName(value : String) : Void {
        this.objectConfigFileName = value;
    }

    // throws Exception
    public function setObjectConfigFile(value : String) : Void {
        this.objectConfigFileName = value;
        this.setObjectConfigInterface(TransformInfoObjectConfigAndManipulatorFactory.getInstance().getInstance(this.abeClientInformation, this, this.getObjectConfigFilePath()));
    }

    // throws Exception
    public function setObjectConfig(value : String) : Void {
        var document : Document = DomDocumentHelper.create(value);
        this.setObjectConfigInterface(TransformInfoObjectConfigAndManipulatorFactory.getInstance().getInstance(this.abeClientInformation, this, document));
    }

    public function setDataFile(value : String) : Void {
        this.dataFileName = value;
    }

    public function setData(value : String) : Void {
        this.data = value;
    }

    public function getName() : String {
        return this.name;
    }

    public function getObject() : Any {
        return this.anyType;
    }

    public function getObjectFile() : String {
        return this.objectFileName;
    }

    public function getTemplate() : String {
        return this.template;
    }

    public function getTemplateFile() : String {
        return this.templateFileName;
    }

    // throws Exception
    public function getTemplateFilePath() : AbPath {
        return new AbFilePath(this.getTemplateFile());
    }

    // throws Exception
    public function getObjectConfigFilePath() : AbPath {
        return new AbFilePath(this.getObjectConfigFile());
    }

    // throws Exception
    public function getDataFilePath() : AbPath {
        return new AbFilePath(this.getDataFile());
    }

    public function getObjectConfigFile() : String {
        return this.objectConfigFileName;
    }

    private function getData() : String {
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        var dataFileString : String = this.getDataFile();
        if (!stringValidationUtil.isEmpty(dataFileString)) {
            try {
                var fileData : String = new CryptFileReader(TransformInfoDataData.getInstance().UNCRYPTED_EXTENSION, TransformInfoDataData.getInstance().ENCRYPTED_EXTENSION).get(this.getDataFilePath());
                if (!stringValidationUtil.isEmpty(this.data)) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        this.logUtil.putF("Data File overriding existing data: " + this.getDataFilePath(), this, "getData()");
                    }
                }
                this.data = fileData;
            } catch (e : haxe.Exception) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                    this.logUtil.put("Could Not Load Data from: " + this.getDataFile(), this, "getData()", e);
                }
            }
        }
        try {
            if (!stringValidationUtil.isEmpty(this.data)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                    this.logUtil.putF("Data: " + XmlDocumentHelper.toString(DomDocumentHelper.create(data)), this, "getData()");
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("Name: ");
                    stringBuffer.append(this.name);
                    stringBuffer.append("\nEmpty Data For: ");
                    stringBuffer.append(dataFileString);
                    stringBuffer.append("\nPath: ");
                    stringBuffer.append(this.getDataFilePath().toFileSystemString());
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                        this.logUtil.putF(stringBuffer.toString(), this, "getData()");
                    }
                }
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Could Not Preview Data: " + this.data, this, "getData()", e);
            }
        }
        return this.data;
    }

    // throws Exception
    public function getDataDocument() : Document {
        var localData : String = this.getData();
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (stringValidationUtil.isEmpty(localData)) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.putF("No Data So Creating New Document", this, "getDataDocument()");
            }
            return DomDocumentHelper.create();
        } else {
            var document : Document = DomDocumentHelper.create(localData);
            return document;
        }
    }

    public function getDataFile() : String {
        return this.dataFileName;
    }

    public function toHashMap() : HashMap {
        var transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(transformInfoData.NAME, this.name);
        hashMap.put(StoreFrontData.getInstance().NAME, this.storeName);
        hashMap.put(transformInfoData.OBJECTFILENAME, this.objectFileName);
        hashMap.put(transformInfoData.OBJECT, this.anyType);
        hashMap.put(transformInfoData.OBJECTCONFIGFILENAME, this.getObjectConfigFile());
        hashMap.put(transformInfoData.OBJECTCONFIG, Encoder.encode(haxe.io.Bytes.ofString(this.getObjectConfigInterface().toString())));
        hashMap.put(transformInfoData.TEMPLATEFILENAME, this.templateFileName);
        hashMap.put(transformInfoData.TEMPLATE, this.template);
        hashMap.put(transformInfoData.DATAFILENAME, this.dataFileName);
        hashMap.put(transformInfoData.DATA, Encoder.encode(haxe.io.Bytes.ofString(this.data)));
        var calendar : Calendar = Calendar.getInstance();
        var time : String = calendar.getTimeInMillis().toString();
        hashMap.put(EntryData.getInstance().LASTMODIFIED, time);
        return hashMap;
    }

    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        vector.add(this.name);
        vector.add(this.storeName);
        vector.add(this.objectFileName);
        vector.add(this.anyType);
        vector.add(this.getObjectConfigFile());
        vector.add(Encoder.encode(haxe.io.Bytes.ofString(this.getObjectConfigInterface().toString())));
        vector.add(this.templateFileName);
        vector.add(this.template);
        vector.add(this.dataFileName);
        vector.add(Encoder.encode(haxe.io.Bytes.ofString(this.data)));
        var calendar : Calendar = Calendar.getInstance();
        var time : String = calendar.getTimeInMillis().toString();
        vector.add(time);
        vector.add(time);
        return vector;
    }

    public function getKey() : Any {
        return (cast this.getName() : Any);
    }

    public function setChild() : Void {
        this.isChild = true;
    }

    public function isChild() : Bool {
        return this.isChild;
    }

    public function getObjectConfigInterface() : TransformInfoObjectConfigInterface {
        return this.objectConfigInterface;
    }

    public function setObjectConfigInterface(objectConfigInterface : TransformInfoObjectConfigInterface) : Void {
        this.objectConfigInterface = objectConfigInterface;
    }

}

