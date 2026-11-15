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
package org.allbinary.game.graphics.hud;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;

class HudGraphicsPosition {
    public static final NULL_HUD_GRAPHICS_POSITION : HudGraphicsPosition = new HudGraphicsPosition(PointFactory.getInstance().ZERO_ZERO, 9);
    private var anchor : Int = 0;
    private var point : GPoint = PointFactory.getInstance().ZERO_ZERO;
    public function new(point : GPoint, anchor : Int) {
        this.setAnchor(anchor);
        this.setPoint(point);
    }

    public function getAnchor() : Int {
        return this.anchor;
    }

    private function setAnchor(anchor : Int) : Void {
        this.anchor = anchor;
    }

    public function getPoint() : GPoint {
        return this.point;
    }

    public function setPoint(point : GPoint) : Void {
        this.point = point;
    }

}

