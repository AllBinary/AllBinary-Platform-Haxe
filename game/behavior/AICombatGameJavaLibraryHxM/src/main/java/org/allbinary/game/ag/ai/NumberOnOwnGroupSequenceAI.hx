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
package org.allbinary.game.ag.ai;

import org.allbinary.ai.ArtificialIntelligenceInterface;
import org.allbinary.game.ag.ai.sequence.SequenceAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.layer.identification.GroupLayerManagerListener;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;

class NumberOnOwnGroupSequenceAI extends SequenceAI {
    private var numberOnSameTeam : haxe.ds.Vector<Null<Int>>;
    public function new(numberOnSameTeam : haxe.ds.Vector<Null<Int>>, artificialIntelligenceInterface : haxe.ds.Vector<ArtificialIntelligenceInterface>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(artificialIntelligenceInterface, ownerLayerInterface, gameInput);
        this.numberOnSameTeam = numberOnSameTeam;
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        final layerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        var index : Int = this.getIndex();
        if (this.numberOnSameTeam.length > index) {
            final size : Int = GroupLayerManagerListener.getInstance().getGroupSizeFromInterface(layerInterface);
            if (Std.int(this.numberOnSameTeam[index]) > size) {
                this.next();
            }
        }
        super.processAI(allBinaryLayerManager);
    }

}

