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
package org.allbinary.game.input;

//import javax.microedition.lcdui.Canvas;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.util.BasicArrayList;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.event.ScrollMapEvent;
import org.allbinary.layer.event.ScrollMapEventHandler;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.util.BasicArrayListD;

class ScrollMapPlayerGameInput extends PlayerGameInput {
    public final inputProcessorArray : haxe.ds.Vector<GameInputProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    private final border : Int = 150;
    private final inputList : BasicArrayList;
    public final isSingleKeyProcessing : Bool = Features.getInstance().isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) || Features.getInstance().isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS);
    private final geographicMapInterface : BasicGeographicMap;
    private var maxBottom : Int = 0;
    private var maxRight : Int = 0;
    public function new(geographicMapInterface : BasicGeographicMap, list : BasicArrayList, playerInputId : Int) {
        super(list, new BasicArrayListD(), playerInputId);
        this.initInputProcessors();
        this.geographicMapInterface = geographicMapInterface;
        this.inputList = list;
        this.init();
    }

    private final scrollMapEvent : ScrollMapEvent = new ScrollMapEvent(this);
    // throws Exception
    private function move(dx : Int, dy : Int) : Void {
        var terrainTiledLayer : AllBinaryTiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        terrainTiledLayer.moveDXY(-dx, -dy);
        this.scrollMapEvent.setDxDy(-dx, -dy);
        ScrollMapEventHandler.getInstance().fireEvent(this.scrollMapEvent);
    }

    public function init() : Void {
        this.maxBottom = this.getSpecialHeight();
        this.maxRight = this.getSpecialWidth();
    }

    // throws Exception
    public function scrollMiddleX() : Void {
        var terrainTiledLayer : AllBinaryTiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        this.move(-terrainTiledLayer.getXP(), 0);
        if (terrainTiledLayer.getWidth() < displayInfo.getLastWidth()) {
            var diffX : Int = ((displayInfo.getLastWidth() - terrainTiledLayer.getWidth()) >> 1);
            this.move(-diffX, 0);
        } else {
            var diffX : Int = ((terrainTiledLayer.getWidth() - displayInfo.getLastWidth()) >> 1);
            this.move(diffX, 0);
        }
    }

    // throws Exception
    public function scrollY(anchor : Int) : Void {
        var terrainTiledLayer : AllBinaryTiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        if (anchor == Graphics.TOP) {
            this.logUtil.putF("Top", this, "scrollY");
        } else if (anchor == Graphics.BOTTOM) {
            this.logUtil.putF("Bottom", this, "scrollY");
            var diffY : Int = (terrainTiledLayer.getHeight() - displayInfo.getLastHeight());
            this.move(0, diffY);
        } else if (anchor == Graphics.VCENTER) {
            this.logUtil.putF("Center", this, "scrollY");
            var diffY : Int = (terrainTiledLayer.getHeight() - displayInfo.getLastHeight()) / 2;
            this.move(0, diffY);
        } else {
            throw new haxe.Exception("No Such Anchor Supported");
        }
    }

    // throws Exception
    public function up() : Void {
        var y : Int = this.geographicMapInterface.getAllBinaryTiledLayer().getYP() - 10;
        if (this.keepOnMapMinY(y)) {
            this.move(0, -10);
        }
    }

    // throws Exception
    public function down() : Void {
        var y : Int = -this.geographicMapInterface.getAllBinaryTiledLayer().getYP() + 10;
        if (this.keepOnMapMaxY(y)) {
            this.move(0, 10);
        }
    }

    // throws Exception
    public function right() : Void {
        var x : Int = this.geographicMapInterface.getAllBinaryTiledLayer().getYP() + 10;
        if (this.keepOnMapMinX(x)) {
            this.move(10, 0);
        }
    }

    // throws Exception
    public function left() : Void {
        var x : Int = -this.geographicMapInterface.getAllBinaryTiledLayer().getYP() - 10;
        if (this.keepOnMapMaxX(x)) {
            this.move(-10, 0);
        }
    }

    public function initInputProcessors() : Void {
        this.inputProcessorArray[Canvas.UP] = new ScrollMapUpGameInputProcessor(this);
        this.inputProcessorArray[Canvas.DOWN] = new ScrollMapDownGameInputProcessor(this);
        this.inputProcessorArray[Canvas.KEY_NUM9] = new ScrollMapRightGameInputProcessor(this);
        this.inputProcessorArray[Canvas.KEY_NUM7] = new ScrollMapLeftGameInputProcessor(this);
        GameInputProcessorUtil.init(this.inputProcessorArray);
    }

    // throws Exception
    public function processInputKey(key : Int) : Void {
        this.inputProcessorArray[key].processEvent(AllBinaryGameLayerManager.getNullInstance(), GameKeyEvent.NONE);
    }

    // throws Exception
    public function processInput(layerManager : AllBinaryLayerManager) : Void {
        try {
            var size : Int = this.inputList.size();
            var key : Int = 0;
            for (index in 0...size) {
                var gameKeyEvent : GameKeyEvent = (cast this.inputList.get(index) : GameKeyEvent);
                key = gameKeyEvent.getKey();
                this.processInputKey(key);
            }
            if (this.isSingleKeyProcessing) {
                this.clear();
            } else {
                this.update();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.PROCESS_INPUT, e);
        }
    }

    private function getSpecialHeight() : Int {
        var terrainTiledLayer : AllBinaryTiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        if (terrainTiledLayer.getHeight() > displayInfo.getLastHeight()) {
            return terrainTiledLayer.getHeight() - displayInfo.getLastHeight();
        } else {
            return displayInfo.getLastHeight() - terrainTiledLayer.getHeight() + terrainTiledLayer.getCellHeight();
        }
    }

    private function getSpecialWidth() : Int {
        var terrainTiledLayer : AllBinaryTiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        if (terrainTiledLayer.getWidth() > displayInfo.getLastWidth()) {
            return terrainTiledLayer.getWidth() - displayInfo.getLastWidth();
        } else {
            return displayInfo.getLastWidth() - terrainTiledLayer.getWidth() + terrainTiledLayer.getCellWidth();
        }
    }

    public function keepOnMapMaxY(newY : Int) : Bool {
        var y : Int = this.geographicMapInterface.getAllBinaryTiledLayer().getYP();
        if (y > this.maxBottom + this.border) {
            return false;
        } else {
            return true;
        }
    }

    public function keepOnMapMinY(newY : Int) : Bool {
        var y : Int = this.geographicMapInterface.getAllBinaryTiledLayer().getYP();
        if (y < -this.border) {
            return false;
        } else {
            return true;
        }
    }

    public function keepOnMapMaxX(newX : Int) : Bool {
        var x : Int = this.geographicMapInterface.getAllBinaryTiledLayer().getXP();
        if (x < -this.maxRight - this.border) {
            return false;
        } else {
            return true;
        }
    }

    public function keepOnMapMinX(newX : Int) : Bool {
        var x : Int = this.geographicMapInterface.getAllBinaryTiledLayer().getXP();
        if (x > this.border) {
            return false;
        } else {
            return true;
        }
    }

}

