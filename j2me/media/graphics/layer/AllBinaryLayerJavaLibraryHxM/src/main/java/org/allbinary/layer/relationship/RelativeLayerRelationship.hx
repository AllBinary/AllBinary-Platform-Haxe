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
package org.allbinary.layer.relationship;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.util.BasicArrayList;

class RelativeLayerRelationship extends RelativeRelationship {
    private var layer : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    public function new(layer : AllBinaryLayer, point : GPoint, typesAllowedList : BasicArrayList) {
        super(point, typesAllowedList);
        this.layer = layer;
    }

    public override function getX() : Int {
        return this.layer.getXP() + super.getX();
    }

    public override function getY() : Int {
        return this.layer.getYP() + super.getY();
    }

    public override function getZ() : Int {
        return this.layer.getZP() + super.getZ();
    }

}

