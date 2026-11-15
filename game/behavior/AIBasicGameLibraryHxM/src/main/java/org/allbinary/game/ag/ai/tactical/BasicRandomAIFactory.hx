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
package org.allbinary.game.ag.ai.tactical;

import org.allbinary.ai.ArtificialIntelligenceInterface;
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.ag.ai.InputProbability;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.util.ABHashtable;

class BasicRandomAIFactory implements ArtificialIntelligenceInterfaceFactoryInterface {
    // throws Exception
    public function getInstance(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) : ArtificialIntelligenceInterface {
        var visitor : Visitor = (cast hashtable.get((cast BasicAI.AI_VISITOR : Any)) : Visitor);
        if (visitor == null) {
            throw new haxe.Exception("No Visitor Provided");
        }
        final inputProbability : InputProbability = (cast hashtable.get((cast InputProbability.INPUT_PROBABILITY : Any)) : InputProbability);
        return new BasicRandomAI(ownerLayerInterface, gameInput, inputProbability, visitor);
    }

    public function new() {
    }
}

