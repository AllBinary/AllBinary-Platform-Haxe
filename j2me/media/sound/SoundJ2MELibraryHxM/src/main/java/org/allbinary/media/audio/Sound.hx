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
package org.allbinary.media.audio;

import javax.microedition.media.Player;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;

class Sound implements SoundInterface implements Runnable {
    private var resource : String;
    public var player : Player = NoPlayer.NO_PLAYER;
    public function new(resource : String) {
        this.resource = resource;
    }

    public function getResource() : String {
        return this.resource;
    }

    public function getPlayerP() : Player {
        return this.player;
    }

    public function setPlayerP(player : Player) : Void {
        this.player = player;
    }

    // throws Exception
    public function init() : Void {
    }

    public function getDuration() : Int {
        return -1;
    }

    public function run() : Void {
        try {
            this.player.start();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN);
        }
    }

}

