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
package org.allbinary.input.motion.button;

import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;

class CommonButtons {
    private static final instance : CommonButtons = new CommonButtons();
    public static function getInstance() : CommonButtons {
        return CommonButtons.instance;
    }

    public final STANDARD_BUTTON_SIZE : Int;
    public final NORMAL_BUTTON : Rectangle;
    public final LARGE_BUTTON : Rectangle;
    public function new() {
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        var commonButtonSize : Int = 128;
        while (commonButtonSize > 64) {
            var totalColumns : Int = jre.lang.JavaNumber.divide(displayInfo.getLastWidth(), commonButtonSize);
            var totalRows : Int = jre.lang.JavaNumber.divide(displayInfo.getLastHeight(), commonButtonSize);
            var max : Int = totalColumns;
            if (totalRows > max) {
                max = totalRows;
            }
            if (max > 9) {
                break;
            }
            commonButtonSize = commonButtonSize >> 1;
        }
        this.STANDARD_BUTTON_SIZE = commonButtonSize;
        this.NORMAL_BUTTON = new Rectangle(PointFactory.getInstance().ZERO_ZERO, this.STANDARD_BUTTON_SIZE, this.STANDARD_BUTTON_SIZE);
        this.LARGE_BUTTON = new Rectangle(PointFactory.getInstance().ZERO_ZERO, this.STANDARD_BUTTON_SIZE << 1, this.STANDARD_BUTTON_SIZE << 1);
    }

}

