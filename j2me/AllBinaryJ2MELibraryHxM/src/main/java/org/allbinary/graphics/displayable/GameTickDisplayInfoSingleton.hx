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
package org.allbinary.graphics.displayable;


class GameTickDisplayInfoSingleton {
    private static final instance : GameTickDisplayInfoSingleton = new GameTickDisplayInfoSingleton();
    public static function getInstance() : GameTickDisplayInfoSingleton {
        return GameTickDisplayInfoSingleton.instance;
    }

    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private var lastWidth : Int = this.displayInfoSingleton.getLastWidth();
    private var lastHeight : Int = this.displayInfoSingleton.getLastHeight();
    private var lastHalfWidth : Int = this.displayInfoSingleton.getLastHalfWidth();
    private var lastHalfHeight : Int = this.displayInfoSingleton.getLastHalfHeight();
    public function update() : Void {
        this.lastWidth = this.displayInfoSingleton.getLastWidth();
        this.lastHeight = this.displayInfoSingleton.getLastHeight();
        this.lastHalfWidth = this.displayInfoSingleton.getLastHalfWidth();
        this.lastHalfHeight = this.displayInfoSingleton.getLastHalfHeight();
    }

    public function getLastWidth() : Int {
        return this.lastWidth;
    }

    public function getLastHeight() : Int {
        return this.lastHeight;
    }

    public function getLastHalfWidth() : Int {
        return this.lastHalfWidth;
    }

    public function getLastHalfHeight() : Int {
        return this.lastHalfHeight;
    }

    public function new() {
    }
}

