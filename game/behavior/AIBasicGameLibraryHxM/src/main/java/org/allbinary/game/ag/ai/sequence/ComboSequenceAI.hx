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
package org.allbinary.game.ag.ai.sequence;

import org.allbinary.ai.ArtificialIntelligenceInterface;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;

class ComboSequenceAI extends SequenceAI {
    public function new(artificialIntelligenceInterface : haxe.ds.Vector<ArtificialIntelligenceInterface>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(artificialIntelligenceInterface, ownerLayerInterface, gameInput);
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        final artificialIntelligenceInterfaceArray : haxe.ds.Vector<ArtificialIntelligenceInterface> = this.getArtificialIntelligenceInterface();
        final size : Int = artificialIntelligenceInterfaceArray.length;
        for (index in 0...size) {
            this.setIndex(index);
            super.processAI(allBinaryLayerManager);
        }
    }

}

