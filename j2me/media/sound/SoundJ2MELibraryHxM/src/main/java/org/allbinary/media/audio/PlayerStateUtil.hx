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
package org.allbinary.media.audio;

import javax.microedition.media.Player;
import org.allbinary.string.CommonStrings;

class PlayerStateUtil {
    private static final instance : PlayerStateUtil = new PlayerStateUtil();
    public static function getInstance() : PlayerStateUtil {
        return PlayerStateUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final UNREALIZED : String = "UNREALIZED";
    public final REALIZED : String = "REALIZED";
    public final PREFETCHED : String = "PREFETCHED";
    public final STARTED : String = "STARTED";
    public final CLOSED : String = "CLOSED";
    public function convert(state : Int) : String {
        if (state == Player.UNREALIZED) {
            return this.UNREALIZED;
        } else if (state == Player.REALIZED) {
            return this.REALIZED;
        } else if (state == Player.PREFETCHED) {
            return this.PREFETCHED;
        } else if (state == Player.STARTED) {
            return this.STARTED;
        } else if (state == Player.CLOSED) {
            return this.CLOSED;
        }
        return this.commonStrings.UNKNOWN;
    }

    public function new() {
    }
}

