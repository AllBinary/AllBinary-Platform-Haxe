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

import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class NoGameNotificationHudSingleton {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : NoGameNotificationHudSingleton = new NoGameNotificationHudSingleton();
    public static function getInstance() : NoGameNotificationHudSingleton {
        return NoGameNotificationHudSingleton.instance;
    }

    private var gameNotificationHud : GameNotificationHud = GameNotificationHud.NULL_GAME_NOTIFICATION;
    public function new() {
        try {
            final basicHudFactory : BasicHudFactory = BasicHudFactory.getInstance();
            // Java inner class: Haxe does not nest classes so move this to its own module
            class NoGameGameNotificationHud extends GameNotificationHud {
                public function new() {
                    super(basicHudFactory.TOPCENTER, basicHudFactory.HORIZONTAL, 2, BasicColorFactory.getInstance().RED);
                    this.updateMaxWidth = 40;
                    this.updateMaxHeight = 14;
                }

            }
            this.gameNotificationHud = new NoGameGameNotificationHud();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
    }

    public function getGameNotificationHud() : GameNotificationHud {
        return this.gameNotificationHud;
    }

}

