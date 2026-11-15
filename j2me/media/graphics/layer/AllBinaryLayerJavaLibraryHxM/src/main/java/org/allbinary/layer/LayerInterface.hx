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
package org.allbinary.layer;

import org.allbinary.game.identification.GroupInterfaceCompositeInterface;
import org.allbinary.graphics.paint.PaintableInterface;

interface LayerInterface extends NamedInterface extends PaintableInterface extends GroupInterfaceCompositeInterface extends PositionInterface {
    function getHeight() : Int;

    function getWidth() : Int;

    function getHalfHeight() : Int;

    function getHalfWidth() : Int;

    function getXP() : Int;

    function getYP() : Int;

    function getZP() : Int;

    function getX2() : Int;

    function getY2() : Int;

    function getZ2() : Int;

    function isVisible() : Bool;

    function moveDXYZ(dx : Int, dy : Int, dz : Int) : Void;

    function setVisible(visible : Bool) : Void;

    function implmentsTickableInterface() : Bool;

    function implmentsCollidableInterface() : Bool;

    function implmentsGameInputInterface() : Bool;

    function implmentsArtificialIntelligenceCompositeInterface() : Bool;

    function getType() : Int;

}

