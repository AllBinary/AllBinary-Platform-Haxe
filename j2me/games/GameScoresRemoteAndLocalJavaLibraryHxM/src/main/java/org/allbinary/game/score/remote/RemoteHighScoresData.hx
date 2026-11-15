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
package org.allbinary.game.score.remote;


class RemoteHighScoresData {
    private static final SINGLETON : RemoteHighScoresData = new RemoteHighScoresData();
    public static function getInstance() : RemoteHighScoresData {
        return RemoteHighScoresData.SINGLETON;
    }

    public final HIGH_SCORES : String = "HIGH_SCORES";
    public var CUSTOMER_USER_NAME : String = "CUSTOMER_USER_NAME";
    public var DISPLAY_NAME : String = "DISPLAY_NAME";
    public var SCORE : String = "SCORE";
    public var GAME_INFO : String = "GAME_INFO";
    public var GAME_CONFIGURATION : String = "GAME_CONFIGURATION";
    public function new() {
    }
}

