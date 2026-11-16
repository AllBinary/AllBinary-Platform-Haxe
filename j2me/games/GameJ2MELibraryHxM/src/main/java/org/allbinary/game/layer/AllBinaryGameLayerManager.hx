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

import org.allbinary.game.GameInfo;
import org.allbinary.game.input.NullPlayerGameInputComposite;
import org.allbinary.game.input.PlayerGameInputCompositeInterface;
import org.allbinary.graphics.ItemColorFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerProcessor;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.util.BasicArrayList;

class AllBinaryGameLayerManager extends AllBinaryLayerManager {
    private static var NULL_ALLBINARY_LAYER_MANAGER : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : AllBinaryGameLayerManager {
        if (AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER == NullUtil.getInstance().NULL_OBJECT) {
            AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER = new AllBinaryGameLayerManager(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE, GameInfo.NONE);
        }
        return (cast AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER : AllBinaryGameLayerManager);
    }

    public static final ID : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(22);
    private var backgroundBasicColor : BasicColor;
    private var foregroundBasicColor : BasicColor;
    private var gameInfo : GameInfo;
    private var playerGameInputCompositeInterface : PlayerGameInputCompositeInterface = NullPlayerGameInputComposite.NULL_PLAYER_GAME_INPUT_COMPOSITE;
    public function new(backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor, gameInfo : GameInfo) {
        super();
        this.backgroundBasicColor = backgroundBasicColor;
        this.foregroundBasicColor = foregroundBasicColor;
        var itemColorFactory : ItemColorFactory = ItemColorFactory.getInstance();
        itemColorFactory.INVERT_PAINT = jre.lang.JavaObject.intValue(this.backgroundBasicColor);
        itemColorFactory.PAINT = jre.lang.JavaObject.intValue(this.foregroundBasicColor);
        this.gameInfo = gameInfo;
    }

    public function getLayerManager() : AllBinaryLayerManager {
        return this;
    }

    public function init() : Void {
    }

    public function getBackgroundBasicColor() : BasicColor {
        return this.backgroundBasicColor;
    }

    public function setBackgroundBasicColor(backgroundBasicColor : BasicColor) : Void {
        this.backgroundBasicColor = backgroundBasicColor;
        ItemColorFactory.getInstance().INVERT_PAINT = jre.lang.JavaObject.intValue(this.backgroundBasicColor);
    }

    public function getForegroundBasicColor() : BasicColor {
        return this.foregroundBasicColor;
    }

    public function setForegroundBasicColor(foregroundBasicColor : BasicColor) : Void {
        this.foregroundBasicColor = foregroundBasicColor;
        ItemColorFactory.getInstance().PAINT = jre.lang.JavaObject.intValue(this.foregroundBasicColor);
    }

    public function getGameInfo() : GameInfo {
        return this.gameInfo;
    }

    public function setGameInfo(gameInfo : GameInfo) : Void {
        this.gameInfo = gameInfo;
    }

    public function setLayerProcessorList(list : BasicArrayList) : Void {
        final layerProcessorInterfaceArray : haxe.ds.Vector<LayerProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...list.size()) null]);
        var size : Int = layerProcessorInterfaceArray.length;
        for (index in 0...size) {
            layerProcessorInterfaceArray[index] = (cast list.objectArray[index] : LayerProcessor);
        }
        this.setLayerProcessorArray(layerProcessorInterfaceArray);
    }

    public function setPlayerGameInputCompositeInterface(playerGameInputCompositeInterface : PlayerGameInputCompositeInterface) : Void {
        this.playerGameInputCompositeInterface = playerGameInputCompositeInterface;
    }

    public function getPlayerGameInputCompositeInterface() : PlayerGameInputCompositeInterface {
        return this.playerGameInputCompositeInterface;
    }

}

