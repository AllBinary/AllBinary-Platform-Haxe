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

//import javax.microedition.lcdui.Command;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.TsUtil;

class NotificationUtil {
    private static final SINGLETON : NotificationUtil = new NotificationUtil();
    private var notificationManager : NotificationManager = (cast ResourceUtil.getInstance().getContext().getSystemService(Context.NOTIFICATION_SERVICE) : NotificationManager);
    public static function getInstance() : NotificationUtil {
        return NotificationUtil.SINGLETON;
    }

    public function notify(command : Command, resource : String, message : String) : Void {
        var context : Context = ResourceUtil.getInstance().getContext();
        var intent : Intent = CommandUriAction.getInstance().getIntent(command);
        var integer : Null<Int> = ResourceUtil.getInstance().getResourceId(resource);
        var notification : Notification = new Notification(Std.int(integer), message, haxe.Int64.fromFloat(Date.now().getTime()));
        var pendingIntent : PendingIntent = PendingIntent.getActivity(context, 0, intent, 0);
        notification.setLatestEventInfo(context, command.getLabel(), message, pendingIntent);
        this.notificationManager.notify(TsUtil.getInstance().hashCode(command), notification);
    }

    public function new() {
    }
}

