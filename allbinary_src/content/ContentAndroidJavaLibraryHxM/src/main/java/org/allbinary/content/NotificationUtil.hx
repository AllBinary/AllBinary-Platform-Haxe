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
package org.allbinary.content;

import javax.microedition.lcdui.Command;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import org.allbinary.android.AndroidInfoFactory;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class NotificationUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final SINGLETON : NotificationUtil = new NotificationUtil();
    private var notificationManager : NotificationManager = (cast ResourceUtil.getInstance().getContext().getSystemService(Context.NOTIFICATION_SERVICE) : NotificationManager);
    public static function getInstance() : NotificationUtil {
        return NotificationUtil.SINGLETON;
    }

    private final notificationBuilder : NotificationBuilder = null;
    public function new() {
        final SDK_VERSION : Int = AndroidInfoFactory.getInstance().getVersion();
        if (SDK_VERSION > 22) {
            this.notificationBuilder = new NotificationBuilderAPI23();
        } else {
            this.notificationBuilder = NotificationBuilder.NULL_NOTIFICATION_BUILDER;
        }
    }

    public function notify(command : Command, resource : String, message : String) : Void {
        final context : Context = ResourceUtil.getInstance().getContext();
        final intent : Intent = CommandUriAction.getInstance().getIntent(command);
        final integer : Null<Int> = ResourceUtil.getInstance().getResourceId(resource);
        final FLAG_IMMUTABLE : Int = 1 << 26;
        final SDK_VERSION : Int = AndroidInfoFactory.getInstance().getVersion();
        final pendingIntent : PendingIntent = PendingIntent.getActivity(context, 0, intent, (SDK_VERSION > 22 ? FLAG_IMMUTABLE : 0));
        if (this.notificationBuilder == null) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.EXCEPTION, this, commonStrings.NOT_IMPLEMENTED);
            return;
        }
        this.notificationBuilder.build(context, command, message, integer, pendingIntent);
    }

}

