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
package org.allbinary.game.ag.life;


interface LifeInterface {
    function get() : Int;

    function set(lives : Int) : Void;

    function reset() : Void;

    function add(lives : Int) : Void;

    function deaths(lives : Int) : Void;

    function getMaxlives() : Int;

    function isAlive() : Bool;

}

