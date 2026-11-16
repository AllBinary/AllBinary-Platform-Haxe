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
package org.allbinary.business.context.modules.storefronts;

import jre.util.HashMap;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.UserData;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicStoreFront implements BasicStoreFrontInterface {
    private var name : String;
    private var userName : String;
    private var basketName : String;
    private var homeHostName : String;
    private var homeHostNamePath : String;
    private var hostName : String;
    private var hostNamePath : String;
    private var testHomeHostName : String;
    private var testHomeHostNamePath : String;
    private var testHostName : String;
    private var testHostNamePath : String;
    private var imagePath : String;
    private var staticPath : String;
    private var categoryPath : String;
    private var inventoryControl : String;
    private var subStores : String;
    private var tagLocation : String;
    private var packageLocation : String;
    private var ftp : String;
    private var ftpPath : String;
    private var ftpUserName : String;
    private var ftpPassword : String;
    private var testFtp : String;
    private var testFtpPath : String;
    private var testFtpUserName : String;
    private var testFtpPassword : String;
    private var timeCreated : String;
    private var lastModified : String;
    public function new(...args : Dynamic) {
        if (args.length == 0) {
            this._newBasicStoreFront0();
        }
        else if (args.length == 1) {
            final storeHashMap : HashMap<Dynamic, Dynamic> = args[0];
            this._newBasicStoreFront1(storeHashMap);
        }
    }

    private function _newBasicStoreFront0() : Void {
    }

    private function _newBasicStoreFront1(storeHashMap : HashMap<Dynamic, Dynamic>) : Void {
        var storeFrontData : StoreFrontData = StoreFrontData.getInstance();
        this.name = (cast storeHashMap.get(storeFrontData.NAME) : String);
        this.userName = (cast storeHashMap.get(UserData.USERNAME) : String);
        this.basketName = (cast storeHashMap.get(storeFrontData.NAME) : String);
        this.homeHostName = (cast storeHashMap.get(storeFrontData.HOMEHOSTNAME) : String);
        this.homeHostNamePath = (cast storeHashMap.get(storeFrontData.HOMEHOSTNAMEPATH) : String);
        this.hostName = (cast storeHashMap.get(storeFrontData.HOSTNAME) : String);
        this.hostNamePath = (cast storeHashMap.get(storeFrontData.HOSTNAMEPATH) : String);
        this.testHomeHostName = (cast storeHashMap.get(storeFrontData.TESTHOMEHOSTNAME) : String);
        this.testHomeHostNamePath = (cast storeHashMap.get(storeFrontData.TESTHOMEHOSTNAMEPATH) : String);
        this.testHostName = (cast storeHashMap.get(storeFrontData.TESTHOSTNAME) : String);
        this.testHostNamePath = (cast storeHashMap.get(storeFrontData.TESTHOSTNAMEPATH) : String);
        this.imagePath = (cast storeHashMap.get(storeFrontData.IMAGEPATH) : String);
        this.staticPath = (cast storeHashMap.get(storeFrontData.STATICPATH) : String);
        this.categoryPath = (cast storeHashMap.get(storeFrontData.CATEGORYPATH) : String);
        this.inventoryControl = (cast storeHashMap.get(storeFrontData.INVENTORYCONTROL) : String);
        this.subStores = (cast storeHashMap.get(storeFrontData.SUBSTORES) : String);
        this.tagLocation = (cast storeHashMap.get(storeFrontData.TAGLOCATION) : String);
        this.packageLocation = (cast storeHashMap.get(storeFrontData.PACKAGELOCATION) : String);
        this.ftp = (cast storeHashMap.get(storeFrontData.FTP) : String);
        this.ftpPath = (cast storeHashMap.get(storeFrontData.FTPPATH) : String);
        this.ftpUserName = (cast storeHashMap.get(storeFrontData.FTPUSERNAME) : String);
        this.ftpPassword = (cast storeHashMap.get(storeFrontData.FTPPASSWORD) : String);
        this.testFtp = (cast storeHashMap.get(storeFrontData.TESTFTP) : String);
        this.testFtpPath = (cast storeHashMap.get(storeFrontData.TESTFTPPATH) : String);
        this.testFtpUserName = (cast storeHashMap.get(storeFrontData.TESTFTPUSERNAME) : String);
        this.testFtpPassword = (cast storeHashMap.get(storeFrontData.TESTFTPPASSWORD) : String);
        this.timeCreated = (cast storeHashMap.get(EntryData.getInstance().TIMECREATED) : String);
        this.lastModified = (cast storeHashMap.get(EntryData.getInstance().LASTMODIFIED) : String);
    }

    public function getTestHtmlPath() : String {
        return org.allbinary.globals.URLGLOBALS.getTestHtmlPath() + this.getCurrentHostNamePath();
    }

    public function getCurrentHostName() : String {
        var location : String = null;
        if (org.allbinary.globals.URLGLOBALS.isTestingMode()) {
            location = this.getTestHostName();
        } else {
            location = this.getHostName();
        }
        return location;
    }

    public function getCurrentHostNamePath() : String {
        var location : String = null;
        if (org.allbinary.globals.URLGLOBALS.isTestingMode()) {
            location = this.getTestHostNamePath();
        } else {
            location = this.getHostNamePath();
        }
        return location;
    }

    public function getCurrentHomeHostName() : String {
        var location : String = null;
        if (org.allbinary.globals.URLGLOBALS.isTestingMode()) {
            location = this.getTestHomeHostName();
        } else {
            location = this.getHomeHostName();
        }
        return location;
    }

    public function getCurrentHomeHostNamePath() : String {
        var location : String = null;
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

    public function getUserName() : String {
        return this.userName;
    }

    public function getBasketName() : String {
        return this.basketName;
    }

    public function getHomeHostName() : String {
        return this.homeHostName;
    }

    public function getHomeHostNamePath() : String {
        return this.homeHostNamePath;
    }

    public function getHostName() : String {
        return this.hostName;
    }

    public function getHostNamePath() : String {
        return this.hostNamePath;
    }

    public function getTestHomeHostName() : String {
        return this.testHomeHostName;
    }

    public function getTestHomeHostNamePath() : String {
        return this.testHomeHostNamePath;
    }

    public function getTestHostName() : String {
        return this.testHostName;
    }

    public function getTestHostNamePath() : String {
        return this.testHostNamePath;
    }

    public function getStaticPath() : String {
        return this.staticPath;
    }

    public function getCategoryPath() : String {
        return this.categoryPath;
    }

    public function getInventoryControl() : String {
        return this.inventoryControl;
    }

    // throws Exception
    public function getSubStores() : BasicArrayList {
        try {
            var tokenizer : Tokenizer = new Tokenizer(CommonSeps.getInstance().SEMICOLON);
            var subStoreVector : BasicArrayList = tokenizer.getTokensFromString(this.subStores, new BasicArrayListD());
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
        return this.ftpPath;
    }

    public function getTestFtpPath() : String {
        return this.testFtpPath;
    }

    public function getTimeCreated() : String {
        return this.timeCreated;
    }

    public function getLastModified() : String {
        return this.lastModified;
    }

}

