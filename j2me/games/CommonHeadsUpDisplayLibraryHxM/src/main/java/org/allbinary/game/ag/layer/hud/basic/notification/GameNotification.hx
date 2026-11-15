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
package org.allbinary.game.ag.layer.hud.basic.notification;

import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GameNotification {
    public static final NULL_GAME_NOTIFICATION_EVENT : GameNotificationEvent = new GameNotificationEvent(NullUtil.getInstance().NULL_OBJECT, StringUtil.getInstance().EMPTY_STRING, 0, BasicColorFactory.getInstance().RED, BooleanFactory.getInstance().FALSE);
    public final stringList : BasicArrayList = new BasicArrayListD();
    public final timeList : BasicArrayList = new BasicArrayListD();
    public final colorList : BasicArrayList = new BasicArrayListD();
    public function add(string : String, seconds : Null<Int>, basicColor : BasicColor) : Void {
        if (!this.stringList.contains(string)) {
            this.stringList.add(string);
            this.timeList.add(seconds);
            this.colorList.add(basicColor);
        }
    }

    public function clear() : Void {
        this.stringList.clear();
        this.timeList.clear();
        this.colorList.clear();
    }

    public function getSize() : Int {
        return this.stringList.size();
    }

    public function new() {
    }
}

