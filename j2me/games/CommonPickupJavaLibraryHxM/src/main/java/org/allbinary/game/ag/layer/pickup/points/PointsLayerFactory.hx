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
package org.allbinary.game.ag.layer.pickup.points;

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerFactoryInterface;

class PointsLayerFactory implements AllBinaryLayerFactoryInterface {
    private final points : Int;
    public function new(points : Int) {
        this.points = points;
    }

    // throws Exception
    public function getInstance() : AllBinaryLayer {
        return new PointsLayer(this.points);
    }

}

