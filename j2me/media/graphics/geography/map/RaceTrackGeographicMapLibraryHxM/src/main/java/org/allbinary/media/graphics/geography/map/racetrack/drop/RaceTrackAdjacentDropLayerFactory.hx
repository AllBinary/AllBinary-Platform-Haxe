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
package org.allbinary.media.graphics.geography.map.racetrack.drop;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;
import org.allbinary.layer.LayerInterfaceFactoryInterface;

class RaceTrackAdjacentDropLayerFactory {
    private static var DROP_LAYER_FACTORY : RaceTrackAdjacentDropLayerFactory = new RaceTrackAdjacentDropLayerFactory();
    private var list : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function clear() : Void {
        this.list.clear();
    }

    public static function getInstance() : RaceTrackAdjacentDropLayerFactory {
        return RaceTrackAdjacentDropLayerFactory.DROP_LAYER_FACTORY;
    }

    public function getSize() : Int {
        return this.list.size();
    }

    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    public function getRandomInstance() : LayerInterfaceFactoryInterface {
        return (cast this.basicArrayListUtil.getRandom(this.list) : LayerInterfaceFactoryInterface);
    }

    public function add(layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface) : Void {
        this.list.add(layerInterfaceFactoryInterface);
    }

}

