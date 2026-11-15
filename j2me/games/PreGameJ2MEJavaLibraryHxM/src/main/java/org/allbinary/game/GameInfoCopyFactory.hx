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


class GameInfoCopyFactory {
    public static function getInstanceMaxLevel(gameInfo : GameInfo, maxLevel : Int) : GameInfo {
        return new GameInfo(gameInfo.getGameType(), gameInfo.getGameMode(), gameInfo.getPlayerType(), maxLevel, gameInfo.getCurrentLevel());
    }

    public static function getInstance(gameInfo : GameInfo) : GameInfo {
        return new GameInfo(gameInfo.getGameType(), gameInfo.getGameMode(), gameInfo.getPlayerType(), gameInfo.getHighestLevel(), gameInfo.getCurrentLevel());
    }

    public function new() {
    }
}

