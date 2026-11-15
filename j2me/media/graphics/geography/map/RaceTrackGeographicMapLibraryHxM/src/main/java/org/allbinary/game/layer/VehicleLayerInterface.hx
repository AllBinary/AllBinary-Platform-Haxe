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
package org.allbinary.game.layer;

import org.allbinary.util.BasicArrayList;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.layer.LayerInterface;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking;

interface VehicleLayerInterface extends LayerInterface extends VehiclePropertiesCompositeInterface {
    function getGameKeyEventList() : BasicArrayList;

    function getSpeedBasicDecimal() : BasicDecimal;

    function isReadyForExplosion() : Bool;

    function getRotationAnimationInterface() : RotationAnimation;

    function setRotationAnimationInterface(animationInterface : RotationAnimation) : Void;

    function isDestroyed() : Bool;

    function isFinish() : Bool;

    function getFinalPosition() : Int;

    // throws Exception
    function handleFinish() : Void;

    function getGeographicMapCellPositionTracking() : GeographicMapCellPositionTracking;

    function getGeographicMapCellHistoryArray() : haxe.ds.Vector<GeographicMapCellHistory>;

    function setGeographicMapCellHistoryArray(geographicMapCellHistory : haxe.ds.Vector<GeographicMapCellHistory>) : Void;

}

