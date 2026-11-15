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

import org.allbinary.logic.string.StringUtil;

class PickedUpLayerTypeFactory {
    private static final instance : PickedUpLayerTypeFactory = new PickedUpLayerTypeFactory();
    public static function getInstance() : PickedUpLayerTypeFactory {
        return PickedUpLayerTypeFactory.instance;
    }

    public var NONE : PickedUpLayerType = new PickedUpLayerType(StringUtil.getInstance().NULL_STRING);
    public var BEAM : PickedUpLayerType = new PickedUpLayerType("BEAM");
    public var MINE : PickedUpLayerType = new PickedUpLayerType("MINE");
    public var PROJECTILE : PickedUpLayerType = new PickedUpLayerType("PROJECTILE");
    public var ENHANCEMENT : PickedUpLayerType = new PickedUpLayerType("Enhancement");
    public var MORPH : PickedUpLayerType = new PickedUpLayerType("Morph");
    public var PART : PickedUpLayerType = new PickedUpLayerType("Part");
    public var HEAL : PickedUpLayerType = new PickedUpLayerType("Heal");
    public var LIFE : PickedUpLayerType = new PickedUpLayerType("Life");
    public var POINTS : PickedUpLayerType = new PickedUpLayerType("Points");
    public function new() {
    }
}

