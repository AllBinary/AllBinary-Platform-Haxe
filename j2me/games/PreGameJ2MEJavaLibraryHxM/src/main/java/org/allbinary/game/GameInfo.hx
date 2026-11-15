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
package org.allbinary.game;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.StdUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.util.ABHashtable;

class GameInfo {
    public static final NONE : GameInfo = new GameInfo(GameTypeFactory.getInstance().NONE, GameMode.NONE, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, -1, -1);
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final LEVEL_NAME : String = "LEVEL";
    private final gameInfoData : GameInfoData = GameInfoData.getInstance();
    private final gameType : GameType;
    private final gameMode : GameMode;
    private final playerType : PlayerType;
    private var highestLevel : Int = 0;
    private var currentLevel : Int;
    public function new(gameType : GameType, gameMode : GameMode, playerType : PlayerType, highestLevel : Int, currentLevel : Int) {
        this.gameType = gameType;
        this.gameMode = gameMode;
        this.setHighestLevel(highestLevel);
        this.currentLevel = currentLevel;
        this.playerType = playerType;
    }

    public function getGameType() : GameType {
        return this.gameType;
    }

    public function getGameMode() : GameMode {
        return this.gameMode;
    }

    public function getPlayerType() : PlayerType {
        return this.playerType;
    }

    public function getHighestLevel() : Int {
        return this.highestLevel;
    }

    public function setHighestLevel(highestLevel : Int) : Void {
        this.highestLevel = highestLevel;
    }

    public function getCurrentLevel() : Int {
        return this.currentLevel;
    }

    private final NEW_LEVEL : String = "New Level: ";
    private final SET_CURRENT_LEVEL : String = "setCurrentLevel";
    public function setCurrentLevel(currentLevel : Int) : Void {
        this.currentLevel = currentLevel;
        this.logUtil.putF(new StringMaker().append(this.NEW_LEVEL).appendint(this.getCurrentLevel()).toString(), this, this.SET_CURRENT_LEVEL);
    }

    private final NEXT_GAME_LEVEL : String = "nextGameLevel";
    public function nextGameLevel() : Void {
        if (this.getCurrentLevel() < this.getHighestLevel()) {
            this.currentLevel++;
        }
        this.logUtil.putF(new StringMaker().append(CommonLabels.getInstance().NEXT).append(CommonSeps.getInstance().SPACE).append(this.NEW_LEVEL).appendint(this.getCurrentLevel()).toString(), this, this.NEXT_GAME_LEVEL);
    }

    public function previousGameLevel() : Void {
        if (this.getCurrentLevel() > 1) {
            this.currentLevel--;
        }
    }

    public function isLastLevel() : Bool {
        if (this.getCurrentLevel() >= this.getHighestLevel()) {
            return true;
        } else {
            return false;
        }
    }

    public function toHashtable() : ABHashtable<Any, Any> {
        final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        hashtable.put(this.gameInfoData.GAME_TYPE, this.getGameType().toString());
        hashtable.put(this.gameInfoData.GAME_MODE, this.gameMode.toString());
        hashtable.put(this.gameInfoData.PLAYER_TYPE, this.playerType.toString());
        hashtable.put(this.gameInfoData.HIGHEST_LEVEL, Std.string(this.getHighestLevel()));
        hashtable.put(this.gameInfoData.CURRENT_LEVEL, Std.string(this.currentLevel));
        return hashtable;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        stringBuffer.append(this.gameInfoData.GAME_TYPE);
        stringBuffer.append(commonSeps.EQUALS);
        stringBuffer.append(this.getGameType().toString());
        stringBuffer.append(commonSeps.COMMA_SEP);
        stringBuffer.append(this.gameInfoData.GAME_MODE);
        stringBuffer.append(commonSeps.EQUALS);
        stringBuffer.append(this.gameMode.toString());
        stringBuffer.append(commonSeps.COMMA_SEP);
        stringBuffer.append(this.gameInfoData.PLAYER_TYPE);
        stringBuffer.append(commonSeps.EQUALS);
        stringBuffer.append(StringUtil.getInstance().toString(this.playerType));
        stringBuffer.append(commonSeps.COMMA_SEP);
        stringBuffer.append(this.gameInfoData.HIGHEST_LEVEL);
        stringBuffer.append(commonSeps.EQUALS);
        stringBuffer.appendint(this.getHighestLevel());
        stringBuffer.append(commonSeps.COMMA_SEP);
        stringBuffer.append(this.gameInfoData.CURRENT_LEVEL);
        stringBuffer.append(commonSeps.EQUALS);
        stringBuffer.appendint(this.currentLevel);
        return stringBuffer.toString();
    }

}

