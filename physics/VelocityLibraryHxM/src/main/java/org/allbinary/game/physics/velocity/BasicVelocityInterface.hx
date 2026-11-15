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
package org.allbinary.game.physics.velocity;

import org.allbinary.direction.Direction;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.math.Angle;

interface BasicVelocityInterface {
    function getVelocityXBasicDecimalP() : BasicDecimal;

    function getVelocityYBasicDecimalP() : BasicDecimal;

    function zero() : Void;

    function setVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal : BasicDecimal, direction : Direction, otherDirection : Direction) : Void;

    function addVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal : BasicDecimal, direction : Direction, otherDirection : Direction) : Void;

    function setVelocityWithDirection(magnitude : haxe.Int64, direction : Direction, otherDirection : Direction) : Void;

    function addVelocityWithDirection(magnitude : haxe.Int64, direction : Direction, otherDirection : Direction) : Void;

    function setVelocityWithBigDecimal(magnitudeBasicDecimal : BasicDecimal, angle : Angle, otherAngle : Angle) : Void;

    function addVelocityWithBigDecimal(magnitudeBasicDecimal : BasicDecimal, angle : Angle, otherAngle : Angle) : Void;

    function setVelocity(magnitude : haxe.Int64, angle : Angle, otherAngle : Angle) : Void;

    function addVelocity(magnitude : haxe.Int64, angle : Angle, otherAngle : Angle) : Void;

    function addVelocityi(magnitude : haxe.Int64, angle : Int, otherAngle : Int) : Void;

}

