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

import org.allbinary.layer.AllBinaryLayerManager;

class ArtificialIntelligence implements ArtificialIntelligenceInterface {
    public static final AI_ID : Int = 2;
    private static final instance : ArtificialIntelligence = new ArtificialIntelligence();
    public static function getInstance() : ArtificialIntelligence {
        return ArtificialIntelligence.instance;
    }

    public function new() {
    }

    // throws Exception
    public function processAI(layerManager : AllBinaryLayerManager) : Void {
    }

    public function getId() : Int {
        return 1;
    }

}

