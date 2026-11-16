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
import org.allbinary.game.ag.ai.tactical.BasicRandomAIFactory;
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.util.ABHashtable;

class DiveAndDirectionalTrackingAIFactory implements ArtificialIntelligenceInterfaceFactoryInterface {
    // throws Exception
    public function getInstanceFor(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) : ArtificialIntelligenceInterface {
        var visitorCanBeNull : Any = hashtable.get((cast BasicAI.AI_VISITOR : Any));
        if (visitorCanBeNull == null) {
            visitorCanBeNull = ThrustAIVisitorFactory.getInstance();
        }
        final hashtable2 : ABHashtable<Any, Any> = new BasicProbabilityAIDataFactory().getInstanceFor();
        hashtable2.put(BasicAI.AI_VISITOR, LastKeyAIVisitorFactory.getInstance());
        final artificialIntelligenceInterface : ArtificialIntelligenceInterface = new BasicRandomAIFactory().getInstanceFor(hashtable2, ownerLayerInterface, gameInput);
        return new DiveAndDirectionalTrackingAI(ownerLayerInterface, artificialIntelligenceInterface, gameInput, (cast visitorCanBeNull : Visitor));
    }

    public function new() {
    }
}

