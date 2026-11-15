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
package org.allbinary.game.resource;

import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class ResourceRelativeRelationshipFactory implements ResourceRelativeRelationshipFactoryInterface {
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    private final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    private var initialized : Bool = false;
    // throws Exception
    public function init(level : Int) : Void {
        this.setInitialized(true);
    }

    // throws Exception
    public function getResourceRelativeRelationshipList(resource : String) : BasicArrayList {
        final listCanBeNull : Any = this.hashtable.get(resource);
        if (listCanBeNull == null) {
            return this.basicArrayListUtil.getImmutableInstance();
        }
        return (cast listCanBeNull : BasicArrayList);
    }

    // throws Exception
    public function addResourceRelativeRelationship(resource : String, hardPoint : RelativeRelationship) : Void {
        var list : BasicArrayList = this.getResourceRelativeRelationshipList(resource);
        if (list == this.basicArrayListUtil.getImmutableInstance()) {
            list = new BasicArrayListD();
        }
        list.add(hardPoint);
        this.hashtable.put(resource, list);
    }

    public function isLoadingLevel(level : Int) : Bool {
        return false;
    }

    public function isFeature() : Bool {
        return false;
    }

    public function setInitialized(initialized : Bool) : Void {
        this.initialized = initialized;
    }

    public function isInitialized() : Bool {
        return this.initialized;
    }

    public function new() {
    }
}

