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
package org.allbinary.game.displayable.canvas;

import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.communication.log.LogUtil;

class FormUtil {
    private static final instance : FormUtil = new FormUtil();
    public static function getInstance() : FormUtil {
        return FormUtil.instance;
    }

    public function createFormRectangle() : Rectangle {
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        final pointFactory : PointFactory = PointFactory.getInstance();
        final rectangle : Rectangle = new Rectangle(pointFactory.createXY(30, 10), displayInfo.getLastWidth() - 30, displayInfo.getLastHeight() - 35);
        return rectangle;
    }

    public function new() {
    }
}

