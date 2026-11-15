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
package org.allbinary.graphics.j2me.workarea.canvas.event;


class MyCanvasEventService {
    private static var listenerList : javax.swing.event.EventListenerList = new javax.swing.event.EventListenerList();
    public static var DELETE : String = "delete";
    public static var DUPLICATE : String = "duplicate";
    public static var SELECT : String = "select";
    public static var ROTATE : String = "rotate";
    public static var EXPLODE : String = "explode";
    public static var AUTOEXPLODE : String = "autoExplode";
    public static var CENTER : String = "center";
    public function new() {
    }

    // synchronized
    public static function addListener(listener : MyCanvasEventListener) : Void {
        MyCanvasEventService.listenerList.add((cast Type.getClass(listener) : Class<Dynamic>), (cast listener : java.util.EventListener));
    }

    // synchronized
    public static function removeListener(listener : MyCanvasEventListener) : Void {
        MyCanvasEventService.listenerList.remove((cast Type.getClass(listener) : Class<Dynamic>), (cast listener : java.util.EventListener));
    }

    // throws Exception
    // synchronized
    public static function fire(evt : MyCanvasEvent) : Void {
        var listeners : haxe.ds.Vector<Any> = listenerList.getListenerList();
        {
            var i : Int = 0;
            while (i < listeners.length) {
            if (listeners[i] == Type.getClass(listeners[i + 1])) {
                if (evt.getCommand().compareTo(MyCanvasEventService.DELETE) == 0) {
                    ((cast listeners[i + 1] : MyCanvasEventListener)).delete(evt);
                } else if (evt.getCommand().compareTo(MyCanvasEventService.DUPLICATE) == 0) {
                    ((cast listeners[i + 1] : MyCanvasEventListener)).duplicate(evt);
                } else if (evt.getCommand().compareTo(MyCanvasEventService.SELECT) == 0) {
                    ((cast listeners[i + 1] : MyCanvasEventListener)).select(evt);
                } else if (evt.getCommand().compareTo(MyCanvasEventService.ROTATE) == 0) {
                    ((cast listeners[i + 1] : MyCanvasEventListener)).rotate(evt);
                } else if (evt.getCommand().compareTo(MyCanvasEventService.EXPLODE) == 0) {
                    ((cast listeners[i + 1] : MyCanvasEventListener)).explode(evt);
                } else if (evt.getCommand().compareTo(MyCanvasEventService.AUTOEXPLODE) == 0) {
                    ((cast listeners[i + 1] : MyCanvasEventListener)).autoExplode(evt);
                } else if (evt.getCommand().compareTo(MyCanvasEventService.CENTER) == 0) {
                    ((cast listeners[i + 1] : MyCanvasEventListener)).center(evt);
                }
            }
                i += 2;
            }
        }
    }

}

