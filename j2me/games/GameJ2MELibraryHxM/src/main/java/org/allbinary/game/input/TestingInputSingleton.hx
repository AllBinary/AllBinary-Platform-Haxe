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

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Graphics;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.layer.AllBinaryGameLayer;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.view.ViewPosition;

class TestingInputSingleton extends AllBinaryGameLayer implements GameInputInterface {
    private static final instance : TestingInputSingleton = new TestingInputSingleton();
    public static function getInstance() : TestingInputSingleton {
        return TestingInputSingleton.instance;
    }

    public final inputProcessorArray : haxe.ds.Vector<GameInputProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    public function new() {
        super(StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPosition.getInstanceD());
        GameInputProcessorUtil.init(this.inputProcessorArray);
    }

    private var testInputPaintable : PaintableInterface = NullPaintable.getInstance();
    public override function initInputProcessors() : Void {
    }

    public function initInputProcessorsForTestInput(aTestInputInterface : TestInputInterface) : Void {
        final testInputInterface : TestInputInterface = aTestInputInterface;
        this.testInputPaintable = testInputInterface;
        this.inputProcessorArray[Canvas.UP] = /* anonymous class body:
            // throws Exception
            public function processEvent(allbinaryLayerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
                testInputInterface.up();
            }

*/ new GameInputProcessor();
        this.inputProcessorArray[Canvas.DOWN] = /* anonymous class body:
            // throws Exception
            public function processEvent(allbinaryLayerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
                testInputInterface.down();
            }

*/ new GameInputProcessor();
        this.inputProcessorArray[Canvas.LEFT] = /* anonymous class body:
            // throws Exception
            public function processEvent(allbinaryLayerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
                testInputInterface.left();
            }

*/ new GameInputProcessor();
        this.inputProcessorArray[Canvas.RIGHT] = /* anonymous class body:
            // throws Exception
            public function processEvent(allbinaryLayerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
                testInputInterface.right();
            }

*/ new GameInputProcessor();
        this.inputProcessorArray[Canvas.KEY_NUM7] = /* anonymous class body:
            // throws Exception
            public function processEvent(allbinaryLayerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
                testInputInterface.strafeLeft();
            }

*/ new GameInputProcessor();
        this.inputProcessorArray[Canvas.KEY_NUM9] = /* anonymous class body:
            // throws Exception
            public function processEvent(allbinaryLayerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
                testInputInterface.strafeRight();
            }

*/ new GameInputProcessor();
        GameInputProcessorUtil.init(this.inputProcessorArray);
    }

    // throws Exception
    // synchronized
    public function processInputList(allbinaryLayerManager : AllBinaryLayerManager, list : BasicArrayList) : Void {
        var key : Int = 0;
        var gameKeyEvent : GameKeyEvent = null;
        final size : Int = list.size();
        for (index in 0...size) {
            gameKeyEvent = ((cast list.objectArray[index] : GameKeyEvent));
            key = gameKeyEvent.getKey();
            this.inputProcessorArray[key].processEvent(allbinaryLayerManager, GameKeyEvent.NONE);
        }
    }

    // throws Exception
    // synchronized
    public override function processInput(allbinaryLayerManager : AllBinaryLayerManager) : Void {
        this.processInputList(allbinaryLayerManager, this.getGameKeyEventList());
        this.getGameKeyEventList().clear();
    }

    public override function paint(graphics : Graphics) : Void {
        this.testInputPaintable.paint(graphics);
    }

    public override function implmentsGameInputInterface() : Bool {
        return true;
    }

}

