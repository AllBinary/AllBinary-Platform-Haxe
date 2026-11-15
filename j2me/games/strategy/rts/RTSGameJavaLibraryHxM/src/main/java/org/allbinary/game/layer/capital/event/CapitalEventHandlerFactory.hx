/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer.capital.event;

import org.allbinary.game.identification.Group;

class CapitalEventHandlerFactory {
    private static final capitalEventHandlerArray : haxe.ds.Vector<CapitalEventHandler> = null;
    static function __init__() {
        capitalEventHandlerArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...10) null]);
        {
            var index : Int = CapitalEventHandlerFactory.capitalEventHandlerArray.length - 1;
            while (index >= 0) {
            CapitalEventHandlerFactory.capitalEventHandlerArray[index] = new CapitalEventHandler();
                index--;
            }
        }
    }
    public static function getInstance(groupInterface : Group) : CapitalEventHandler {
        return CapitalEventHandlerFactory.capitalEventHandlerArray[Std.int(groupInterface.getGroupId())];
    }

    public static function removeAll() : Void {
        {
            var index : Int = CapitalEventHandlerFactory.capitalEventHandlerArray.length - 1;
            while (index >= 0) {
            CapitalEventHandlerFactory.capitalEventHandlerArray[index].removeAllListeners();
                index--;
            }
        }
    }

    public function new() {
    }
}

