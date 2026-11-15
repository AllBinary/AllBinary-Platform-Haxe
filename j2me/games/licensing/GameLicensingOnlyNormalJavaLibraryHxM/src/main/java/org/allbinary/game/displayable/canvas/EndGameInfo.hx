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

import org.allbinary.game.GameInfo;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.logic.string.StringUtil;

class EndGameInfo {
    private final NORMAL_GAME_OVER : String = "Game Over";
    public final NORMAL_GAME_OVER_WIN : String = "You Won";
    private var gameOverStr : String = StringUtil.getInstance().EMPTY_STRING;
    private var winStr : String;
    public function new() {
        this.winStr = this.gameOverStr;
    }

    public function update(gameInfo : GameInfo, myCanvas : MyCanvas) : Void {
        this.setGameOverStr(this.NORMAL_GAME_OVER);
        this.setWinStr(this.NORMAL_GAME_OVER_WIN);
    }

    public function getGameOverStr() : String {
        return this.gameOverStr;
    }

    public function setGameOverStr(gameOverStr : String) : Void {
        this.gameOverStr = gameOverStr;
    }

    public function getWinStr() : String {
        return this.winStr;
    }

    public function setWinStr(winStr : String) : Void {
        this.winStr = winStr;
    }

}

