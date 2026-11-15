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
package org.allbinary.game.score;

import org.allbinary.game.GameInfo;
import org.allbinary.string.CommonStrings;

class HighScoresBase implements HighScoresFactoryInterface {
    public var commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    public function fetchHighScores(gameInfo : GameInfo, highScoresResultsListener : HighScoresResultsListener) : Void {
        throw new haxe.Exception();
    }

    public function fetchHighScoresPreload(gameInfo : GameInfo, highScoresResultsListener : HighScoresResultsListener, preload : Bool) : Void {
        throw new haxe.Exception();
    }

    public function createHighScoresHelper() : HighScoresHelperBaseInterface {
        throw new haxe.Exception();
    }

}

