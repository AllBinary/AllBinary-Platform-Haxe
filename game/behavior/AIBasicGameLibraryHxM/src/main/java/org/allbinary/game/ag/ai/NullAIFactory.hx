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
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.util.ABHashtable;

class NullAIFactory implements ArtificialIntelligenceInterfaceFactoryInterface {
    private static var NULL_AI : NullAI = new NullAI();
    public function getInstance(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) : ArtificialIntelligenceInterface {
        return NullAIFactory.NULL_AI;
    }

    public static function getInstance() : ArtificialIntelligenceInterface {
        return NullAIFactory.NULL_AI;
    }

    public function new() {
    }
}

