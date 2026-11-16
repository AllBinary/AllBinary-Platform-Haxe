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
package org.allbinary.graphics.color;

import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class BasicColorCacheFactory {
    private static final instance : BasicColorCacheFactory = new BasicColorCacheFactory();
    public static function getInstance() : BasicColorCacheFactory {
        return BasicColorCacheFactory.instance;
    }

    private final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public function new() {
    }

    public function add(basicDefaultColor : BasicColor) : Void {
        this.hashtable.put(jre.lang.JavaObject.intValue(basicDefaultColor), basicDefaultColor);
    }

    // synchronized
    public function getAndOrCreate(integer : Null<Int>) : BasicColor {
        var basicColor : BasicColor = (cast this.hashtable.get(integer) : BasicColor);
        if (basicColor == null) {
            basicColor = BasicColorFactory.getInstance().createInstance(jre.lang.JavaNumber.toInt(integer));
            this.hashtable.put(integer, basicColor);
        }
        return basicColor;
    }

}

