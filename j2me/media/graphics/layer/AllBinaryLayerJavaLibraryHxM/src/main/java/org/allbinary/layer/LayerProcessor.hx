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
package org.allbinary.layer;

import org.allbinary.string.CommonStrings;

class LayerProcessor implements LayerProcessorInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final layerManager : LayerManager;
    public function new(layerManager : LayerManager) {
        this.layerManager = layerManager;
    }

    // throws Exception
    public function processAt(allBinaryLayerManager : AllBinaryLayerManager, layerInterface : AllBinaryLayer, index : Int) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function isProcessorLayer(layerInterface : AllBinaryLayer) : Bool {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function getLayerManager() : LayerManager {
        return this.layerManager;
    }

    // throws Exception
    public function process(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        var layerManager : LayerManager = this.getLayerManager();
        var size : Int = layerManager.getSize();
        for (index in 0...size) {
            this.processAt(allBinaryLayerManager, (cast layerManager.getLayerAt(index) : AllBinaryLayer), index);
        }
    }

}

