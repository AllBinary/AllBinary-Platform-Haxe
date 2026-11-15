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
package org.allbinary.game.layer.pickup;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CountedPickedUpLayerInterfaceFactoryPool {
    private static var SINGLETON : CountedPickedUpLayerInterfaceFactoryPool = new CountedPickedUpLayerInterfaceFactoryPool();
    private var list : BasicArrayList;
    public function new() {
        this.list = new BasicArrayListD();
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

    public static function getInstance() : CountedPickedUpLayerInterfaceFactoryPool {
        return CountedPickedUpLayerInterfaceFactoryPool.SINGLETON;
    }

    public static function init() : Void {
        CountedPickedUpLayerInterfaceFactoryPool.SINGLETON = new CountedPickedUpLayerInterfaceFactoryPool();
    }

}

