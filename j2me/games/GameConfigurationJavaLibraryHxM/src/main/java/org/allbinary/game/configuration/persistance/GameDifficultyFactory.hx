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
package org.allbinary.game.configuration.persistance;


class GameDifficultyFactory {
    private static final instance : GameDifficultyFactory = new GameDifficultyFactory();
    public static function getInstance() : GameDifficultyFactory {
        return GameDifficultyFactory.instance;
    }

    private var level : Int = 0;
    public function setLevel(level : Int) : Void {
        this.level = level;
    }

    public function getLevel() : Int {
        return this.level;
    }

    public function new() {
    }
}

