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
package org.allbinary.game.layer;

//import java.util.Enumeration;
import org.allbinary.layer.Layer;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.EnumerationUtil;

class LevelLayersFinder {
    private static final instance : LevelLayersFinder = new LevelLayersFinder();
    public static function getInstance() : LevelLayersFinder {
        return LevelLayersFinder.instance;
    }

    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    public function get(hashtable : ABHashtable<Any, Any>) : BasicArrayList {
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final list : BasicArrayList = new BasicArrayListD();
        final enumeration : Enumeration = hashtable.keys();
        var layerHashtableCanBeNull : ABHashtable<Any, Any> = null;
        var integerCanBeNull : Null<Int> = null;
        var cachedIntegerCanBeNull : Null<Int> = null;
        while (this.enumerationUtil.hasMoreElements(enumeration)) {
            layerHashtableCanBeNull = (cast hashtable.get((cast this.enumerationUtil.nextElement(enumeration) : Any)) : ABHashtable<Any, Any>);
            integerCanBeNull = (cast layerHashtableCanBeNull.get((cast Layer.ID : Any)) : Null<Int>);
            cachedIntegerCanBeNull = smallIntegerSingletonFactory.getAt(Std.int(integerCanBeNull));
            if (!list.contains(cachedIntegerCanBeNull)) {
                list.add(cachedIntegerCanBeNull);
            }
        }
        return list;
    }

    public function new() {
    }
}

