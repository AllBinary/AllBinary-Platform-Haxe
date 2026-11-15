/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
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
package org.allbinary.util;

//import java.util.HashMap;
//import java.util.Map;
//import java.util.Set;
import jsinterop.annotations.JsType;

class ABHashMap<K, V> extends HashMap<K, V> {
    public override function size() : Int {
        return super.size();
    }

    public override function isEmpty() : Bool {
        return super.isEmpty();
    }

    public override function get(key : Any) : V {
        return super.get(key);
    }

    public override function containsKey(key : Any) : Bool {
        return super.containsKey(key);
    }

    public override function put(key : K, value : V) : V {
        return super.put(key, value);
    }

    public override function putAll(map : Map<Dynamic, Dynamic>) : Void {
        super.putAll(map);
    }

    public override function remove(key : Any) : V {
        return super.remove(key);
    }

    public override function clear() : Void {
        super.clear();
    }

    public override function containsValue(value : Any) : Bool {
        return super.containsValue(value);
    }

    public override function keySet() : Set<K> {
        return super.keySet();
    }

    public override function entrySet() : Set<Map.Entry<K, V>> {
        return super.entrySet();
    }

    public override function getOrDefault(key : Any, defaultValue : V) : V {
        return super.getOrDefault(key, defaultValue);
    }

    public override function putIfAbsent(key : K, value : V) : V {
        return super.putIfAbsent(key, value);
    }

    public override function clone() : Any {
        return super.clone();
    }

    public function new() {
        super();
    }
}

