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


class GameInfoData {
    private static final instance : GameInfoData = new GameInfoData();
    public static function getInstance() : GameInfoData {
        return GameInfoData.instance;
    }

    public function new() {
    }

    public final GAME_TYPE : String = "GAME_TYPE";
    public final GAME_MODE : String = "GAME_MODE";
    public final PLAYER_TYPE : String = "PLAYER_TYPE";
    public final HIGHEST_LEVEL : String = "HIGHEST_LEVEL";
    public final CURRENT_LEVEL : String = "CURRENT_LEVEL";
    public final SOFTWARE_INFORMATION : String = "SOFTWARE_INFORMATION";
}

