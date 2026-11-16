// Generated Code Do Not Modify
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Graphics;
import org.allbinary.canvas.BaseGameStatistics;
import org.allbinary.canvas.GameStatisticsFactory;

//J2SEForJ2ME
class NullDisplayable extends Canvas {
    private static final SINGLETON : NullDisplayable = new NullDisplayable();
    public static function getInstance() : NullDisplayable {
        return NullDisplayable.SINGLETON;
    }

    public function new() {
        super();
    }

    private final baseGameStatistics : BaseGameStatistics = GameStatisticsFactory.getInstance();
    public function paint(graphics : Graphics) : Void {
        this.baseGameStatistics.nextRefresh();
    }

}

