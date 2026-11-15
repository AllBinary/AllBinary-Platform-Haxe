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
package org.allbinary.logic.system.security.licensing;

import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.audio.PrimaryPlayerQueueFactory;

class LockedFeatureNotificationUtil {
    private static final instance : LockedFeatureNotificationUtil = new LockedFeatureNotificationUtil();
    public static function getInstance() : LockedFeatureNotificationUtil {
        return LockedFeatureNotificationUtil.instance;
    }

    private final gameNotificationEvent : GameNotificationEvent;
    // throws Exception
    public function fire() : Void {
        PrimaryPlayerQueueFactory.getInstance().add(ErrorSound.getInstance());
        GameNotificationEventHandler.getInstance().fireEvent(this.gameNotificationEvent);
    }

    // throws Exception
    public function fireWithColor(basicColor : BasicColor) : Void {
        PrimaryPlayerQueueFactory.getInstance().add(ErrorSound.getInstance());
        this.gameNotificationEvent.setBasicColorP(basicColor);
        GameNotificationEventHandler.getInstance().fireEvent(this.gameNotificationEvent);
    }

    public function new() {
        this.gameNotificationEvent = new GameNotificationEvent(this, LicenseStrings.getInstance().LOCKED, SmallIntegerSingletonFactory.getInstance().getAt(3), BasicColorFactory.getInstance().RED, BooleanFactory.getInstance().FALSE);
    }
}

