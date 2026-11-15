/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.util.BasicArrayList;

class PathAnimation extends Animation {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final linePathAnimation : LinePathAnimation;
    private final pathFindingLayer : PathFindingLayerInterface;
    public var allBinaryGameLayerManagerP : AllBinaryGameLayerManager = AllBinaryGameLayerManager.getNullInstance();
    public function new(pathFindingLayer : PathFindingLayerInterface, linePathAnimation : LinePathAnimation) {
        super();
        this.pathFindingLayer = pathFindingLayer;
        this.linePathAnimation = linePathAnimation;
    }

    // throws Exception
    public function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        this.allBinaryGameLayerManagerP = allBinaryGameLayerManager;
    }

    // throws Exception
    public override function nextFrame() : Void {
    }

    private final startColor : BasicColor = BasicColorFactory.getInstance().RED;
    private final middleColor : BasicColor = BasicColorFactory.getInstance().BLUE;
    private final endColor : BasicColor = BasicColorFactory.getInstance().GREEN;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        try {
            final waypointBehaviorBase : WaypointBehaviorBase = this.pathFindingLayer.getWaypointBehavior();
            if (waypointBehaviorBase != null) {
                final geographicMapCellHistory : GeographicMapCellHistory = waypointBehaviorBase.getCurrentGeographicMapCellHistory();
                final list : BasicArrayList = geographicMapCellHistory.getTracked();
                final size : Int = list.size();
                if (size > 0) {
                    final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
                    final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
                    final tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
                    var geographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                    var nextPoint : GPoint = null;
                    var point : GPoint = null;
                    var start : Int = size - 2;
                    for (index in 0...size - 1) {
                        if (index == start) {
                            this.setBasicColorP(this.startColor);
                            this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
                        } else if (geographicMapCellHistory.isVisited(geographicMapCellPosition)) {
                            this.setBasicColorP(this.endColor);
                            this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
                        } else {
                            this.setBasicColorP(this.middleColor);
                            this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
                        }
                        geographicMapCellPosition = (cast list.get(index) : GeographicMapCellPosition);
                        point = geographicMapCellPosition.getMidPoint();
                        geographicMapCellPosition = (cast list.get(index + 1) : GeographicMapCellPosition);
                        nextPoint = geographicMapCellPosition.getMidPoint();
                        this.linePathAnimation.paint(graphics, point, nextPoint, tiledLayer);
                    }
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.putF("Cleared Target", this, CanvasStrings.getInstance().PAINT);
        }
    }

}

