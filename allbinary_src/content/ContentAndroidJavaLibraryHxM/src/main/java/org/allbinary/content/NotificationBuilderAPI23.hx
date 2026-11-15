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
import android.app.Notification;
import android.app.Notification.Builder;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Parcelable;

class NotificationBuilderAPI23 extends NotificationBuilder {
    public override function build(context : Context, command : Command, message : String, integer : Null<Int>, pendingIntent : PendingIntent) : Parcelable {
        final notification : Notification = new Builder(context).setSmallIcon(Std.int(integer)).setTicker(message).setWhen(haxe.Int64.fromFloat(Date.now().getTime())).setContentTitle(command.getLabel()).setContentText(message).setContentIntent(pendingIntent).build();
        return notification;
    }

    public function new() {
        super();
    }
}

