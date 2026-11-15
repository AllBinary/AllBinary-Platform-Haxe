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
package org.allbinary.game.input;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class GameInput {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final gameKeyEventList : BasicArrayList;
    private final removalGameKeyEventList : BasicArrayList;
    public final isRemoveDuplicateKeyPresses : Bool;
    public function new(gameKeyEventList : BasicArrayList, removalGameKeyEventList : BasicArrayList) {
        this.gameKeyEventList = gameKeyEventList;
        this.removalGameKeyEventList = removalGameKeyEventList;
        this.isRemoveDuplicateKeyPresses = Features.getInstance().isFeature(InputFeatureFactory.getInstance().REMOVE_DUPLICATE_KEY_PRESSES);
    }

    // synchronized
    public function add(gameKeyEvent : GameKeyEvent) : Void {
        if (this.isRemoveDuplicateKeyPresses && this.gameKeyEventList.contains(gameKeyEvent)) {
            return;
        }
        if (gameKeyEvent != null) {
            this.gameKeyEventList.add(gameKeyEvent);
        } else {
            this.logUtil.putF("Danger Passed Null GameKeyEvent", this, this.commonStrings.ADD);
        }
    }

    // synchronized
    public function addForRemoval(gameKeyEvent : GameKeyEvent) : Void {
        this.removalGameKeyEventList.add(gameKeyEvent);
    }

    // synchronized
    public function isForRemoval(gameKeyEvent : GameKeyEvent) : Bool {
        return this.removalGameKeyEventList.contains(gameKeyEvent);
    }

    // synchronized
    public function clear() : Void {
        this.gameKeyEventList.clear();
    }

    // synchronized
    public function removeNonAIInputGameKeyEvents() : Void {
        var list : BasicArrayList = this.gameKeyEventList;
        var gameKeyEvent : GameKeyEvent = null;
        {
            var index : Int = list.size();
            while (--index >= 0) {
            gameKeyEvent = (cast list.objectArray[index] : GameKeyEvent);
            if (gameKeyEvent.getSourceId() != 1) {
                list.removeAt(index);
            }
            }
        }
    }

    // synchronized
    public function update() : Void {
        var removeList : BasicArrayList = this.removalGameKeyEventList;
        var list : BasicArrayList = this.gameKeyEventList;
        var size : Int = removeList.size();
        for (index in 0...size) {
            var anyType : Any = removeList.objectArray[index];
            {
                var index2 : Int = list.size();
                while (--index2 >= 0) {
                if (list.objectArray[index2] == anyType) {
                    list.removeAt(index2);
                }
                }
            }
        }
        removeList.clear();
    }

    public function getRemovalGameKeyEventList() : BasicArrayList {
        return this.removalGameKeyEventList;
    }

    public function getGameKeyEventList() : BasicArrayList {
        return this.gameKeyEventList;
    }

}

