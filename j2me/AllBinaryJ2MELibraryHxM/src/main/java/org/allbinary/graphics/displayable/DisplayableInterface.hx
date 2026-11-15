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
package org.allbinary.graphics.displayable;

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;

interface DisplayableInterface {
    function addCommand(cmd : Command) : Void;

    function getHeight() : Int;

    function getWidth() : Int;

    function removeCommand(cmd : Command) : Void;

    function setCommandListener(l : CommandListener) : Void;

}

