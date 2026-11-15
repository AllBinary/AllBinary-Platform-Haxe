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
package org.allbinary.game.displayable.canvas;


class NullWaitGameRunnable extends GameRunnable {
    private static final instance : GameRunnable = new NullWaitGameRunnable();
    public static function getInstance() : GameRunnable {
        return NullWaitGameRunnable.instance;
    }

    public function new() {
        super();
    }
}

