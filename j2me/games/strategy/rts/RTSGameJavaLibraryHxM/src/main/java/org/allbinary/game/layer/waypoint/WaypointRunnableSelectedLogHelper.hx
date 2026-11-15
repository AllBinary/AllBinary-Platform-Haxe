/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.game.layer.waypoint;

import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;

class WaypointRunnableSelectedLogHelper extends WaypointRunnableLogHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instanceC : WaypointRunnableSelectedLogHelper = new WaypointRunnableSelectedLogHelper();
    public static function getInstance() : WaypointRunnableSelectedLogHelper {
        return WaypointRunnableSelectedLogHelper.instanceC;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public override function start(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(this.commonStrings.START_RUNNABLE).toString(), this, this.commonStrings.RUN);
    }

    public override function end(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(this.commonStrings.END_RUNNABLE).toString(), this, this.commonStrings.RUN);
    }

    public function new() {
        super();
    }
}

