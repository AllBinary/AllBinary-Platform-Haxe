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
package org.allbinary.game.layer;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

class RTSLayer2SelectedLogHelper extends RTSLayer2LogHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instanceC : RTSLayer2SelectedLogHelper = new RTSLayer2SelectedLogHelper();
    public static function getInstance() : RTSLayer2SelectedLogHelper {
        return RTSLayer2SelectedLogHelper.instanceC;
    }

    private final TRACK_TO_FIRE_OR_MOVE : String = "trackTo:fireOrMove";
    private final BUILDING_CHASE : String = "buildingChase";
    public override function steeringUp(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" steering - Up").toString(), this, this.TRACK_TO_FIRE_OR_MOVE);
    }

    public override function steeringFireOrStop(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" steering - Fire/All Stop").toString(), this, this.TRACK_TO_FIRE_OR_MOVE);
    }

    public override function buildingAbove(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" Building Above").toString(), this, this.BUILDING_CHASE);
    }

    public override function buildingChaseLeft(pathFindingLayerInterface : PathFindingLayerInterface, angle : Int) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" steering - Going Left: ").appendint(angle).toString(), this, this.BUILDING_CHASE);
    }

    public override function buildingChaseRight(pathFindingLayerInterface : PathFindingLayerInterface, angle : Int) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" steering - Going Right: ").appendint(angle).toString(), this, this.BUILDING_CHASE);
    }

    public override function buildingDown(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" Building Below").toString(), this, this.BUILDING_CHASE);
    }

    public override function buildingChaseDown(pathFindingLayerInterface : PathFindingLayerInterface, angle : Int) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" steering - Going Down: ").appendint(angle).toString(), this, this.BUILDING_CHASE);
    }

    public override function buildingChaseUp(pathFindingLayerInterface : PathFindingLayerInterface, angle : Int) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" steering - Going Up: ").appendint(angle).toString(), this, this.BUILDING_CHASE);
    }

    public function buildingLeft(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" Building Left").toString(), this, this.BUILDING_CHASE);
    }

    public function buildingRight(pathFindingLayerInterface : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(pathFindingLayerInterface.getName()).append(" Building Right").toString(), this, this.BUILDING_CHASE);
    }

    public function new() {
        super();
    }
}

