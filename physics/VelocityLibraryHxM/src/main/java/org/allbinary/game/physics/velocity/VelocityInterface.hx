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


interface VelocityInterface extends BasicVelocityInterface {
    function getMaxForwardVelocity() : Int;

    function getMaxReverseVelocity() : Int;

    function limitMaxXYForwardVelocity() : Void;

    function limitMaxXYReverseVelocity() : Void;

    function limitXYToForwardAndReverseMaxVelocity() : Void;

    function limitMaxXYVelocity(maxVelocity : Int) : Void;

    function setMaxForwardVelocity(maxForwardVelocity : Int) : Void;

    function setMaxReverseVelocity(maxReverseVelocity : Int) : Void;

}

