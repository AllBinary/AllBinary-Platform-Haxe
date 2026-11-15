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
package org.allbinary.game.displayable.canvas;

import org.allbinary.canvas.Processor;

class EndLevelIntermissionProcessor extends Processor {
    private var gameCanvas : AllBinaryGameCanvas;
    public function new(gameCanvas : AllBinaryGameCanvas) {
        super();
        this.gameCanvas = gameCanvas;
    }

    // throws Exception
    public override function process() : Void {
        this.gameCanvas.processEndLevelIntermissionGameState();
    }

}

