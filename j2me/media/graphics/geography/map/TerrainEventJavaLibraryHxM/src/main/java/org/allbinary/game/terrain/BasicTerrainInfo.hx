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
package org.allbinary.game.terrain;

import org.allbinary.math.Angle;
import org.allbinary.math.AngleFactory;

class BasicTerrainInfo {
    public static final NULL_BASIC_TERRAIN_INFO : BasicTerrainInfo = new BasicTerrainInfo(AngleFactory.getInstance().NOT_ANGLE);
    private var angle : Angle;
    public function new(angle : Angle) {
        this.angle = angle;
    }

    public function getAngle() : Angle {
        return this.angle;
    }

    public function setAngle(angle : Angle) : Void {
        this.angle = angle;
    }

}

