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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import org.allbinary.game.layer.AllBinaryGameLayerManager;

class NullAllBinaryGameCanvas implements AllBinaryGameCanvasInterface {
    public static final NULL_ALLBINARY_GAME_CANVAS : NullAllBinaryGameCanvas = new NullAllBinaryGameCanvas();
    public function getLayerManager() : AllBinaryGameLayerManager {
        throw new jre.lang.JavaException();
    }

    public function addCommand(cmd : Command) : Void {
        throw new jre.lang.JavaException();
    }

    public function getHeight() : Int {
        throw new jre.lang.JavaException();
    }

    public function getWidth() : Int {
        throw new jre.lang.JavaException();
    }

    public function removeCommand(cmd : Command) : Void {
        throw new jre.lang.JavaException();
    }

    public function setCommandListener(l : CommandListener) : Void {
        throw new jre.lang.JavaException();
    }

    public function new() {
    }
}

