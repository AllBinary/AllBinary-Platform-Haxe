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
package org.allbinary.media;

//import java.awt.Dimension;
//import java.awt.DisplayMode;
//import java.awt.GraphicsDevice;
//import java.awt.GraphicsEnvironment;
//import java.awt.Toolkit;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;

class DisplaysUtil {
    public static function getInstance() : DisplaysUtil {
        return DisplaysUtil.instance;
    }

    private static final instance : DisplaysUtil = new DisplaysUtil();
    public function getPrimaryScreenSize() : Rectangle {
        final dimension : Dimension = Toolkit.getDefaultToolkit().getScreenSize();
        return new Rectangle(PointFactory.getInstance().ZERO_ZERO, dimension.width, dimension.height);
    }

    public function getScreenSizesAsRectangleArray() : haxe.ds.Vector<Rectangle> {
        final graphicsEnvironment : GraphicsEnvironment = GraphicsEnvironment.getLocalGraphicsEnvironment();
        final graphicsDeviceArray : haxe.ds.Vector<GraphicsDevice> = graphicsEnvironment.getScreenDevices();
        var graphicsDevice : GraphicsDevice = null;
        var displayMode : DisplayMode = null;
        var rectangle : Rectangle = null;
        final size : Int = graphicsDeviceArray.length;
        final rectangleArray : haxe.ds.Vector<Rectangle> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        for (index in 0...size) {
            graphicsDevice = graphicsDeviceArray[index];
            displayMode = graphicsDevice.getDisplayMode();
            rectangle = new Rectangle(PointFactory.getInstance().ZERO_ZERO, displayMode.getWidth(), displayMode.getHeight());
            rectangleArray[index] = rectangle;
        }
        return rectangleArray;
    }

    public function new() {
    }
}

