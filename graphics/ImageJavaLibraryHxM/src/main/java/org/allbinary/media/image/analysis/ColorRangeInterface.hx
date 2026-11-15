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
package org.allbinary.media.image.analysis;

//import java.awt.*;

interface ColorRangeInterface {
    function getMinRed() : Int;

    function setMinRed(minRed : Int) : Void;

    function getMaxRed() : Int;

    function setMaxRed(maxRed : Int) : Void;

    function getMinGreen() : Int;

    function setMinGreen(minGreen : Int) : Void;

    function getMaxGreen() : Int;

    function setMaxGreen(maxGreen : Int) : Void;

    function getMinBlue() : Int;

    function setMinBlue(minBlue : Int) : Void;

    function getMaxBlue() : Int;

    function setMaxBlue(maxBlue : Int) : Void;

    function isInRange(color : Color) : Bool;

}

