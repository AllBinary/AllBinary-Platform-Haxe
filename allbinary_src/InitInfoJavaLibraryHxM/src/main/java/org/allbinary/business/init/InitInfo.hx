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
package org.allbinary.business.init;

import jre.util.HashMap;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.logic.string.StringUtil;

class InitInfo {
    private static final instance : InitInfo = new InitInfo();
    public static function getInstance() : InitInfo {
        return InitInfo.instance;
    }

    public final TESTING : String = "TESTING";
    public final MAINPATH : String = "MAINPATH";
    public final TESTHTMLPATH : String = "TESTHTMLPATH";
    private var testing : String = null;
    private var mainPath : AbPath = null;
    private var testHtmlPath : AbPath = null;
    private var hasRead : Bool = false;
    public function new() {
    }

    public function set(...args : Dynamic) : Dynamic {
        if (args.length == 0) {
            this.set_();
            return null;
        }
        if (args.length == 1) {
            this.set_HashMap(args[0]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: set");
    }

    // throws InitException
    // synchronized
    public function set_() : Void {
        try {
            var initInfoEntity : InitInfoEntity = new InitInfoEntity();
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADER)) {
                PreLogUtil.put("created entity", "InitInfo", "set()");
            }
            if (!initInfoEntity.is()) {
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADER)) {
                    PreLogUtil.put("adding", "InitInfo", "set()");
                }
                initInfoEntity.add();
            } else {
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADER)) {
                    PreLogUtil.put("update", "InitInfo", "set()");
                }
                initInfoEntity.update();
            }
            this.hasRead = false;
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE("error", "InitInfo", "set()", e);
            }
        }
    }

    // synchronized
    public function set_HashMap(hashMap : HashMap<Dynamic, Dynamic>) : Void {
        try {
            this.testing = (cast hashMap.get(this.TESTING) : String);
            this.mainPath = new AbPath((cast hashMap.get(this.MAINPATH) : String), StringUtil.getInstance().EMPTY_STRING);
            this.testHtmlPath = new AbPath((cast hashMap.get(this.TESTHTMLPATH) : String), StringUtil.getInstance().EMPTY_STRING);
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE("error", "InitInfo", "set()", e);
            }
        }
    }

    // synchronized
    private function get() : Void {
        try {
            this.testing = null;
            this.mainPath = null;
            this.testHtmlPath = null;
            var initInfoEntity : InitInfoEntity = new InitInfoEntity();
            initInfoEntity.get();
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE("error", "InitInfo", "set()", e);
            }
            return;
        }
    }

    // synchronized
    public function setHasRead(value : Bool) : Void {
        this.hasRead = value;
    }

    // synchronized
    private function updateIfNeeded() : Void {
        try {
            if (!this.hasRead) {
                this.hasRead = true;
                this.get();
            }
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE("error", "InitInfo", "updateIfNeeded()", e);
            }
            return;
        }
    }

    public function isTesting() : Bool {
        try {
            this.updateIfNeeded();
            return BooleanUtil.getInstance().getFromString(this.testing);
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE("error", "InitInfo", "updateIfNeeded()", e);
            }
            return false;
        }
    }

    public function getTesting() : String {
        this.updateIfNeeded();
        return this.testing;
    }

    public function getTestHtmlPath() : String {
        this.updateIfNeeded();
        if (this.testHtmlPath != null) {
            return Std.string(this.testHtmlPath);
        } else {
            return null;
        }
    }

    public function getMainPath() : String {
        this.updateIfNeeded();
        if (this.mainPath != null) {
            return Std.string(this.mainPath);
        } else {
            return null;
        }
    }

    public function setTesting(value : String) : Void {
        this.testing = value;
    }

    public function setTestHtmlPath(value : AbPath) : Void {
        this.testHtmlPath = value;
    }

    public function setMainPath(value : AbPath) : Void {
        this.mainPath = value;
    }

    public function isMainPathValid(abPath : AbPath) : Bool {
        return true;
    }

    public function isTestHtmlPathValid(abPath : AbPath) : Bool {
        return true;
    }

    // throws Exception
    public function isTestingValid(testing : String) : Bool {
        return BooleanUtil.getInstance().isStringBoolean(testing);
    }

    public function toHashMap() : HashMap<Dynamic, Dynamic> {
        var hashMap : HashMap<Dynamic, Dynamic> = StdUtil.getInstance().createHashMap();
        hashMap.put(this.TESTING, this.getTesting());
        hashMap.put(this.MAINPATH, this.getMainPath());
        hashMap.put(this.TESTHTMLPATH, this.getTestHtmlPath());
        return hashMap;
    }

}

