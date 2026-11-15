/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary;

import jre.util.HashMap;
import jre.util.Map;
import jre.util.Set;

//J2SEForJ2ME
class J2SEUtil {
    private static final instance : J2SEUtil = new J2SEUtil();
    public static function getInstance() : J2SEUtil {
        return J2SEUtil.instance;
    }

    public function getHashMapAsArray(hashMap : HashMap<Any, Any>) : haxe.ds.Vector<Any> {
        final objectArray : haxe.ds.Vector<Any> = hashMap.keySet().toArray();
        return objectArray;
    }

    public function getMapAsArray(map : Map<Any, Any>) : haxe.ds.Vector<Any> {
        final objectArray : haxe.ds.Vector<Any> = map.keySet().toArray();
        return objectArray;
    }

    public function getSetAsArray(set : Set<String>) : haxe.ds.Vector<Any> {
        final objectArray : haxe.ds.Vector<Any> = set.toArray();
        return objectArray;
    }

    public function new() {
    }
}

