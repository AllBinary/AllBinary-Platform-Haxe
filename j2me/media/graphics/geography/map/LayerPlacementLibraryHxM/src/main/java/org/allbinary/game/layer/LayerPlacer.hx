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

//import java.util.Enumeration;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.LayerInterfaceFactory;
import org.allbinary.layer.LayerInterfaceVisitor;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.EnumerationUtil;

class LayerPlacer {
    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    public final layerInterfaceVisitor : LayerInterfaceVisitor;
    private final dimension : GPoint;
    public function new(layerInterfaceVisitor : LayerInterfaceVisitor, dimension : GPoint) {
        this.layerInterfaceVisitor = layerInterfaceVisitor;
        this.dimension = dimension;
    }

    // throws Exception
    public function processList(list : BasicArrayList) : Void {
        final size : Int = list.size();
        var layerPlacementInterface : LayerPlacementInterface = null;
        for (index in 0...size) {
            layerPlacementInterface = (cast list.objectArray[index] : LayerPlacementInterface);
            this.process(layerPlacementInterface);
        }
    }

    // throws Exception
    public function process(layerPlacementInterface : LayerPlacementInterface) : Void {
        final relativePoint : GPoint = this.getPoint(layerPlacementInterface);
        final layerInterfaceFactory : LayerInterfaceFactory = LayerInterfaceFactory.getInstance();
        final hashtable : ABHashtable<Any, Any> = layerPlacementInterface.getInstance();
        final enumeration : Enumeration = hashtable.keys();
        var point : GPoint = null;
        var layerHashtable : ABHashtable<Any, Any> = null;
        var x : Int = 0;
        var y : Int = 0;
        var z : Int = 0;
        var layerInterface : AllBinaryLayer = null;
        while (this.enumerationUtil.hasMoreElements(enumeration)) {
            point = (cast this.enumerationUtil.nextElement(enumeration) : GPoint);
            layerHashtable = (cast hashtable.get(point) : ABHashtable<Any, Any>);
            x = point.getX() + relativePoint.getX();
            y = point.getY() + relativePoint.getY();
            z = point.getZ() + relativePoint.getZ();
            layerInterface = layerInterfaceFactory.getNexInstance(layerHashtable, x, y, z);
            this.layerInterfaceVisitor.visit(layerInterface);
        }
    }

    // throws Exception
    public function getPoint(layerPlacementInterface : LayerPlacementInterface) : GPoint {
        final pointFactory : PointFactory = PointFactory.getInstance();
        final layerPlacementType : LayerPlacementType = layerPlacementInterface.getLayerType();
        if (layerPlacementType == LayerPlacementTypeFactory.getInstance().MAP) {
            final width : Int = layerPlacementInterface.getWidth();
            final height : Int = layerPlacementInterface.getHeight();
            final x : Int = ((this.dimension.getX() - width) / 2);
            final y : Int = ((this.dimension.getY() - height) / 2);
            return pointFactory.createXY(x, y);
        } else if (layerPlacementType == LayerPlacementTypeFactory.getInstance().UP) {
            final width : Int = layerPlacementInterface.getWidth();
            final height : Int = layerPlacementInterface.getHeight();
            final x : Int = ((this.dimension.getX() - width) / 2);
            final y : Int = -height;
            return pointFactory.createXY(x, y);
        } else {
            throw new haxe.Exception("PlacementType Not Recognized");
        }
    }

}

