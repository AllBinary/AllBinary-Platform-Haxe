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
package org.allbinary.game.configuration.feature;

import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class Feature {
    private static var hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    private final name : String;
    public function new(name : String) {
        this.name = name;
        Feature.add(name, this);
        ChangedGameFeatureListener.getInstance().add(this);
    }

    public static function getInstance(name : String) : Feature {
        return (cast Feature.hashtable.get(name) : Feature);
    }

    private static function add(name : String, gameFeature : Feature) : Void {
        Feature.hashtable.put(name, gameFeature);
    }

    public function toString() : String {
        return this.getName();
    }

    public function getName() : String {
        return this.name;
    }

}

