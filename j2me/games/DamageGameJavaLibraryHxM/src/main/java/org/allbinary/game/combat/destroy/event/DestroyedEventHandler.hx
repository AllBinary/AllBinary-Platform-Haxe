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
package org.allbinary.game.combat.destroy.event;

import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class DestroyedEventHandler extends BasicEventHandler {
    private static final instance : DestroyedEventHandler = new DestroyedEventHandler();
    // synchronized
    public static function getInstance() : DestroyedEventHandler {
        return DestroyedEventHandler.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer) : Void {
        if (!this.list.contains(collidableDestroyableDamageableLayer)) {
            this.list.add(collidableDestroyableDamageableLayer);
        }
    }

    // synchronized
    public override function removeAllListeners() : Void {
        this.list.clear();
        super.removeAllListeners();
    }

    // synchronized
    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.list.remove(eventListenerInterface);
        super.removeListener(eventListenerInterface);
    }

    // throws Exception
    public override function fireEvent(eventObject : AllBinaryEventObject) : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                var collidableDestroyableDamageableLayer : CollidableDestroyableDamageableLayer = (cast this.list.objectArray[index] : CollidableDestroyableDamageableLayer);
                collidableDestroyableDamageableLayer.onDestroyed((cast eventObject : DestroyedEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final destroyedEventListenerInterface : DestroyedEventListenerInterface = (cast eventListenerInterface : DestroyedEventListenerInterface);
        destroyedEventListenerInterface.onDestroyed((cast eventObject : DestroyedEvent));
    }

}

