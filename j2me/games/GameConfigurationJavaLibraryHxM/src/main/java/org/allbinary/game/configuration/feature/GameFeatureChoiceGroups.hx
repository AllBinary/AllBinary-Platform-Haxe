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

import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

class GameFeatureChoiceGroups {
    private static var gameFeatureChoiceGroupsExclusive : GameFeatureChoiceGroups = new GameFeatureChoiceGroups();
    private static var gameFeatureChoiceGroupsMultiple : GameFeatureChoiceGroups = new GameFeatureChoiceGroups();
    private var hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public function new() {
    }

    public static function getExclusiveInstance() : GameFeatureChoiceGroups {
        return GameFeatureChoiceGroups.gameFeatureChoiceGroupsExclusive;
    }

    public static function getMultipleInstance() : GameFeatureChoiceGroups {
        return GameFeatureChoiceGroups.gameFeatureChoiceGroupsMultiple;
    }

    public function get() : ABHashtable<Any, Any> {
        return this.hashtable;
    }

    public function add(name : String, list : BasicArrayList) : Void {
        this.hashtable.put(name, list);
    }

}

