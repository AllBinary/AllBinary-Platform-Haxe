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
package org.allbinary.game.displayable;

import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GameLevelDisplayChangeEventListenersFactory {
    private static final instance : GameLevelDisplayChangeEventListenersFactory = new GameLevelDisplayChangeEventListenersFactory();
    public static function getInstance() : GameLevelDisplayChangeEventListenersFactory {
        return GameLevelDisplayChangeEventListenersFactory.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function add(displayChangeEventListener : DisplayChangeEventListener) : Void {
        this.list.add(displayChangeEventListener);
        DisplayChangeEventHandler.getInstance().addListenerInterface(displayChangeEventListener);
    }

    public function clear() : Void {
        var displayChangeEventHandler : BasicEventHandler = DisplayChangeEventHandler.getInstance();
        var displayChangeEventListener : DisplayChangeEventListener = null;
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            displayChangeEventListener = (cast this.list.objectArray[index] : DisplayChangeEventListener);
            displayChangeEventHandler.removeListener(displayChangeEventListener);
            }
        }
        this.list.clear();
    }

    public function new() {
    }
}

