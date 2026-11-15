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
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.AngleInfo;
import org.allbinary.math.NamedAngle;
import org.allbinary.math.PositionStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

class RTSLayerSelectedLogHelper extends RTSLayerLogHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instanceC : RTSLayerSelectedLogHelper = new RTSLayerSelectedLogHelper();
    public static function getInstance() : RTSLayerSelectedLogHelper {
        return RTSLayerSelectedLogHelper.instanceC;
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final positionStrings : PositionStrings = PositionStrings.getInstance();
    private final TRACKTO_TURNTO : String = "trackTo:turnTo";
    public override function setClosestGeographicMapCellHistory(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, pathsList : BasicArrayList) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(CommonLabels.getInstance().START);
        stringBuffer.appendint(pathsList.size());
        stringBuffer.append(" -> ");
        stringBuffer.append(StringUtil.getInstance().toString(pathsList));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: setClosestGeographicMapCellHistory");
    }

    public override function trackTo(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition, dx : Int, dy : Int, reason : String) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(StringUtil.getInstance().toString(nextUnvisitedPathGeographicMapCellPosition));
        stringBuffer.append(this.positionStrings.DX_LABEL);
        stringBuffer.appendint(dx);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.positionStrings.DY_LABEL);
        stringBuffer.appendint(dy);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(reason);
        this.logUtil.putF(stringBuffer.toString(), this, "selected: trackTo");
    }

    public override function turnTo(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, dx : Int, dy : Int, angleInfo : AngleInfo, angle : Int, movementAngle : NamedAngle, evading : Bool, targetAngle : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" steering - ");
        stringBuffer.append(this.positionStrings.DX_LABEL);
        stringBuffer.appendint(dx);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.positionStrings.DY_LABEL);
        stringBuffer.appendint(dy);
        stringBuffer.append(" angle: ");
        stringBuffer.appendint(angle);
        stringBuffer.append(" movementAngle: ");
        stringBuffer.append(movementAngle.name);
        stringBuffer.append(this.commonSeps.FORWARD_SLASH);
        stringBuffer.appendshort(Std.int(movementAngle.getValue()));
        if (angleInfo != null) {
            final angleIncrement : Int = angleInfo.getAngleIncrementInfo().getAngleIncrement();
            stringBuffer.append(" angleIncrement: ");
            stringBuffer.appendshort(angleIncrement);
        }
        stringBuffer.append(" Evading: ");
        stringBuffer.appendboolean(evading);
        this.logUtil.putF(stringBuffer.toString(), this, this.TRACKTO_TURNTO);
    }

    public override function doneMoving(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - done moving 0,0").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function closeEnough(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - close enough").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function movingLeft(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - allow movingLeft").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function movingRight(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - allow movingRight").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function movingUp(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - allow movingUp").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function movingDown(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - allow movingDown").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function currentMoveEnded(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - correct angle, but movement not needed for current deltas so reseting movement angle").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function evade(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - evade").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function rotateLeft(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - rotating left").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function rotateRight(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - rotating right").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function handle(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, movementAngle : NamedAngle) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - movementAngle: ").append(movementAngle.name).append(this.commonSeps.FORWARD_SLASH).appendshort(Std.int(movementAngle.getValue())).toString(), this, this.TRACKTO_TURNTO);
    }

    public override function noRotation(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" steering - Do not rotate").toString(), this, this.TRACKTO_TURNTO);
    }

    public override function notOnPath(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, geographicMapCellHistory : GeographicMapCellHistory, currentGeographicMapCellPosition : GeographicMapCellPosition, pathList : BasicArrayList) : Void {
        final stringUtil : StringUtil = StringUtil.getInstance();
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(CommonSeps.getInstance().SPACE).appendint(Std.int(geographicMapCellHistory.getTotalVisited())).append(CommonSeps.getInstance().SPACE).append(stringUtil.toString(currentGeographicMapCellPosition)).append(" - trying to move but not on path: ").append(stringUtil.toString(pathList)).toString(), this, "turnTo");
    }

    public function new() {
        super();
    }
}

