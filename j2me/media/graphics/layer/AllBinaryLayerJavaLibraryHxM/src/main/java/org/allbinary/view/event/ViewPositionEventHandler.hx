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
package org.allbinary.view.event;

import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class ViewPositionEventHandler extends BasicEventHandler {
    private static var SINGLETON : ViewPositionEventHandler = new ViewPositionEventHandler();
    public static function getInstance() : ViewPositionEventHandler {
        return ViewPositionEventHandler.SINGLETON;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(layerInterface : AllBinaryLayer) : Void {
        if (!this.list.contains(layerInterface)) {
            this.list.add(layerInterface);
        }
    }

    public override function removeAllListeners() : Void {
        this.list.clear();
        super.removeAllListeners();
    }

    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.list.remove(eventListenerInterface);
        super.removeListener(eventListenerInterface);
    }

    // throws Exception
    public override function fireEvent_AllBinaryEventObject(eventObject : AllBinaryEventObject) : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                var layerInterface : AllBinaryLayer = (cast this.list.objectArray[index] : AllBinaryLayer);
                layerInterface.onChangeEvent((cast eventObject : ViewPositionEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final viewPositionEventListenerInterface : ViewPositionEventListenerInterface = ((cast eventListenerInterface : ViewPositionEventListenerInterface));
        viewPositionEventListenerInterface.onChangeEvent((cast eventObject : ViewPositionEvent));
    }

}

