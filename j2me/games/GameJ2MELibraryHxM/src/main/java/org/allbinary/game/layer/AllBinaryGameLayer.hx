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
package org.allbinary.game.layer;

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.view.ViewPositionBase;
import org.allbinary.view.event.ViewPositionEvent;
import org.allbinary.view.event.ViewPositionEventListenerInterface;

class AllBinaryGameLayer extends AllBinaryLayer implements ViewPositionEventListenerInterface implements OpenGLSurfaceChangedInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    public final RED : BasicColor = BasicColorFactory.getInstance().RED;
    private final paintable : Paintable = (SWTUtil.isSWT ? /* anonymous class body:
        private final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
        private final BLACK : BasicColor = BasicColorFactory.getInstance().BLACK;
        public function paint(graphics : Graphics) : Void {
            this.basicSetColorUtil.setBasicColorP(graphics, this.BLACK);
        }

*/ new Paintable() : NullPaintable.getInstance());
    private final gameKeyEventList : BasicArrayList = new BasicArrayListD();
    public function new(name : String, layerInfo : Rectangle, viewPosition : ViewPositionBase) {
        super(name, layerInfo, viewPosition);
    }

    // throws Exception
    public override function set(gl : GL) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function move() : Void {
    }

    public function getGameKeyEventList() : BasicArrayList {
        return this.gameKeyEventList;
    }

    // throws Exception
    public function processInput(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public function onViewPositionChangeEvent() : Void {
        this.onChangeEvent(this.viewPositionEvent);
    }

    // throws Exception
    public override function onChangeEvent(layerManagerEvent : ViewPositionEvent) : Void {
        if (GameLayerUtil.isOnScreen(this)) {
            this.setVisible(true);
        } else {
            this.setVisible(false);
        }
    }

    public function paintFirst(graphics : Graphics) : Void {
        this.paintable.paint(graphics);
    }

    public function paintDebug(graphics : Graphics) : Void {
        final viewPosition : ViewPositionBase = this.getViewPosition();
        final viewX : Int = viewPosition.getX();
        final viewY : Int = viewPosition.getY();
        this.basicSetColorUtil.setBasicColorP(graphics, this.RED);
        graphics.drawRect(viewX, viewY, this.getWidth(), this.getHeight());
    }

    public function setWidth(width : Int) : Void {
        super.setLayerWidth(width);
        this.setHalfWidth(width >> 1);
    }

    public function setHeight(height : Int) : Void {
        super.setLayerHeight(height);
        this.setHalfHeight(height >> 1);
    }

}

