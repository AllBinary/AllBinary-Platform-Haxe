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
package org.allbinary.media.image.comparison;

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.graphics.GPoint;

interface ImageComparatorConstraintsInterface {
    function getMaxNonMatchingPixelDeltas() : Int;

    function isCollisionWithAvoidRectangles(rectangle : Rectangle) : Bool;

    function isCollisionWithAvoidRectangles(point : GPoint) : Bool;

    function isColorAllowed(frame : Int, point : GPoint, color : Color) : Bool;

    // throws Exception
    function isImageValid(bufferedImage : BufferedImage) : Bool;

    function isFrameAllowed(frame : Int) : Bool;

}

