/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
import org.allbinary.animation.RotationAnimation;
import org.allbinary.game.identification.Group;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking;
import org.allbinary.util.BasicArrayList;

class NullVehicleLayer implements VehicleLayerInterface {
    public static final NULL_VEHICLE_LAYER : NullVehicleLayer = new NullVehicleLayer();
    public function getName() : String {
        throw new haxe.Exception();
    }

    public function getGroupInterface() : haxe.ds.Vector<Group> {
        throw new haxe.Exception();
    }

    public function setPosition(x : Int, y : Int, z : Int) : Void {
        throw new haxe.Exception();
    }

    public function getHeight() : Int {
        throw new haxe.Exception();
    }

    public function getWidth() : Int {
        throw new haxe.Exception();
    }

    public function getHalfHeight() : Int {
        throw new haxe.Exception();
    }

    public function getHalfWidth() : Int {
        throw new haxe.Exception();
    }

    public function getXP() : Int {
        throw new haxe.Exception();
    }

    public function getYP() : Int {
        throw new haxe.Exception();
    }

    public function getZP() : Int {
        throw new haxe.Exception();
    }

    public function getX2() : Int {
        throw new haxe.Exception();
    }

    public function getY2() : Int {
        throw new haxe.Exception();
    }

    public function getZ2() : Int {
        throw new haxe.Exception();
    }

    public function isVisible() : Bool {
        throw new haxe.Exception();
    }

    public function moveDXYZ(dx : Int, dy : Int, dz : Int) : Void {
        throw new haxe.Exception();
    }

    public function setVisible(visible : Bool) : Void {
        throw new haxe.Exception();
    }

    public function implmentsTickableInterface() : Bool {
        throw new haxe.Exception();
    }

    public function implmentsCollidableInterface() : Bool {
        throw new haxe.Exception();
    }

    public function implmentsGameInputInterface() : Bool {
        throw new haxe.Exception();
    }

    public function implmentsArtificialIntelligenceCompositeInterface() : Bool {
        throw new haxe.Exception();
    }

    public function getType() : Int {
        throw new haxe.Exception();
    }

    public function getVehicleProperties() : VehicleProperties {
        throw new haxe.Exception();
    }

    public function getGameKeyEventList() : BasicArrayList {
        throw new haxe.Exception();
    }

    public function getSpeedBasicDecimal() : BasicDecimal {
        throw new haxe.Exception();
    }

    public function isReadyForExplosion() : Bool {
        throw new haxe.Exception();
    }

    public function getRotationAnimationInterface() : RotationAnimation {
        throw new haxe.Exception();
    }

    public function setRotationAnimationInterface(animationInterface : RotationAnimation) : Void {
        throw new haxe.Exception();
    }

    public function isDestroyed() : Bool {
        throw new haxe.Exception();
    }

    public function isFinish() : Bool {
        throw new haxe.Exception();
    }

    public function getFinalPosition() : Int {
        throw new haxe.Exception();
    }

    // throws Exception
    public function handleFinish() : Void {
        throw new haxe.Exception();
    }

    public function getGeographicMapCellPositionTracking() : GeographicMapCellPositionTracking {
        throw new haxe.Exception();
    }

    public function getGeographicMapCellHistoryArray() : haxe.ds.Vector<GeographicMapCellHistory> {
        throw new haxe.Exception();
    }

    public function setGeographicMapCellHistoryArray(geographicMapCellHistory : haxe.ds.Vector<GeographicMapCellHistory>) : Void {
        throw new haxe.Exception();
    }

    public function paint(graphics : Graphics) : Void {
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

    public function new() {
    }
}

