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
package org.allbinary.game.layer.drop;

import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class DropLayerFactory {
    private static final DROP_LAYER_FACTORY : DropLayerFactory = new DropLayerFactory();
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function clear() : Void {
        this.list.clear();
    }

    public static function getInstance() : DropLayerFactory {
        return DropLayerFactory.DROP_LAYER_FACTORY;
    }

    public function getSize() : Int {
        return this.list.size();
    }

    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    public function getRandomInstance() : PickedUpLayerInterfaceFactoryInterface {
        return (cast this.basicArrayListUtil.getRandom(this.list) : PickedUpLayerInterfaceFactoryInterface);
    }

    public function add(layerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface) : Void {
        this.list.add(layerInterfaceFactoryInterface);
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

}

