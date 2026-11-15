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
package org.allbinary.game.layer;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.GPoint;
import org.allbinary.layer.Layer;

class LinePathAnimation {
    private static final instance : LinePathAnimation = new LinePathAnimation();
    public static function getInstance() : LinePathAnimation {
        return LinePathAnimation.instance;
    }

    public function paint(graphics : Graphics, point : GPoint, nextPoint : GPoint, tiledLayer : Layer) : Void {
        graphics.drawLine(nextPoint.getX(), nextPoint.getY(), point.getX(), point.getY());
    }

    public function new() {
    }
}

