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
package org.allbinary.util;

//import java.util.Enumeration;
import jsinterop.annotations.JsType;

class HashtableUtil {
    private static final instance : HashtableUtil = new HashtableUtil();
    public static function getInstance() : HashtableUtil {
        return HashtableUtil.instance;
    }

    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    public function putAll(fromHashtable : ABHashtable<Any, Any>, hashtable : ABHashtable<Any, Any>) : Void {
        final enumeration : Enumeration = fromHashtable.keys();
        var keyCanBeNull : Any = null;
        var valueCanBeNull : Any = null;
        while (this.enumerationUtil.hasMoreElements(enumeration)) {
            keyCanBeNull = this.enumerationUtil.nextElement(enumeration);
            valueCanBeNull = hashtable.get(keyCanBeNull);
            if (valueCanBeNull == null) {
            } else {
                hashtable.put(keyCanBeNull, valueCanBeNull);
            }
        }
    }

    public function getKeysAsArray(hashtable : ABHashtable<Any, Any>) : haxe.ds.Vector<Any> {
        final objectArray : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...hashtable.size()) null]);
        var index : Int = 0;
        final enumeration : Enumeration = hashtable.keys();
        while (this.enumerationUtil.hasMoreElements(enumeration)) {
            objectArray[index++] = this.enumerationUtil.nextElement(enumeration);
        }
        return objectArray;
    }

    public function getKeysAsList(hashtable : ABHashtable<Any, Any>) : BasicArrayList {
        final list : BasicArrayList = new BasicArrayListS(hashtable.size());
        final enumeration : Enumeration = hashtable.keys();
        while (this.enumerationUtil.hasMoreElements(enumeration)) {
            list.add(this.enumerationUtil.nextElement(enumeration));
        }
        return list;
    }

    public function new() {
    }
}

