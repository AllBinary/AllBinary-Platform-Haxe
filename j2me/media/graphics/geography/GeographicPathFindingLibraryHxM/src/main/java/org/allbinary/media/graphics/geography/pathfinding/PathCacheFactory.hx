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
package org.allbinary.media.graphics.geography.pathfinding;

import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class PathCacheFactory {
    private static var pathFactory : PathCacheFactory = new PathCacheFactory();
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    private final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public function new() {
    }

    public static function getInstance() : PathCacheFactory {
        return PathCacheFactory.pathFactory;
    }

    public function getSize() : Int {
        return this.hashtable.size();
    }

    public function add(pathId : Null<Int>, list : BasicArrayList) : Void {
        this.hashtable.put(pathId, list);
    }

    public function remove(pathId : Null<Int>) : Void {
        this.hashtable.remove(pathId);
    }

    // throws Exception
    public function removeAll() : Void {
        this.hashtable.clear();
        if (this.hashtable.size() > 0) {
            throw new haxe.Exception("Did not clear");
        }
    }

    // throws Exception
    public function getOrCreate(pathIdInteger : Null<Int>) : BasicArrayList {
        var listCanBeNull : Any = this.hashtable.get(pathIdInteger);
        if (listCanBeNull == null) {
            listCanBeNull = this.basicArrayListUtil.getImmutableInstance();
        }
        return (cast listCanBeNull : BasicArrayList);
    }

}

