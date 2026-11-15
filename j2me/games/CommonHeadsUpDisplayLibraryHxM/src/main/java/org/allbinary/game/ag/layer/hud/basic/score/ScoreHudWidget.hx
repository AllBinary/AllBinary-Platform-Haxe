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
package org.allbinary.game.ag.layer.hud.basic.score;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.ag.layer.hud.basic.NumberStringHud;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

class ScoreHudWidget extends NumberStringHud {
    // throws Exception
    public static function getInstance(maxscore : Int, location : Int, direction : Int) : ScoreHudWidget {
        return new ScoreHudWidget(maxscore, location, direction, 2, BasicColorFactory.getInstance().GREY);
    }

    public function new(maxscore : Int, location : Int, direction : Int, bufferZone : Int, basicColor : BasicColor) {
        super("Pts ", maxscore, location, direction, bufferZone, basicColor);
        this.updateMaxHeight = 14;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.updateMaxWidth = font.getSize() * 5;
        super.updateMeasurement(graphics);
    }

}

