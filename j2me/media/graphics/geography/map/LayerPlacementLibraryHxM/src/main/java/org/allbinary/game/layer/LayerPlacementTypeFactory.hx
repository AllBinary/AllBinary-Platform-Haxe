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

import org.allbinary.direction.DirectionFactory;

class LayerPlacementTypeFactory {
    private static final instance : LayerPlacementTypeFactory = new LayerPlacementTypeFactory();
    public static function getInstance() : LayerPlacementTypeFactory {
        return LayerPlacementTypeFactory.instance;
    }

    public final MAP : LayerPlacementType = new LayerPlacementType(Integer.MAX_VALUE);
    public final LEFT : LayerPlacementType = new LayerPlacementType(DirectionFactory.getInstance().LEFT.getValue());
    public final DOWN : LayerPlacementType = new LayerPlacementType(DirectionFactory.getInstance().DOWN.getValue());
    public final UP : LayerPlacementType = new LayerPlacementType(DirectionFactory.getInstance().UP.getValue());
    public final RIGHT : LayerPlacementType = new LayerPlacementType(DirectionFactory.getInstance().RIGHT.getValue());
    public function new() {
    }
}

