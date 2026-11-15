/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

import org.allbinary.logic.NullUtil;

class LastFetchHighScoresFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : LastFetchHighScoresFactory {
        if (LastFetchHighScoresFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            LastFetchHighScoresFactory.instance = new LastFetchHighScoresFactory();
        }
        return (cast LastFetchHighScoresFactory.instance : LastFetchHighScoresFactory);
    }

    public var highScoresArray : haxe.ds.Vector<HighScores> = NoHighScoresFactory.getInstance().NO_HIGH_SCORES;
    public function new() {
    }
}

