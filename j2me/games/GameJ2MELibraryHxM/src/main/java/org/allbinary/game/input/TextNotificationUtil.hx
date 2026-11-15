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

import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.audio.PrimaryPlayerQueueFactory;
import org.allbinary.media.audio.SelectSound;

class TextNotificationUtil {
    private static final instance : TextNotificationUtil = new TextNotificationUtil();
    public static function getInstance() : TextNotificationUtil {
        return TextNotificationUtil.instance;
    }

    // throws Exception
    public function fireError(message : String) : Void {
        PrimaryPlayerQueueFactory.getInstance().add(ErrorSound.getInstance());
        this.fire(message);
    }

    // throws Exception
    public function fireNew(message : String) : Void {
        PrimaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
        this.fire(message);
    }

    // throws Exception
    public function fireSuccess(message : String) : Void {
        PrimaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
        this.fire(message);
    }

    private final TWO : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(2);
    private final FALSE : Null<Bool> = BooleanFactory.getInstance().FALSE;
    private final gameNotificationEventHandler : GameNotificationEventHandler = GameNotificationEventHandler.getInstance();
    // throws Exception
    public function fire(message : String) : Void {
        var gameNotificationEvent : GameNotificationEvent = new GameNotificationEvent(this, message, this.TWO, BasicColorFactory.getInstance().RED, this.FALSE);
        this.gameNotificationEventHandler.fireEvent(gameNotificationEvent);
    }

    public function new() {
    }
}

