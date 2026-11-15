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
package org.allbinary.game.tracking;

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class TrackingEvent extends AllBinaryEventObject {
    private var layerInterface : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    public function new(allBinaryLayerInterface : Any) {
        super(allBinaryLayerInterface);
        if (allBinaryLayerInterface != TrackingEventHandler.getInstance()) {
            this.setLayerInterface((cast allBinaryLayerInterface : AllBinaryLayer));
        }
    }

    public function init(anyType : Any) : Void {
        this.setSource(anyType);
    }

    public function getLayerInterface() : AllBinaryLayer {
        return this.layerInterface;
    }

    private function setLayerInterface(layerInterface : AllBinaryLayer) : Void {
        this.layerInterface = layerInterface;
    }

    public function setLayerInterfaceForCircularStaticPool(layerInterface : AllBinaryLayer) : Void {
        this.layerInterface = layerInterface;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("TrackingEvent: \n");
        stringBuffer.append("LayerInterface: ");
        stringBuffer.append(Std.string(this.layerInterface));
        return Std.string(stringBuffer);
    }

}

