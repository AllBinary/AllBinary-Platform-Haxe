/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot  
 */
// Generated Code Do Not Modify
package org.allbinary.game.layer;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class RTSLayerEvent extends AllBinaryEventObject {
    private var rtsLayer : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    public function new(rtsLayer : PathFindingLayerInterface) {
        super(rtsLayer);
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("RTSLayerEvent: \n");
        stringBuffer.append("RTSLayer: ");
        stringBuffer.append(this.getRtsLayer().toString());
        return stringBuffer.toString();
    }

    public function getRtsLayer() : PathFindingLayerInterface {
        return this.rtsLayer;
    }

    public function setRtsLayer(rtsLayer : PathFindingLayerInterface) : Void {
        this.rtsLayer = rtsLayer;
    }

}

