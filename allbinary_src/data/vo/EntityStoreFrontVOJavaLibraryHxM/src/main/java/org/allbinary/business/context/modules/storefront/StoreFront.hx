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
package org.allbinary.business.context.modules.storefront;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.context.configuration.ContextConfiguration;
import org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping;
import org.allbinary.business.context.configuration.ContextConfigurationInterface;
import org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.UserData;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.io.path.AbPathUtil;
import org.allbinary.logic.string.SpecialCharacterUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.apache.commons.lang3.StringEscapeUtils;
import org.w3c.dom.Document;

class StoreFront implements StoreFrontInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final directory : Directory = Directory.getInstance();
    private final stringUtil : StringUtil = StringUtil.getInstance();
    private final abPathUtil : AbPathUtil = AbPathUtil.getInstance();
    private var name : String;
    private var basketName : String;
    private var homeHostName : String;
    private var homeHostNamePath : AbPath;
    private var hostName : String;
    private var hostNamePath : AbPath;
    private var testHomeHostName : String;
    private var testHomeHostNamePath : AbPath;
    private var testHostName : String;
    private var testHostNamePath : AbPath;
    private var imagePath : AbPath;
    private var staticPath : AbPath;
    private var categoryPath : AbPath;
    private var inventoryControl : String;
    private var contextConfigurationInterface : ContextConfigurationInterface;
    private var subStores : String;
    private var tagLocation : String;
    private var packageLocation : String;
    private var ftp : String;
    private var ftpPath : AbPath;
    private var ftpUserName : String;
    private var ftpPassword : String;
    private var testFtp : String;
    private var testFtpPath : AbPath;
    private var testFtpUserName : String;
    private var testFtpPassword : String;
    private var timeCreated : String;
    private var lastModified : String;
    private final MINCHAR : Int = 0;
    private final MINSTORENAMELENGTH : Int = 1;
    private final MAXCHAR : Int = 255;
    private static final RESOURCES : String = " Resources" + AbPathData.getInstance().SEPARATOR;
    private final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
    private final ONE_EMPTY_STRING_ARRAY : haxe.ds.Vector<String> = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY;
    public function new() {
        this.name = this.stringUtil.EMPTY_STRING;
        this.basketName = this.stringUtil.EMPTY_STRING;
        this.homeHostName = this.stringUtil.EMPTY_STRING;
        this.homeHostNamePath = this.abPathUtil.NO_ABPATH;
        this.hostName = this.stringUtil.EMPTY_STRING;
        this.hostNamePath = this.abPathUtil.NO_ABPATH;
        this.testHomeHostName = this.stringUtil.EMPTY_STRING;
        this.testHomeHostNamePath = this.abPathUtil.NO_ABPATH;
        this.testHostName = this.stringUtil.EMPTY_STRING;
        this.testHostNamePath = this.abPathUtil.NO_ABPATH;
        this.imagePath = this.abPathUtil.NO_ABPATH;
        this.staticPath = this.abPathUtil.NO_ABPATH;
        this.categoryPath = this.abPathUtil.NO_ABPATH;
        this.inventoryControl = this.stringUtil.EMPTY_STRING;
        this.subStores = this.stringUtil.EMPTY_STRING;
        this.tagLocation = this.stringUtil.EMPTY_STRING;
        this.packageLocation = this.stringUtil.EMPTY_STRING;
        this.ftp = this.stringUtil.EMPTY_STRING;
        this.ftpPath = this.abPathUtil.NO_ABPATH;
        this.ftpUserName = this.stringUtil.EMPTY_STRING;
        this.ftpPassword = this.stringUtil.EMPTY_STRING;
        this.testFtp = this.stringUtil.EMPTY_STRING;
        this.testFtpPath = this.abPathUtil.NO_ABPATH;
        this.testFtpUserName = this.stringUtil.EMPTY_STRING;
        this.testFtpPassword = this.stringUtil.EMPTY_STRING;
        this.timeCreated = this.stringUtil.EMPTY_STRING;
        this.lastModified = this.stringUtil.EMPTY_STRING;
        this.contextConfigurationInterface = new ContextConfiguration();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(request : HttpServletRequest) {
        this.name = this.stringUtil.EMPTY_STRING;
        this.basketName = this.stringUtil.EMPTY_STRING;
        this.homeHostName = this.stringUtil.EMPTY_STRING;
        this.homeHostNamePath = this.abPathUtil.NO_ABPATH;
        this.hostName = this.stringUtil.EMPTY_STRING;
        this.hostNamePath = this.abPathUtil.NO_ABPATH;
        this.testHomeHostName = this.stringUtil.EMPTY_STRING;
        this.testHomeHostNamePath = this.abPathUtil.NO_ABPATH;
        this.testHostName = this.stringUtil.EMPTY_STRING;
        this.testHostNamePath = this.abPathUtil.NO_ABPATH;
        this.imagePath = this.abPathUtil.NO_ABPATH;
        this.staticPath = this.abPathUtil.NO_ABPATH;
        this.categoryPath = this.abPathUtil.NO_ABPATH;
        this.inventoryControl = this.stringUtil.EMPTY_STRING;
        this.subStores = this.stringUtil.EMPTY_STRING;
        this.tagLocation = this.stringUtil.EMPTY_STRING;
        this.packageLocation = this.stringUtil.EMPTY_STRING;
        this.ftp = this.stringUtil.EMPTY_STRING;
        this.ftpPath = this.abPathUtil.NO_ABPATH;
        this.ftpUserName = this.stringUtil.EMPTY_STRING;
        this.ftpPassword = this.stringUtil.EMPTY_STRING;
        this.testFtp = this.stringUtil.EMPTY_STRING;
        this.testFtpPath = this.abPathUtil.NO_ABPATH;
        this.testFtpUserName = this.stringUtil.EMPTY_STRING;
        this.testFtpPassword = this.stringUtil.EMPTY_STRING;
        this.timeCreated = this.stringUtil.EMPTY_STRING;
        this.lastModified = this.stringUtil.EMPTY_STRING;
        this.getFormData(new RequestParams(request).toHashMap());
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF("TWB- needs update for adding and updating context configuration - currently defaults to admin context config", this, "StoreFront");
        }
        this.setContextConfigurationInterface(ContextConfigurationInterfaceFactory.getInstance().getInstance("Admin"));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.name = this.stringUtil.EMPTY_STRING;
        this.basketName = this.stringUtil.EMPTY_STRING;
        this.homeHostName = this.stringUtil.EMPTY_STRING;
        this.homeHostNamePath = this.abPathUtil.NO_ABPATH;
        this.hostName = this.stringUtil.EMPTY_STRING;
        this.hostNamePath = this.abPathUtil.NO_ABPATH;
        this.testHomeHostName = this.stringUtil.EMPTY_STRING;
        this.testHomeHostNamePath = this.abPathUtil.NO_ABPATH;
        this.testHostName = this.stringUtil.EMPTY_STRING;
        this.testHostNamePath = this.abPathUtil.NO_ABPATH;
        this.imagePath = this.abPathUtil.NO_ABPATH;
        this.staticPath = this.abPathUtil.NO_ABPATH;
        this.categoryPath = this.abPathUtil.NO_ABPATH;
        this.inventoryControl = this.stringUtil.EMPTY_STRING;
        this.subStores = this.stringUtil.EMPTY_STRING;
        this.tagLocation = this.stringUtil.EMPTY_STRING;
        this.packageLocation = this.stringUtil.EMPTY_STRING;
        this.ftp = this.stringUtil.EMPTY_STRING;
        this.ftpPath = this.abPathUtil.NO_ABPATH;
        this.ftpUserName = this.stringUtil.EMPTY_STRING;
        this.ftpPassword = this.stringUtil.EMPTY_STRING;
        this.testFtp = this.stringUtil.EMPTY_STRING;
        this.testFtpPath = this.abPathUtil.NO_ABPATH;
        this.testFtpUserName = this.stringUtil.EMPTY_STRING;
        this.testFtpPassword = this.stringUtil.EMPTY_STRING;
        this.timeCreated = this.stringUtil.EMPTY_STRING;
        this.lastModified = this.stringUtil.EMPTY_STRING;
        this.getFormData(hashMap);
        final domDocumentString : String = (cast hashMap.get(StoreFrontData.getInstance().CONFIGURATION) : String);
        if (domDocumentString == null) {
            final document : Document = DomDocumentHelper.create(domDocumentString);
            this.setContextConfigurationInterface(ContextConfigurationInterfaceFactory.getInstance().getInstance(document));
        }
    }

    private function isColumn(columnName : String) : Bool {
        if (Reflect.compare(columnName, StoreFrontData.getInstance().NAME) == 0 || Reflect.compare(columnName, UserData.MAINEMAIL) == 0) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    private function createPath(key : String, hashMap : HashMap) : AbPath {
        return new AbPath(this.create(this.EMPTY_STRING, key, hashMap), StringUtil.getInstance().EMPTY_STRING);
    }

    // throws Exception
    private function createPath(append : String, key : String, hashMap : HashMap) : AbPath {
        return new AbPath(this.create(append, key, hashMap), StringUtil.getInstance().EMPTY_STRING);
    }

    private function get(key : String, hashMap : HashMap) : String {
        return this.create(this.EMPTY_STRING, key, hashMap);
    }

    private function create(append : String, key : String, hashMap : HashMap) : String {
        var path : String = (cast hashMap.get(key) : String);
        if (StringValidationUtil.getInstance().isEmpty(path)) {
            return this.EMPTY_STRING;
        } else {
            if (this.isColumn(path)) {
                return (cast hashMap.get(path) : String) + append;
            } else {
                return path;
            }
        }
    }

    // throws Exception
    private function getFormData(storeHashMap : HashMap) : Void {
        var storeFrontData : StoreFrontData = StoreFrontData.getInstance();
        this.name = (cast storeHashMap.get(storeFrontData.NAME) : String);
        this.basketName = (cast storeHashMap.get(storeFrontData.NAME) : String);
        this.homeHostName = (cast storeHashMap.get(storeFrontData.HOMEHOSTNAME) : String);
        this.homeHostNamePath = this.createPath(storeFrontData.HOMEHOSTNAMEPATH, storeHashMap);
        this.hostName = (cast storeHashMap.get(storeFrontData.HOSTNAME) : String);
        this.hostNamePath = this.createPath(storeFrontData.HOSTNAMEPATH, storeHashMap);
        this.testHomeHostName = (cast storeHashMap.get(storeFrontData.TESTHOMEHOSTNAME) : String);
        this.testHomeHostNamePath = this.createPath(storeFrontData.TESTHOMEHOSTNAMEPATH, storeHashMap);
        this.testHostName = (cast storeHashMap.get(storeFrontData.TESTHOSTNAME) : String);
        this.testHostNamePath = this.createPath(storeFrontData.TESTHOSTNAMEPATH, storeHashMap);
        this.imagePath = this.createPath(StoreFront.RESOURCES, storeFrontData.IMAGEPATH, storeHashMap);
        this.staticPath = this.createPath(" Products" + AbPathData.getInstance().SEPARATOR, storeFrontData.STATICPATH, storeHashMap);
        this.categoryPath = this.createPath(StoreFront.RESOURCES, storeFrontData.CATEGORYPATH, storeHashMap);
        this.inventoryControl = (cast storeHashMap.get(storeFrontData.INVENTORYCONTROL) : String);
        this.subStores = (cast storeHashMap.get(storeFrontData.SUBSTORES) : String);
        this.tagLocation = (cast storeHashMap.get(storeFrontData.TAGLOCATION) : String);
        this.packageLocation = (cast storeHashMap.get(storeFrontData.PACKAGELOCATION) : String);
        this.ftp = (cast storeHashMap.get(storeFrontData.FTP) : String);
        this.ftpPath = this.createPath(storeFrontData.FTPPATH, storeHashMap);
        this.ftpUserName = (cast storeHashMap.get(storeFrontData.FTPUSERNAME) : String);
        this.ftpPassword = (cast storeHashMap.get(storeFrontData.FTPPASSWORD) : String);
        this.testFtp = (cast storeHashMap.get(storeFrontData.TESTFTP) : String);
        this.testFtpPath = this.createPath(storeFrontData.TESTFTPPATH, storeHashMap);
        this.testFtpUserName = (cast storeHashMap.get(storeFrontData.TESTFTPUSERNAME) : String);
        this.testFtpPassword = (cast storeHashMap.get(storeFrontData.TESTFTPPASSWORD) : String);
        this.timeCreated = (cast storeHashMap.get(EntryData.getInstance().TIMECREATED) : String);
        this.lastModified = (cast storeHashMap.get(EntryData.getInstance().LASTMODIFIED) : String);
    }

    public function isNameValid() : Null<Bool> {
        if (!StringValidationUtil.getInstance().isValidRequired(this.name, this.MINSTORENAMELENGTH, this.MAXCHAR)) {
            return false;
        } else {
            var isEscapedCharactersContained : Bool = false;
            final storeNameEscaped : String = StringEscapeUtils.escapeHtml3(this.name);
            if (Reflect.compare(this.name, storeNameEscaped) != 0) {
                isEscapedCharactersContained = true;
            }
            final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            var isSpacesContained : Bool = false;
            if (stringValidationUtil.containsSpaces(this.name)) {
                isSpacesContained = true;
            }
            if (isSpacesContained || isEscapedCharactersContained) {
                final hashMap : HashMap = SpecialCharacterUtil.getHashMap();
                hashMap.put(haxe.ds.Vector.fromArrayCopy([CommonSeps.getInstance().SPACE]), this.ONE_EMPTY_STRING_ARRAY);
                this.name = new Replace(hashMap).all(this.name);
            }
        }
        return true;
    }

    public function isValid() : Null<Bool> {
        var valid : Null<Bool> = true;
        valid = this.isNameValid();
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isValidRequired(this.basketName, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.homeHostName, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(Std.string(this.homeHostNamePath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.hostName, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(Std.string(this.hostNamePath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.testHomeHostName, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(Std.string(this.testHomeHostNamePath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.testHostName, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(Std.string(this.testHostNamePath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(Std.string(this.imagePath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(Std.string(this.staticPath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(Std.string(this.categoryPath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.inventoryControl, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.subStores, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.tagLocation, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.packageLocation, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.ftp, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(Std.string(this.ftpPath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.ftpUserName, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.ftpPassword, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.testFtp, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(Std.string(this.testFtpPath), this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.testFtpUserName, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.testFtpPassword, this.MINCHAR, this.MAXCHAR)) {
            valid = false;
        }
        if (valid == true) {
            return true;
        } else {
            return false;
        }
    }

    public function nameValidationInfo() : String {
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isValidRequired(this.name, this.MINCHAR, this.MAXCHAR)) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Name is invalid. Must be < ");
            stringBuffer.appendint(this.MAXCHAR);
            stringBuffer.append(" and > 0 characters.<br>");
            return Std.string(stringBuffer);
        }
        return this.EMPTY_STRING;
    }

    public function validationInfo() : String {
        try {
            final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.nameValidationInfo());
            if (!stringValidationUtil.isValidRequired(this.basketName, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Basket name is invalid. Must be < ");
                stringBuffer.appendint(this.MAXCHAR);
                stringBuffer.append(" and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(this.homeHostName, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Home host name is invalid. Must be < ");
                stringBuffer.appendint(this.MAXCHAR);
                stringBuffer.append(" and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(Std.string(this.homeHostNamePath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Home host name path is invalid. Must be < ");
                stringBuffer.appendint(this.MAXCHAR);
                stringBuffer.append(" and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(this.hostName, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Host name is invalid. Must be < ");
                stringBuffer.appendint(this.MAXCHAR);
                stringBuffer.append(" and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(Std.string(this.hostNamePath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Host name path is invalid. Must be < ");
                stringBuffer.appendint(this.MAXCHAR);
                stringBuffer.append(" and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.testHomeHostName, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test home host name is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(Std.string(this.testHomeHostNamePath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test home host name path is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.testHostName, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test host name is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(Std.string(this.testHostNamePath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test host name path is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(Std.string(this.imagePath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Image path is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(Std.string(this.staticPath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Static path is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(Std.string(this.categoryPath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Category path is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(this.inventoryControl, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Inventory control is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.subStores, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Sub stores is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.tagLocation, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Tag location is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidRequired(this.packageLocation, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Package location is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.ftp, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Ftp is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(Std.string(this.ftpPath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Ftp path is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.ftpUserName, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Ftp username is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.ftpPassword, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Ftp password is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.testFtp, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test ftp is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(Std.string(this.testFtpPath), this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test ftp Path is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.testFtpUserName, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test ftp username is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            if (!stringValidationUtil.isValidNotRequired(this.testFtpPassword, this.MINCHAR, this.MAXCHAR)) {
                stringBuffer.append("Test ftp password is invalid. Must be < " + this.MAXCHAR + " and > 0 characters.<br>");
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function getTestHtmlPath() : String {
        return org.allbinary.globals.URLGLOBALS.getTestHtmlPath() + this.getCurrentHostNamePath();
    }

    public function getCurrentHostName() : String {
        var location : String = this.EMPTY_STRING;
        if (org.allbinary.globals.URLGLOBALS.isTestingMode()) {
            location = this.getTestHostName();
        } else {
            location = this.getHostName();
        }
        return location;
    }

    public function getCurrentHostNamePath() : String {
        var location : String = this.EMPTY_STRING;
        if (org.allbinary.globals.URLGLOBALS.isTestingMode()) {
            location = this.getTestHostNamePath();
        } else {
            location = this.getHostNamePath();
        }
        return location;
    }

    public function getCurrentHomeHostName() : String {
        var location : String = this.EMPTY_STRING;
        if (org.allbinary.globals.URLGLOBALS.isTestingMode()) {
            location = this.getTestHomeHostName();
        } else {
            location = this.getHomeHostName();
        }
        return location;
    }

    public function getCurrentHomeHostNamePath() : String {
        var location : String = this.EMPTY_STRING;
        if (org.allbinary.globals.URLGLOBALS.isTestingMode()) {
            location = this.getTestHomeHostNamePath();
        } else {
            location = this.getHomeHostNamePath();
        }
        return location;
    }

    public function getName() : String {
        return this.name;
    }

    public function getBasketName() : String {
        return this.basketName;
    }

    public function getHomeHostName() : String {
        return this.homeHostName;
    }

    public function getHomeHostNamePath() : String {
        return Std.string(this.homeHostNamePath);
    }

    public function getHostName() : String {
        return this.hostName;
    }

    public function getHostNamePath() : String {
        return Std.string(this.hostNamePath);
    }

    public function getTestHomeHostName() : String {
        return this.testHomeHostName;
    }

    public function getTestHomeHostNamePath() : String {
        return Std.string(this.testHomeHostNamePath);
    }

    public function getTestHostName() : String {
        return this.testHostName;
    }

    public function getTestHostNamePath() : String {
        return Std.string(this.testHostNamePath);
    }

    public function getStaticPath() : String {
        return Std.string(this.staticPath);
    }

    public function getCategoryPath() : String {
        return Std.string(this.categoryPath);
    }

    public function getInventoryControl() : String {
        return this.inventoryControl;
    }

    // throws Exception
    public function getSubStores() : BasicArrayList {
        try {
            final tokenizer : Tokenizer = new Tokenizer(CommonSeps.getInstance().SEMICOLON);
            final subStoreVector : BasicArrayList = tokenizer.getTokensFromString(this.subStores, new BasicArrayListD());
            return subStoreVector;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    public function getTagLocation() : String {
        return this.tagLocation;
    }

    public function getPackageLocation() : String {
        return this.packageLocation;
    }

    public function getFtp() : String {
        return this.ftp;
    }

    public function getFtpUserName() : String {
        return this.ftpUserName;
    }

    public function getFtpPassword() : String {
        return this.ftpPassword;
    }

    public function getTestFtp() : String {
        return this.testFtp;
    }

    public function getTestFtpUserName() : String {
        return this.testFtpUserName;
    }

    public function getTestFtpPassword() : String {
        return this.testFtpPassword;
    }

    public function getFtpPath() : String {
        return Std.string(this.ftpPath);
    }

    public function getTestFtpPath() : String {
        return Std.string(this.testFtpPath);
    }

    public function getTimeCreated() : String {
        return this.timeCreated;
    }

    public function getLastModified() : String {
        return this.lastModified;
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function setBasketName(value : String) : Void {
        this.basketName = value;
    }

    public function setHomeHostName(value : String) : Void {
        this.homeHostName = value;
    }

    // throws Exception
    public function setHomeHostNamePath(value : String) : Void {
        this.homeHostNamePath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    public function setHostName(value : String) : Void {
        this.hostName = value;
    }

    // throws Exception
    public function setHostNamePath(value : String) : Void {
        this.hostNamePath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    public function setTestHomeHostName(value : String) : Void {
        this.testHomeHostName = value;
    }

    // throws Exception
    public function setTestHomeHostNamePath(value : String) : Void {
        this.testHomeHostNamePath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    public function setTestHostName(value : String) : Void {
        this.testHostName = value;
    }

    // throws Exception
    public function setTestHostNamePath(value : String) : Void {
        this.testHostNamePath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    // throws Exception
    public function setImagePath(value : String) : Void {
        this.imagePath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    // throws Exception
    public function setStaticPath(value : String) : Void {
        this.staticPath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    // throws Exception
    public function setCategoryPath(value : String) : Void {
        this.categoryPath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    public function setSubStores(value : String) : Void {
        this.subStores = value;
    }

    public function setTagLocation(value : String) : Void {
        this.tagLocation = value;
    }

    public function setPackageLocation(value : String) : Void {
        this.packageLocation = value;
    }

    public function setInventoryControl(value : String) : Void {
        this.inventoryControl = value;
    }

    public function getPackageLocation(value : String) : Void {
        this.packageLocation = value;
    }

    public function setFtp(value : String) : Void {
        this.ftp = value;
    }

    public function setFtpUserName(value : String) : Void {
        this.ftpUserName = value;
    }

    public function setFtpPassword(value : String) : Void {
        this.ftpPassword = value;
    }

    public function setTestFtp(value : String) : Void {
        this.testFtp = value;
    }

    public function setTestFtpUserName(value : String) : Void {
        this.testFtpUserName = value;
    }

    public function setTestFtpPassword(value : String) : Void {
        this.testFtpPassword = value;
    }

    public function setTimeCreated(value : String) : Void {
        this.timeCreated = value;
    }

    public function setLastModified(value : String) : Void {
        this.lastModified = value;
    }

    // throws Exception
    public function setFtpPath(value : String) : Void {
        this.ftpPath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    // throws Exception
    public function setTestFtpPath(value : String) : Void {
        this.testFtpPath = new AbPath(value, StringUtil.getInstance().EMPTY_STRING);
    }

    // throws Exception
    private function createDirectories() : Bool {
        var storeAbPath : AbPath = new AbPath(URLGLOBALS.getWebappPath() + this.getCurrentHomeHostNamePath(), StringUtil.getInstance().EMPTY_STRING);
        if (!this.directory.create(storeAbPath)) {
            return false;
        }
        if (!this.directory.create(new AbPath(storeAbPath + this.getCategoryPath(), StringUtil.getInstance().EMPTY_STRING))) {
            return false;
        }
        if (!this.directory.create(new AbPath(storeAbPath + this.getStaticPath(), StringUtil.getInstance().EMPTY_STRING))) {
            return false;
        }
        return true;
    }

    // throws Exception
    public function install(current : Int, total : Int) : Void {
        try {
            if (!this.createDirectories()) {
                throw new haxe.Exception("Unable to create store directories");
            }
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(URLGLOBALS.getMainPath());
            stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
            final viewPath : String = Std.string(stringBuffer);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(viewPath);
            stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().INSTALLPATH);
            final fromDirectoryAbPath : AbPath = new AbPath(Std.string(stringBuffer), StringUtil.getInstance().EMPTY_STRING);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(viewPath);
            stringBuffer.append("special");
            stringBuffer.append(AbPathData.getInstance().SEPARATOR);
            final fromSpecialDirectoryAbPath : AbPath = new AbPath(Std.string(stringBuffer), StringUtil.getInstance().EMPTY_STRING);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(viewPath);
            stringBuffer.append(this.getName());
            stringBuffer.append(AbPathData.getInstance().SEPARATOR);
            final toDirectoryAbPath : AbPath = new AbPath(Std.string(stringBuffer), StringUtil.getInstance().EMPTY_STRING);
            if (current == 0) {
                if (!this.directory.create(toDirectoryAbPath)) {
                    throw new haxe.Exception("Unable to create store view directory: " + Std.string(toDirectoryAbPath));
                }
            }
            final viewTotal : Int = Std.int((total * 85) / 100);
            final installTotal : Int = Std.int((total * 93) / 100);
            if (current < viewTotal) {
                final file : AbFile = AbFile.createAbFileFromAbPath(fromSpecialDirectoryAbPath);
                if (file.isDirectory()) {
                    var halfViewTotal : Int = Std.int(viewTotal / 2);
                    if (current < halfViewTotal) {
                        this.installViews(fromSpecialDirectoryAbPath, toDirectoryAbPath, current, halfViewTotal);
                    } else if (current < viewTotal) {
                        this.installViews(fromDirectoryAbPath, toDirectoryAbPath, current - halfViewTotal, viewTotal - halfViewTotal);
                    }
                } else {
                    this.installViews(fromDirectoryAbPath, toDirectoryAbPath, current, viewTotal);
                }
            } else if (current < installTotal) {
                this.installResources(fromDirectoryAbPath, current - viewTotal, installTotal - viewTotal);
            } else {
                this.installMedia(fromDirectoryAbPath, current - installTotal, total - installTotal);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "install()", e);
            }
            throw e;
        }
    }

    // throws Exception
    private function installViews(fromDirectoryAbPath : AbPath, toDirectoryAbPath : AbPath, current : Int, total : Int) : Void {
        FileUtil.getInstance().copyDirectoryPortion(fromDirectoryAbPath, toDirectoryAbPath, true, false, current, total);
    }

    // throws Exception
    private function installResources(fromDirectoryAbPath : AbPath, current : Int, total : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Std.string(fromDirectoryAbPath));
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        stringBuffer.append("Resources");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        final installCategoryAbPath : AbPath = new AbPath(Std.string(stringBuffer), StringUtil.getInstance().EMPTY_STRING);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(URLGLOBALS.getMainPath());
        stringBuffer.append(this.getCurrentHomeHostNamePath());
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        stringBuffer.append(this.getCategoryPath());
        final categoryAbPath : AbPath = new AbPath(Std.string(stringBuffer), StringUtil.getInstance().EMPTY_STRING);
        FileUtil.getInstance().copyDirectoryPortion(installCategoryAbPath, categoryAbPath, true, false, current, total);
    }

    // throws Exception
    private function installMedia(fromDirectoryAbPath : AbPath, current : Int, total : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Std.string(fromDirectoryAbPath));
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().TEMPLATEPATH);
        stringBuffer.append("images");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        final viewStoreImagesDirectoryAbPath : AbPath = new AbPath(Std.string(stringBuffer), StringUtil.getInstance().EMPTY_STRING);
        final storeAbPath : AbPath = new AbPath(URLGLOBALS.getWebappPath() + this.getCurrentHomeHostNamePath(), StringUtil.getInstance().EMPTY_STRING);
        FileUtil.getInstance().copyDirectoryPortion(viewStoreImagesDirectoryAbPath, storeAbPath, true, false, current, total);
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        final dataVector : BasicArrayList = new BasicArrayListD();
        dataVector.add(this.name);
        dataVector.add(this.homeHostName);
        dataVector.add(Std.string(this.homeHostNamePath));
        dataVector.add(this.hostName);
        dataVector.add(Std.string(this.hostNamePath));
        dataVector.add(this.testHomeHostName);
        dataVector.add(Std.string(this.testHomeHostNamePath));
        dataVector.add(this.testHostName);
        dataVector.add(Std.string(this.testHostNamePath));
        dataVector.add(Std.string(this.imagePath));
        dataVector.add(Std.string(this.staticPath));
        dataVector.add(Std.string(this.categoryPath));
        dataVector.add(this.inventoryControl);
        final contextConfigurationDomDocumentMapping : ContextConfigurationDomDocumentMapping = new ContextConfigurationDomDocumentMapping(this.getContextConfigurationInterface());
        dataVector.add(contextConfigurationDomDocumentMapping.toDomDocumentString());
        dataVector.add(this.subStores);
        dataVector.add(this.tagLocation);
        dataVector.add(this.packageLocation);
        dataVector.add(this.ftp);
        dataVector.add(Std.string(this.ftpPath));
        dataVector.add(this.ftpUserName);
        dataVector.add(this.ftpPassword);
        dataVector.add(this.testFtp);
        dataVector.add(Std.string(this.testFtpPath));
        dataVector.add(this.testFtpUserName);
        dataVector.add(this.testFtpPassword);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        dataVector.add(time);
        dataVector.add(time);
        return dataVector;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        final storeFrontData : StoreFrontData = StoreFrontData.getInstance();
        final dataHashMap : HashMap = StdUtil.getInstance().createHashMap();
        dataHashMap.put(storeFrontData.NAME, this.name);
        dataHashMap.put(storeFrontData.HOMEHOSTNAME, this.homeHostName);
        dataHashMap.put(storeFrontData.HOMEHOSTNAMEPATH, Std.string(this.homeHostNamePath));
        dataHashMap.put(storeFrontData.HOSTNAME, this.hostName);
        dataHashMap.put(storeFrontData.HOSTNAMEPATH, Std.string(this.hostNamePath));
        dataHashMap.put(storeFrontData.TESTHOMEHOSTNAME, this.testHomeHostName);
        dataHashMap.put(storeFrontData.TESTHOMEHOSTNAMEPATH, Std.string(this.testHomeHostNamePath));
        dataHashMap.put(storeFrontData.TESTHOSTNAME, this.testHostName);
        dataHashMap.put(storeFrontData.TESTHOSTNAMEPATH, Std.string(this.testHostNamePath));
        dataHashMap.put(storeFrontData.IMAGEPATH, Std.string(this.imagePath));
        dataHashMap.put(storeFrontData.STATICPATH, Std.string(this.staticPath));
        dataHashMap.put(storeFrontData.CATEGORYPATH, Std.string(this.categoryPath));
        dataHashMap.put(storeFrontData.INVENTORYCONTROL, this.inventoryControl);
        var contextConfigurationDomDocumentMapping : ContextConfigurationDomDocumentMapping = new ContextConfigurationDomDocumentMapping(this.getContextConfigurationInterface());
        dataHashMap.put(storeFrontData.CONFIGURATION, contextConfigurationDomDocumentMapping.toDomDocumentString());
        dataHashMap.put(storeFrontData.SUBSTORES, this.subStores);
        dataHashMap.put(storeFrontData.TAGLOCATION, this.tagLocation);
        dataHashMap.put(storeFrontData.PACKAGELOCATION, this.packageLocation);
        dataHashMap.put(storeFrontData.FTP, this.ftp);
        dataHashMap.put(storeFrontData.FTPPATH, Std.string(this.ftpPath));
        dataHashMap.put(storeFrontData.FTPUSERNAME, this.ftpUserName);
        dataHashMap.put(storeFrontData.FTPPASSWORD, this.ftpPassword);
        dataHashMap.put(storeFrontData.TESTFTP, this.testFtp);
        dataHashMap.put(storeFrontData.TESTFTPPATH, Std.string(this.testFtpPath));
        dataHashMap.put(storeFrontData.TESTFTPUSERNAME, this.testFtpUserName);
        dataHashMap.put(storeFrontData.TESTFTPPASSWORD, this.testFtpPassword);
        final calendar : Calendar = Calendar.getInstance();
        final time : String = Std.string(calendar.getTimeInMillis());
        dataHashMap.put(EntryData.getInstance().LASTMODIFIED, time);
        return dataHashMap;
    }

    public function getKey() : Any {
        return (cast this.getName() : Any);
    }

    public function getContextConfigurationInterface() : ContextConfigurationInterface {
        return this.contextConfigurationInterface;
    }

    public function setContextConfigurationInterface(contextConfigurationInterface : ContextConfigurationInterface) : Void {
        this.contextConfigurationInterface = contextConfigurationInterface;
    }

}

