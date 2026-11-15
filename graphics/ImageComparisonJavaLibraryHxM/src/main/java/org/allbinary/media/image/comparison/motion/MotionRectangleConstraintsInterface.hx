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
package org.allbinary.media.image.comparison.motion;

//import java.awt.*;
//import java.awt.image.BufferedImage;

interface MotionRectangleConstraintsInterface {
    function getMaxMotionRectangles() : Int;

    function getMinDimension() : Dimension;

    function getMinArea() : Int;

    function getMaxDimension() : Dimension;

    function isTooSmall(rectangle : Rectangle) : Bool;

    function isAreaTooSmall(rectangle : Rectangle) : Bool;

    function isTooBig(rectangle : Rectangle) : Bool;

    // throws Exception
    function isValid(frame : Null<haxe.Int64>, bufferedImage : BufferedImage, rectangle : Rectangle) : Bool;

}

