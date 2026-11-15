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
package org.allbinary.game.layer.geographic.map;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.animation.vector.CircleFilledAnimation;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.ColorCompositeInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEvent;
import org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventHandler;
import org.allbinary.media.graphics.geography.map.event.GeographicMapCellPositionEventListenerInterface;
import org.allbinary.view.ViewPositionBase;

class MiniMapLayer extends AllBinaryLayer implements GeographicMapCellPositionEventListenerInterface {
    public final allBinaryTiledLayer : AllBinaryTiledLayer;
    private final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory;
    private final list : BasicArrayList;
    private final basicColorList : BasicArrayList;
    private final positionList : BasicArrayList;
    private var animationInterface : CircleFilledAnimation;
    public function new(geographicMapInterface : BasicGeographicMap, viewPosition : ViewPositionBase) {
        super(StringUtil.getInstance().EMPTY_STRING, new Rectangle(PointFactory.getInstance().createXY(0, viewPosition.getY()), geographicMapInterface.getAllBinaryTiledLayer().getWidth(), geographicMapInterface.getAllBinaryTiledLayer().getHeight()), viewPosition);
        this.allBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        this.geographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        this.animationInterface = new CircleFilledAnimation(this.allBinaryTiledLayer.getCellWidth(), this.allBinaryTiledLayer.getCellHeight(), BasicColorFactory.getInstance().WHITE);
        this.list = new BasicArrayListD();
        this.basicColorList = new BasicArrayListD();
        this.positionList = new BasicArrayListD();
        GeographicMapCellPositionEventHandler.getInstance().addListener(this);
        this.init();
    }

    // throws Exception
    public function init() : Void {
        this.allBinaryTiledLayer.setPosition(this.x, this.y, this.z);
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    // synchronized
    public override function onRemoveGeographicMapCellPositionEvent(geographicMapCellPositionEvent : GeographicMapCellPositionEvent) : Void {
        final colorCompositeInterface : ColorCompositeInterface = (cast geographicMapCellPositionEvent.getSource() : ColorCompositeInterface);
        final index : Int = this.list.indexOf(colorCompositeInterface);
        if (index >= 0) {
            this.list.removeAt(index);
            this.basicColorList.removeAt(index);
            this.positionList.removeAt(index);
        }
    }

    // throws Exception
    // synchronized
    public override function onGeographicMapCellPositionEvent(geographicMapCellPositionEvent : GeographicMapCellPositionEvent) : Void {
        final colorCompositeInterface : ColorCompositeInterface = (cast geographicMapCellPositionEvent.getSource() : ColorCompositeInterface);
        var layerIndex : Int = -1;
        var size : Int = this.list.size();
        var nextColorCompositeInterface : ColorCompositeInterface = null;
        for (index in 0...size) {
            nextColorCompositeInterface = (cast this.list.get(index) : ColorCompositeInterface);
            if (nextColorCompositeInterface == colorCompositeInterface) {
                layerIndex = index;
                break;
            }
        }
        final geographicMapCellPosition : GeographicMapCellPosition = this.geographicMapCellPositionFactory.getInstance(geographicMapCellPositionEvent.getGeographicMapCellPosition());
        var point : GPoint = geographicMapCellPosition.getPoint();
        if (layerIndex == -1) {
            this.list.add(colorCompositeInterface);
            var basicColor : BasicColor = colorCompositeInterface.getBasicColorP();
            this.basicColorList.add(basicColor);
            this.positionList.add(point);
            layerIndex = this.basicColorList.size() - 1;
        } else {
            this.positionList.set(layerIndex, point);
        }
    }

    public function paintDots(graphics : Graphics) : Void {
        final localPositionList : BasicArrayList = this.positionList;
        final localBasicColorList : BasicArrayList = this.basicColorList;
        final length : Int = localPositionList.size();
        var point : GPoint = null;
        var basicColor : BasicColor = null;
        {
            var index : Int = length;
            while (--index >= 0) {
            point = (cast localPositionList.get(index) : GPoint);
            basicColor = (cast localBasicColorList.get(index) : BasicColor);
            graphics.setColor(Std.int(basicColor));
            this.animationInterface.setBasicColorP(basicColor);
            this.animationInterface.paintXY(graphics, point.getX() + this.x, point.getY() + this.y);
            }
        }
    }

    public override function paint(graphics : Graphics) : Void {
        this.allBinaryTiledLayer.paint(graphics);
        this.paintDots(graphics);
    }

}

