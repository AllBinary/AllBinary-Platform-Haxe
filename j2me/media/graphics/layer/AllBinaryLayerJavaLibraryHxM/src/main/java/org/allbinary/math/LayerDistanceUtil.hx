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
package org.allbinary.math;

import org.allbinary.graphics.GPoint;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.math.MathUtil;

class LayerDistanceUtil {
    private static final instance : LayerDistanceUtil = new LayerDistanceUtil();
    public static function getInstance() : LayerDistanceUtil {
        return LayerDistanceUtil.instance;
    }

    private final mathUtil : MathUtil = MathUtil.getInstance();
    public function getDistance(layerInterface : AllBinaryLayer, layerInterface2 : AllBinaryLayer) : Int {
        final dx : Int = (layerInterface.getXP() + layerInterface.getHalfWidth()) - (layerInterface2.getXP() + layerInterface2.getHalfWidth());
        final dy : Int = (layerInterface.getYP() + layerInterface.getHalfHeight()) - (layerInterface2.getYP() + layerInterface2.getHalfHeight());
        return Std.int(this.mathUtil.sqrt((dx * dx) + (dy * dy)));
    }

    public function getDistance3D(layerInterface : AllBinaryLayer, layerInterface2 : AllBinaryLayer) : Int {
        final dx : Int = (layerInterface.getXP() + layerInterface.getHalfWidth()) - (layerInterface2.getXP() + layerInterface2.getHalfWidth());
        final dy : Int = (layerInterface.getYP() + layerInterface.getHalfHeight()) - (layerInterface2.getYP() + layerInterface2.getHalfHeight());
        final dz : Int = (layerInterface.getZP() + layerInterface.getHalfDepth()) - (layerInterface2.getZP() + layerInterface2.getHalfDepth());
        return Std.int(this.mathUtil.sqrt((dx * dx) + (dy * dy) + (dz * dz)));
    }

    public function getDistanceAt(layerInterface : AllBinaryLayer, point : GPoint) : Int {
        final dx : Int = layerInterface.getXP() - point.getX();
        final dy : Int = layerInterface.getYP() - point.getY();
        return Std.int(this.mathUtil.sqrt((dx * dx) + (dy * dy)));
    }

    public function new() {
    }
}

