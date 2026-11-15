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
package org.allbinary.layer.event;

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.LayerManager;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class LayerManagerEvent extends AllBinaryEventObject {
    private var layerInterface : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    private final crud : String;
    public function new(layerManager : LayerManager, crud : String) {
        super(layerManager);
        this.crud = crud;
    }

    public function getLayerInterface() : AllBinaryLayer {
        return this.layerInterface;
    }

    public function setLayerInterface(layerInterface : AllBinaryLayer) : Void {
        this.layerInterface = layerInterface;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("LayerManagerEvent: \n");
        stringBuffer.append("LayerInterface: ");
        stringBuffer.append(this.getLayerInterface().toString());
        stringBuffer.append("\nCRUD: ");
        stringBuffer.append(this.crud);
        return stringBuffer.toString();
    }

}

