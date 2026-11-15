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
package org.allbinary.graphics.j2me.workarea.tools.event;


class MyGraphicItemEventService {
    private static var listenerList : javax.swing.event.EventListenerList = new javax.swing.event.EventListenerList();
    public static var DELETE : String = "delete";
    public static var DESELECT : String = "deselect";
    public static var SELECT : String = "select";
    public static var DUPLICATE : String = "duplicate";
    public static var ROTATE : String = "rotate";
    public function new() {
    }

    // synchronized
    public static function addListener(listener : MyGraphicItemEventListener) : Void {
        MyGraphicItemEventService.listenerList.add((cast Type.getClass(listener) : Class<Dynamic>), (cast listener : java.util.EventListener));
    }

    // synchronized
    public static function removeListener(listener : MyGraphicItemEventListener) : Void {
        MyGraphicItemEventService.listenerList.remove((cast Type.getClass(listener) : Class<Dynamic>), (cast listener : java.util.EventListener));
    }

    // throws Exception
    // synchronized
    public static function fire(evt : MyGraphicItemEvent) : Void {
        var listeners : haxe.ds.Vector<Any> = listenerList.getListenerList();
        {
            var i : Int = 0;
            while (i < listeners.length) {
            if (listeners[i] == Type.getClass(listeners[i + 1])) {
                if (evt.getCommand().compareTo(MyGraphicItemEventService.SELECT) == 0) {
                    ((cast listeners[i + 1] : MyGraphicItemEventListener)).highlight(evt);
                } else if (evt.getCommand().compareTo(MyGraphicItemEventService.DESELECT) == 0) {
                    ((cast listeners[i + 1] : MyGraphicItemEventListener)).deselect(evt);
                } else if (evt.getCommand().compareTo(MyGraphicItemEventService.DELETE) == 0) {
                    ((cast listeners[i + 1] : MyGraphicItemEventListener)).delete(evt);
                } else if (evt.getCommand().compareTo(MyGraphicItemEventService.DUPLICATE) == 0) {
                    ((cast listeners[i + 1] : MyGraphicItemEventListener)).duplicate(evt);
                } else if (evt.getCommand().compareTo(MyGraphicItemEventService.ROTATE) == 0) {
                    ((cast listeners[i + 1] : MyGraphicItemEventListener)).rotate(evt);
                }
            }
                i += 2;
            }
        }
    }

}

