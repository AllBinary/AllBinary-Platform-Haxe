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

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Item;
import org.allbinary.game.state.GameState;
import org.allbinary.game.state.GameStateFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.ABHashtable;

class NullGameCanvasRunnable implements GameCanvasRunnableInterface {
    public static final NULL_GAME_CANVAS_RUNNABLE : NullGameCanvasRunnable = new NullGameCanvasRunnable();
    public final gameStateFactory : GameStateFactory = GameStateFactory.getInstance();
    public function getTitle() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function isInitialized() : Bool {
        return false;
    }

    public function isPaused() : Bool {
        return false;
    }

    public function unPause() : Void {
    }

    public function pause() : Void {
    }

    public function isHighScoreSubmitted() : Bool {
        return false;
    }

    // throws Exception
    public function setHighScoreSubmitted(highScoreSubmitted : Bool) : Void {
    }

    // throws Exception
    public function processGameOver() : Void {
    }

    public function isGameOver() : Bool {
        return false;
    }

    public function initCommands(cmdListener : CommandListener) : Void {
    }

    // throws Exception
    public function getCurrentStateHashtable() : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

    // throws Exception
    public function getLoadStateHashtable() : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

    // throws Exception
    public function setLoadStateHashtable(hashtable : ABHashtable<Any, Any>) : Void {
    }

    public function getType() : Int {
        return -1;
    }

    // throws Exception
    public function setGameState(gameState : GameState) : Void {
    }

    public function getGameState() : GameState {
        return this.gameStateFactory.NO_GAME_STATE;
    }

    public function itemStateChanged(item : Item) : Void {
    }

    public function paint(graphics : Graphics) : Void {
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

    public function isRunning() : Bool {
        return false;
    }

    public function setRunning(isRunning : Bool) : Void {
    }

    // throws Exception
    public function setThread(thread : Thread) : Void {
    }

    public function run() : Void {
    }

    public function new() {
    }
}

