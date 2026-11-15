/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.logic.util.event;


class EventStrings {
    private static final instance : EventStrings = new EventStrings();
    public static function getInstance() : EventStrings {
        return EventStrings.instance;
    }

    public final PERFORMANCE_MESSAGE : String = "Use Custom onEvent Methods for needed optimization";
    public final TOTAL_LISTENERS : String = "Total Listeners: ";
    public final LISTENER_LABEL : String = " Listener: ";
    public final FIRE_EVENT : String = "fireEvent";
    public function new() {
    }
}

