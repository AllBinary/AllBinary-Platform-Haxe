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
package org.allbinary.game.configuration;

import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GameConfigurationSingleton {
    private static var SINGLETON : GameConfigurationSingleton = new GameConfigurationSingleton();
    private var list : BasicArrayList;
    private var hashtable : ABHashtable<Any, Any>;
    public static function getInstance() : GameConfigurationSingleton {
        return GameConfigurationSingleton.SINGLETON;
    }

    public function new() {
        this.list = new BasicArrayListD();
        this.hashtable = StdUtil.getInstance().createHashtable();
    }

    public function getInstanceByName(name : String) : GameConfiguration {
        return (cast this.hashtable.get(name) : GameConfiguration);
    }

    public function getOptionsBasicArrayList() : BasicArrayList {
        return this.list;
    }

    public function add(gameConfiguration : GameConfiguration) : Void {
        this.list.add(gameConfiguration);
    }

    public function getHashtable() : ABHashtable<Any, Any> {
        return this.hashtable;
    }

}

