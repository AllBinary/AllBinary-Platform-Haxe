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
package org.allbinary.graphics.color;


class ColorTemperatureUtil {
    private static final instance : ColorTemperatureUtil = new ColorTemperatureUtil();
    public static function getInstance() : ColorTemperatureUtil {
        return ColorTemperatureUtil.instance;
    }

    private final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    public function getBasicColor(thirdTemp : Int) : BasicColor {
        var basicColor : BasicColor = this.basicColorFactory.RED;
        if (thirdTemp > 3700) {
            basicColor = this.basicColorFactory.PURPLE;
        } else if (thirdTemp > 3200) {
            basicColor = this.basicColorFactory.BLUE;
        } else if (thirdTemp > 2700) {
            basicColor = this.basicColorFactory.PUCE;
        } else if (thirdTemp > 2200) {
            basicColor = this.basicColorFactory.WHITE;
        } else if (thirdTemp > 1700) {
            basicColor = this.basicColorFactory.GREEN;
        } else if (thirdTemp > 1200) {
            basicColor = this.basicColorFactory.YELLOW;
        } else if (thirdTemp > 700) {
            basicColor = this.basicColorFactory.ORANGE;
        }
        return basicColor;
    }

    public function new() {
    }
}

