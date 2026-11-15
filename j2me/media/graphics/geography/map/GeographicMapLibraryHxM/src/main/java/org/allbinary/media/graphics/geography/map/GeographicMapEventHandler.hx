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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.game.layer.AllBinaryGameLayer;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GeographicMapEventHandler extends BasicEventHandler {
    private static var instance : GeographicMapEventHandler = new GeographicMapEventHandler();
    public static function getInstance() : GeographicMapEventHandler {
        return GeographicMapEventHandler.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(gameLayer : AllBinaryGameLayer) : Void {
        if (!this.list.contains(gameLayer)) {
            this.list.add(gameLayer);
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

    public function fireEvent() : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                var gameLayer : AllBinaryGameLayer = (cast this.list.get(index) : AllBinaryGameLayer);
                gameLayer.move();
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
    }

}

