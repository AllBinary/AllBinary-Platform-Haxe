/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.unit;

//import javax.microedition.lcdui.Canvas;
import org.allbinary.game.layer.SteeringVisitor;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.CollidableRTSBehavior;
import org.allbinary.util.BasicArrayList;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.TiledLayerUtil;
import org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;
import org.allbinary.string.CommonStrings;

class CollidableUnitBehavior extends CollidableRTSBehavior {
    private final layerPartialCellPositionsUtil : LayerPartialCellPositionsUtil = LayerPartialCellPositionsUtil.getInstance();
    public function new(collidable : Bool) {
        super(collidable);
    }

    // throws Exception
    public override function collideNone(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void {
        this.chase(ownerLayer, collidableInterfaceCompositeInterface);
        final rtsLayer : AdvancedRTSGameLayer = (cast collidableInterfaceCompositeInterface : AdvancedRTSGameLayer);
        if (rtsLayer.getType() == UnitLayer.getStaticType()) {
            this.collideUnit(ownerLayer, (cast rtsLayer : UnitLayer));
        }
    }

    // Java inner class: Haxe does not nest classes so move this to its own module
    class SimpleSteeringVisitor extends SteeringVisitor {
        public override function visit(anyType : Any) : Any {
            final logUtil : LogUtil = LogUtil.getInstance();
            try {
                final ownerLayer : CollidableCompositeLayer = (cast anyType : CollidableCompositeLayer);
                if (this.getList().size() > 0) {
                    final allbinaryLayer : CollidableCompositeLayer = (cast this.getList().get(0) : CollidableCompositeLayer);
                    var clear : Bool = this.steer(ownerLayer, allbinaryLayer);
                    if (clear) {
                        this.getList().clear();
                        return NullUtil.getInstance().NULL_OBJECT;
                    }
                    return BooleanFactory.getInstance().TRUE;
                }
                return NullUtil.getInstance().NULL_OBJECT;
            } catch (e : haxe.Exception) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, this, "visit", e);
                return NullUtil.getInstance().NULL_OBJECT;
            }
        }

        public function new() {
            super();
        }
    }
    private final simpleSteeringVisitor : SimpleSteeringVisitor = new SimpleSteeringVisitor();
    // throws Exception
    private function steer(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Bool {
        final ownerUnitLayer : UnitLayer = (cast ownerLayer : UnitLayer);
        final unitLayer : UnitLayer = (cast collidableInterfaceCompositeInterface : UnitLayer);
        final angleInfo2 : AngleInfo = unitLayer.getRotationAnimationInterface().getAngleInfoP();
        final angleInfo : AngleInfo = ownerUnitLayer.getRotationAnimationInterface().getAngleInfoP();
        final angle : Int = angleInfo.getAngle() - angleInfo2.getAngle();
        if (angle < 90 || angle > 270) {
            return true;
        } else if (angle >= 90 || angle <= 270) {
            ownerUnitLayer.getGameKeyEventList().add(GameKeyEventFactory.getInstance().getInstanceForKey(ownerUnitLayer, Canvas.RIGHT));
            return false;
        }
        throw new haxe.Exception("Error");
    }

    // throws Exception
    private function chase(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableCompositeLayer) : Void {
        final rtsLayer : AdvancedRTSGameLayer = (cast collidableInterfaceCompositeInterface : AdvancedRTSGameLayer);
        if (rtsLayer.getType() == UnitLayer.getStaticType()) {
            if (!this.simpleSteeringVisitor.getList().contains(collidableInterfaceCompositeInterface)) {
                this.simpleSteeringVisitor.getList().add(collidableInterfaceCompositeInterface);
            }
            final ownerUnitLayer : UnitLayer = (cast ownerLayer : UnitLayer);
            final list : BasicArrayList = ownerUnitLayer.getUnitWaypointBehavior().getSteeringVisitorList();
            if (!list.contains(this.simpleSteeringVisitor)) {
                list.add(this.simpleSteeringVisitor);
            }
        }
    }

    // throws Exception
    public function collideUnit(ownerLayer : CollidableCompositeLayer, unitLayer : UnitLayer) : Void {
        final ownerUnitLayer : UnitLayer = (cast ownerLayer : UnitLayer);
        final partialPositionList : BasicArrayList = UnitLayer.getPartialpositionlist();
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast ownerUnitLayer.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final basicGeographicMap : BasicGeographicMap = geographicMapInterface;
        final dropCellPositionHistory : DropCellPositionHistory = DropCellPositionHistory.getInstance();
        final tiledLayerUtil : TiledLayerUtil = TiledLayerUtil.getInstance();
        final tiledLayer : AllBinaryTiledLayer = basicGeographicMap.getAllBinaryTiledLayer();
        if (ownerLayer.getXP() < unitLayer.getXP() && ownerLayer.getX2() > unitLayer.getXP()) {
            final diff : Int = ownerLayer.getWidth() + 1;
            this.layerPartialCellPositionsUtil.getAllDXY(basicGeographicMap, ownerLayer, -diff, 0, partialPositionList);
            if (!dropCellPositionHistory.anyCellPositionWithDrop(partialPositionList)) {
                var x : Int = unitLayer.getXP() - diff;
                var y : Int = ownerLayer.getYP();
                x = tiledLayerUtil.keepOnMapX(tiledLayer, x, ownerLayer.getWidth());
                y = tiledLayerUtil.keepOnMapY(tiledLayer, y, ownerLayer.getHeight());
                ownerLayer.setPosition(x, y, ownerLayer.getZP());
            }
            this.layerPartialCellPositionsUtil.getAllDXY(basicGeographicMap, unitLayer, diff, 0, partialPositionList);
            if (!dropCellPositionHistory.anyCellPositionWithDrop(partialPositionList)) {
                var x : Int = unitLayer.getXP() + diff;
                var y : Int = unitLayer.getYP();
                x = tiledLayerUtil.keepOnMapX(tiledLayer, x, unitLayer.getWidth());
                y = tiledLayerUtil.keepOnMapY(tiledLayer, y, unitLayer.getHeight());
                unitLayer.setPosition(x, y, unitLayer.getZP());
            }
        }
        if (ownerLayer.getYP() < unitLayer.getYP() && ownerLayer.getY2() > unitLayer.getYP()) {
            var diff : Int = ownerLayer.getHeight() + 1;
            this.layerPartialCellPositionsUtil.getAllDXY(basicGeographicMap, ownerLayer, 0, -diff, partialPositionList);
            if (!dropCellPositionHistory.anyCellPositionWithDrop(partialPositionList)) {
                var x : Int = ownerLayer.getXP();
                var y : Int = unitLayer.getYP() - diff;
                x = tiledLayerUtil.keepOnMapX(tiledLayer, x, ownerLayer.getWidth());
                y = tiledLayerUtil.keepOnMapY(tiledLayer, y, ownerLayer.getHeight());
                ownerLayer.setPosition(x, y, ownerLayer.getZP());
            }
            this.layerPartialCellPositionsUtil.getAllDXY(basicGeographicMap, unitLayer, 0, diff, partialPositionList);
            if (!dropCellPositionHistory.anyCellPositionWithDrop(partialPositionList)) {
                var x : Int = unitLayer.getXP();
                var y : Int = unitLayer.getYP() + diff;
                x = tiledLayerUtil.keepOnMapX(tiledLayer, x, unitLayer.getWidth());
                y = tiledLayerUtil.keepOnMapY(tiledLayer, y, unitLayer.getHeight());
                unitLayer.setPosition(x, y, unitLayer.getZP());
            }
        }
    }

}

