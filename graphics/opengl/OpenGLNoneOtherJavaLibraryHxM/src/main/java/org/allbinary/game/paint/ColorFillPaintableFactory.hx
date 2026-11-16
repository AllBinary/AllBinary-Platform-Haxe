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
package org.allbinary.game.paint;

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystemFactory;

class ColorFillPaintableFactory {
    private static final instance : ColorFillPaintableFactory = new ColorFillPaintableFactory();
    public static function getInstance() : ColorFillPaintableFactory {
        return ColorFillPaintableFactory.instance;
    }

    public function getInstanceFor(basicColor : BasicColor, forThreedCanvas : Bool) : ColorFillBasePaintable {
        final operatingSystem : GenericOperatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
        if (operatingSystem.isOverScan()) {
            return new OverScanColorFillPaintable(basicColor);
        } else {
            return new ColorFillPaintable(basicColor);
        }
    }

    public function new() {
    }
}

