/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2019 AllBinary 
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
package org.allbinary.android;

//import java.util.List;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningServiceInfo;
import android.content.ComponentName;
import android.content.Context;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.communication.log.LogUtil;

class AndroidServicesUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static function getInstance() : AndroidServicesUtil {
        return AndroidServicesUtil.instance;
    }

    private static final instance : AndroidServicesUtil = new AndroidServicesUtil();
    private final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
    private final SERVICE_LIMIT_MAX : Int = 1000;
    private final IS_SERVICE_RUNNING : String = "isServiceRunning";
    private final SERVICE_NOT_FOUND_RUNNING : String = "Service not found Running: ";
    public function isServiceRunning(name : String) : Bool {
        final activityManager : ActivityManager = (cast this.resourceUtil.getContext().getSystemService(Context.ACTIVITY_SERVICE) : ActivityManager);
        final runningServicesList : List<RunningServiceInfo> = activityManager.getRunningServices(this.SERVICE_LIMIT_MAX);
        var runningServiceInfo : RunningServiceInfo = null;
        var serviceComponent : ComponentName = null;
        var serviceName : String = null;
        final size : Int = runningServicesList.size();
        for (index in 0...size) {
            runningServiceInfo = runningServicesList.get(index);
            serviceComponent = runningServiceInfo.service;
            serviceName = serviceComponent.toString();
            if (serviceName.indexOf(name) >= 0) {
                return true;
            }
        }
        this.logUtil.putF(this.SERVICE_NOT_FOUND_RUNNING + name, this, this.IS_SERVICE_RUNNING);
        return false;
    }

    public function new() {
    }
}

