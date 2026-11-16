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

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationListenerInterface;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;

class GameNotificationHud extends BasicHud implements GameNotificationListenerInterface {
    public static final NULL_GAME_NOTIFICATION : GameNotificationHud = new GameNotificationHud(BasicHudFactory.getInstance().TOPCENTER, BasicHudFactory.getInstance().HORIZONTAL, 0, BasicColorFactory.getInstance().RED);
    public function new(location : Int, direction : Int, bufferZone : Int, basicColor : BasicColor) {
        super(location, direction, bufferZone, basicColor);
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    private final METHOD_NAME : String = "onGameNotificationEvent";
    private var lastGameNotificationEvent : GameNotificationEvent = GameNotification.NULL_GAME_NOTIFICATION_EVENT;
    // throws Exception
    public function onGameNotificationEvent(gameNotificationEvent : GameNotificationEvent) : Void {
        if (this.lastGameNotificationEvent != gameNotificationEvent) {
            this.lastGameNotificationEvent = gameNotificationEvent;
            this.logUtil.putF(gameNotificationEvent.getString(), this, this.METHOD_NAME);
        }
        this.add(gameNotificationEvent.getString(), gameNotificationEvent.getSeconds(), gameNotificationEvent.getBasicColorP(), gameNotificationEvent.getPermanent());
    }

    public function add(string : String, seconds : Null<Int>, basicColor : BasicColor, permanent : Null<Bool>) : Void {
    }

    // throws Exception
    public function processTick() : Void {
    }

    public function paint(graphics : Graphics) : Void {
    }

    public function clear() : Void {
    }

}

