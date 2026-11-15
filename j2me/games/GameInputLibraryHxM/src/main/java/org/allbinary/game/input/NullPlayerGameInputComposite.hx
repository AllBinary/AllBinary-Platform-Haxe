/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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

import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.string.StringUtil;

class NullPlayerGameInputComposite implements PlayerGameInputCompositeInterface {
    public static final NULL_PLAYER_GAME_INPUT_COMPOSITE : NullPlayerGameInputComposite = new NullPlayerGameInputComposite();
    public function getName() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    // throws Exception
    public function processInput(layerManager : AllBinaryLayerManager) : Void {
    }

    public function initInputProcessors() : Void {
    }

    public function getPlayerGameInput() : PlayerGameInput {
        return NoPlayerGameInput.getInstance();
    }

    public function new() {
    }
}

