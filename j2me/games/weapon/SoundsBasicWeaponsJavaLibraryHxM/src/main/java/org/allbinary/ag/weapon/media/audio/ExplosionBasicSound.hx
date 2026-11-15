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
package org.allbinary.ag.weapon.media.audio;

import org.allbinary.media.audio.CompositeSound;
import org.allbinary.media.audio.Sound;

class ExplosionBasicSound extends CompositeSound {
    private static var soundInterface : Sound = new ExplosionBasicSound();
    public function new() {
        super("resource:/wav/explosion.wav");
    }

    public static function getInstance() : Sound {
        return ExplosionBasicSound.soundInterface;
    }

}

