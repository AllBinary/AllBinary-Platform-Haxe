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
package org.allbinary.game.input;


interface KeyInterface {
    function keyPressed(keyCode : Int) : Void;

    function keyReleased(keyCode : Int) : Void;

    function keyPressedByDevice(keyCode : Int, deviceId : Int) : Void;

    function keyReleasedByDevice(keyCode : Int, deviceId : Int) : Void;

}

