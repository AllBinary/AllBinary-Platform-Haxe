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
package org.allbinary.game.layer.drop;

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.BasicLayerProcessor;
import org.allbinary.util.BasicArrayList;

class DropLayerProcessor extends BasicLayerProcessor {
    private static final LAYER_PROCESSOR : BasicLayerProcessor = new DropLayerProcessor();
    public function new() {
        super();
    }

    public static function getInstance() : BasicLayerProcessor {
        return DropLayerProcessor.LAYER_PROCESSOR;
    }

    // throws Exception
    public override function process(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        final list : BasicArrayList = this.getList();
        final size : Int = list.size();
        var layerInterface : AllBinaryLayer = null;
        var dropLayerInterface : DropLayerInterface = null;
        for (index in 0...size) {
            layerInterface = (cast list.objectArray[index] : AllBinaryLayer);
            dropLayerInterface = (cast layerInterface : DropLayerInterface);
            layerInterface = (cast dropLayerInterface.getDroppedLayer() : AllBinaryLayer);
            allBinaryLayerManager.append(layerInterface);
        }
        list.clear();
    }

}

