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

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.ItemStateListener;
import org.allbinary.game.state.GameStateCompositeInterface;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.thread.RunnableInterface;
import org.allbinary.util.ABHashtable;

interface GameCanvasRunnableInterface extends RunnableInterface extends PaintableInterface extends ItemStateListener extends GameStateCompositeInterface {
    function getTitle() : String;

    function isInitialized() : Bool;

    function isPaused() : Bool;

    function unPause() : Void;

    function pause() : Void;

    function isHighScoreSubmitted() : Bool;

    // throws Exception
    function setHighScoreSubmitted(highScoreSubmitted : Bool) : Void;

    // throws Exception
    function processGameOver() : Void;

    function isGameOver() : Bool;

    function initCommands(cmdListener : CommandListener) : Void;

    // throws Exception
    function getCurrentStateHashtable() : ABHashtable<Any, Any>;

    // throws Exception
    function getLoadStateHashtable() : ABHashtable<Any, Any>;

    // throws Exception
    function setLoadStateHashtable(hashtable : ABHashtable<Any, Any>) : Void;

    function getType() : Int;

}

