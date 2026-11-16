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
package org.allbinary.data.resource;

import jre.io.InputStream;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import org.allbinary.debug.DebugFactory;
import org.allbinary.debug.NoDebug;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.HashtableUtil;

//Android
class ResourceUtil {
    private static final instance : ResourceUtil = new ResourceUtil();
    public static function getInstance() : ResourceUtil {
        return ResourceUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private var context : Any = NullUtil.getInstance().NULL_OBJECT;
    private var resources : Any = NullUtil.getInstance().NULL_OBJECT;
    private var hashMap : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public function new() {
    }

    public function setLoadingPaths(path : String, ext : String) : Void {
        this.logUtil.putF(CommonStrings.getInstance().NOT_IMPLEMENTED, this, "setLoadingPaths");
    }

    public function getContext() : Context {
        return (cast this.context : Context);
    }

    public function setContextFromActivity(activity : Activity) : Void {
        this.context = activity;
    }

    public function setContext(aContext : Context) : Void {
        this.context = aContext;
    }

    public function getResourceId(resource : String) : Null<Int> {
        final value : Null<Int> = (cast this.hashMap.get(resource) : Null<Int>);
        if (DebugFactory.getInstance() != NoDebug.getInstance()) {
            PreLogUtil.put(Std.string(new StringMaker().append(resource).append(CommonSeps.getInstance().COLON).append(Std.string(value))), this, "getResourceId");
        }
        return value;
    }

    public function addResource(resource : String, value : Null<Int>) : Void {
        if (DebugFactory.getInstance() != NoDebug.getInstance()) {
            PreLogUtil.put(Std.string(new StringMaker().append(resource).append(CommonSeps.getInstance().COLON).append(Std.string(value))), this, "addResource");
            if (this.containsDuplicate(resource, value)) {
                ForcedLogUtil.log(Std.string(new StringMaker().append("Found Duplicate Resource: ").append(resource)), this);
            }
        }
        this.hashMap.put(resource, value);
    }

    private function containsDuplicate(resource : String, value : Null<Int>) : Bool {
        var objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(this.hashMap);
        {
            var index : Int = objectArray.length;
            while (--index >= 0) {
            var integer : Null<Int> = (cast this.hashMap.get((cast objectArray[index] : Any)) : Null<Int>);
            if (resource != objectArray[index]) {
                if (value != integer) {
                    if (jre.lang.JavaNumber.toInt(value) == jre.lang.JavaNumber.toInt(integer)) {
                        return true;
                    }
                }
            }
            }
        }
        return false;
    }

    public function setResources(resources : Resources) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append("Resource Loader: ").append(Type.getClassName(Type.getClass(resources)))), this, "setResources");
        this.resources = resources;
    }

    // throws Exception
    public function getResourceAsStream(resource : String) : InputStream {
        final integer : Null<Int> = (cast this.hashMap.get(resource) : Null<Int>);
        final id : Int = jre.lang.JavaNumber.toInt(integer);
        final resources : Resources = ((cast this.resources : Resources));
        final inputStream : InputStream = resources.openRawResource(id);
        if (inputStream != null) {
            return inputStream;
        }
        return inputStream;
    }

}

