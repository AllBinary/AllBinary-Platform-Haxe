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
    public final NORMAL_GAME_OVER_WIN : String = "You Won";
    private final TEASER_DEMO_GAME_END_LAST_LEVEL : String = "End of Demo.";
    private final TEASER_DEMO_GAME_END : String = "Demo Game Over.";
    private var gameOverStr : String = StringUtil.getInstance().EMPTY_STRING;
    private var winStr : String;
    public function update(gameInfo : GameInfo, myCanvas : MyCanvas) : Void {
        if (gameInfo.isLastLevel()) {
            this.setWinStr(this.TEASER_DEMO_GAME_END_LAST_LEVEL);
            this.setGameOverStr(this.TEASER_DEMO_GAME_END_LAST_LEVEL);
        } else {
            this.setWinStr(this.NORMAL_GAME_OVER_WIN);
            this.setGameOverStr(this.TEASER_DEMO_GAME_END);
        }
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

    public function new() {
        this.winStr = this.gameOverStr;
    }
}

