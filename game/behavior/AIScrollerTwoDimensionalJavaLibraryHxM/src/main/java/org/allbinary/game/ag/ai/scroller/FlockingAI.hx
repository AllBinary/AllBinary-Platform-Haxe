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
package org.allbinary.game.ag.ai.scroller;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.layer.identification.GroupLayerManagerListener;
import org.allbinary.game.layer.weapon.WeaponLayer;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

class FlockingAI extends BasicAI {
    private final allowedDistance : Int;
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        final allowedDistance : Null<Int> = (cast hashtable.get(BasePatrolAI.MAX_DISTANCE) : Null<Int>);
        this.allowedDistance = allowedDistance.intValue();
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        var maxDistance : Int = 0;
        var farAllbinaryLayer : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
        final groupLayerManagerListener : GroupLayerManagerListener = GroupLayerManagerListener.getInstance();
        final list : BasicArrayList = groupLayerManagerListener.getList(BasicGroupFactory.getInstance().ENEMY);
        final size : Int = list.size();
        var allBinaryLayer : AllBinaryLayer = null;
        var ownerLayerInterface : AllBinaryLayer = null;
        for (index in 0...size) {
            allBinaryLayer = (cast list.get(index) : AllBinaryLayer);
            if (allBinaryLayer.getType() != WeaponLayer.getStaticType()) {
                var distance : Int = this.getXYDistance(allBinaryLayer);
                if (distance > maxDistance) {
                    maxDistance = distance;
                    farAllbinaryLayer = allBinaryLayer;
                    if (distance > this.allowedDistance) {
                        break;
                    }
                }
            }
        }
        if (maxDistance > this.allowedDistance) {
            if (farAllbinaryLayer != AllBinaryLayer.NULL_ALLBINARY_LAYER) {
                ownerLayerInterface = this.getOwnerLayerInterface();
                if (farAllbinaryLayer.getXP() < ownerLayerInterface.getXP()) {
                    this.processKeyAI(Canvas.LEFT);
                } else if (farAllbinaryLayer.getXP() > ownerLayerInterface.getXP()) {
                    this.processKeyAI(Canvas.RIGHT);
                } else if (farAllbinaryLayer.getYP() > ownerLayerInterface.getYP()) {
                    this.processKeyAI(Canvas.UP);
                } else if (farAllbinaryLayer.getYP() < ownerLayerInterface.getYP()) {
                    this.processKeyAI(Canvas.DOWN);
                }
            }
        }
    }

    private function getXYDistance(allBinaryLayer : AllBinaryLayer) : Int {
        final ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        final xTotalDistance : Int = (allBinaryLayer.getXP() + allBinaryLayer.getHalfWidth()) - (ownerLayerInterface.getXP() + ownerLayerInterface.getHalfWidth());
        final yTotalDistance : Int = (allBinaryLayer.getYP() + allBinaryLayer.getHalfHeight()) - (ownerLayerInterface.getYP() + ownerLayerInterface.getHalfHeight());
        final mathUtil : MathUtil = MathUtil.getInstance();
        final totalDistance : Int = mathUtil.abs(xTotalDistance) + mathUtil.abs(yTotalDistance);
        return totalDistance;
    }

}

