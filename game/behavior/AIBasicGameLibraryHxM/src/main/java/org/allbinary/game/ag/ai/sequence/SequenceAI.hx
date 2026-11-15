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

import org.allbinary.ai.ArtificialIntelligence;
import org.allbinary.ai.ArtificialIntelligenceInterface;
import org.allbinary.ai.ArtificialIntelligenceTransitionInterface;
import org.allbinary.game.ag.ai.ArrayAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class SequenceAI extends ArrayAI {
    private static final SEQUENCE_AI : String = "Sequence AI";
    private var index : Int = 0;
    public function new(artificialIntelligenceInterfaceArray : haxe.ds.Vector<ArtificialIntelligenceInterface>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(artificialIntelligenceInterfaceArray, ownerLayerInterface, gameInput);
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        this.getArtificialIntelligenceInterface()[this.index].processAI(allBinaryLayerManager);
    }

    public function next() : Void {
        this.index++;
        final artificialIntelligenceInterface : ArtificialIntelligenceInterface = this.getSelectedArtificialIntelligenceInterface();
        if (artificialIntelligenceInterface.getId() == ArtificialIntelligence.AI_ID) {
            final artificialIntelligenceTransitionInterface : ArtificialIntelligenceTransitionInterface = (cast artificialIntelligenceInterface : ArtificialIntelligenceTransitionInterface);
            artificialIntelligenceTransitionInterface.transition();
        }
    }

    public function getIndex() : Int {
        return this.index;
    }

    public function setIndex(index : Int) : Void {
        this.index = index;
    }

    public function getSelectedArtificialIntelligenceInterface() : ArtificialIntelligenceInterface {
        return this.getArtificialIntelligenceInterface()[this.index];
    }

    public override function getName() : String {
        return SequenceAI.SEQUENCE_AI;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(" Selected AI: ");
        stringBuffer.append(StringUtil.getInstance().toString(this.getSelectedArtificialIntelligenceInterface()));
        return Std.string(stringBuffer);
    }

}

