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

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerProcessor;

class ArtificialIntelligenceLayerProcessor extends LayerProcessor {
    public function new() {
        super(new ArtificialIntelligenceLayerManager());
    }

    // throws Exception
    public override function processAt(allBinaryLayerManager : AllBinaryLayerManager, layerInterface : AllBinaryLayer, index : Int) : Void {
        var artificialIntelligenceCompositeInterface : ArtificialIntelligenceCompositeInterface = (cast layerInterface : ArtificialIntelligenceCompositeInterface);
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

