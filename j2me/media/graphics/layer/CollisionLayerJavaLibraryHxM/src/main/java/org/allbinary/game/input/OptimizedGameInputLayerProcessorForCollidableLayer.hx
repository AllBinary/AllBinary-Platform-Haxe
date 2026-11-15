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
package org.allbinary.game.input;

import org.allbinary.game.layer.AllBinaryGameLayer;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerProcessor;

class OptimizedGameInputLayerProcessorForCollidableLayer extends LayerProcessor {
    public function new() {
        super(new OptimizedGameInputLayerManager());
    }

    // throws Exception
    public override function processAt(allBinaryLayerManager : AllBinaryLayerManager, layerInterface : AllBinaryLayer, index : Int) : Void {
        final gameInputInterface : AllBinaryGameLayer = (cast layerInterface : AllBinaryGameLayer);
        gameInputInterface.processInput(allBinaryLayerManager);
    }

    public override function isProcessorLayer(layerInterface : AllBinaryLayer) : Bool {
        if (layerInterface.implmentsGameInputInterface()) {
            return true;
        } else {
            return false;
        }
    }

}

