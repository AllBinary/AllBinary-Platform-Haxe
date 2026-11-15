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
package org.allbinary.ai;

import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerProcessor;

class OptimizedArtificialIntelligenceLayerProcessorForCollidableLayer extends LayerProcessor {
    public function new() {
        super(new OptimizedArtificialIntelligenceLayerManager());
    }

    // throws Exception
    public override function processAt(allBinaryLayerManager : AllBinaryLayerManager, layerInterface : AllBinaryLayer, index : Int) : Void {
        var artificialIntelligenceCompositeInterface : CollidableCompositeLayer = (cast layerInterface : CollidableCompositeLayer);
        artificialIntelligenceCompositeInterface.getArtificialIntelligenceInterface().processAI(allBinaryLayerManager);
    }

    // throws Exception
    public override function isProcessorLayer(layerInterface : AllBinaryLayer) : Bool {
        if (layerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
            return true;
        } else {
            return false;
        }
    }

}

