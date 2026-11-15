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
package org.allbinary.graphics.form;

import org.allbinary.canvas.Processor;
import org.allbinary.game.input.PlayerGameInputCompositeInterface;

class InputProcessor extends Processor {
    private final playerGameInputCompositeInterface : PlayerGameInputCompositeInterface;
    public function new(playerGameInputCompositeInterface : PlayerGameInputCompositeInterface) {
        super();
        this.playerGameInputCompositeInterface = playerGameInputCompositeInterface;
    }

    // throws Exception
    public override function process() : Void {
        this.playerGameInputCompositeInterface.getPlayerGameInput().update();
    }

}

