/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot  
 */
// Generated Code Do Not Modify
package org.allbinary.media.audio;


class AttackSound extends CompositeSound {
    private static var soundInterface : Sound = new AttackSound();
    public function new() {
        super("resource:/wav/attack.wav");
    }

    public static function getInstance() : Sound {
        return AttackSound.soundInterface;
    }

}

