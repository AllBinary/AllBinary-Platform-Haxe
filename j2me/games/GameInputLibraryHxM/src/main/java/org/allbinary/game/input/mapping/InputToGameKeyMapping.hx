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
package org.allbinary.game.input.mapping;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class InputToGameKeyMapping extends InputMapping {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : InputToGameKeyMapping {
        if (InputToGameKeyMapping.instance == NullUtil.getInstance().NULL_OBJECT) {
            InputToGameKeyMapping.instance = new InputToGameKeyMapping();
        }
        return (cast InputToGameKeyMapping.instance : InputToGameKeyMapping);
    }

    private final gameKeyFactory : GameKeyFactory = GameKeyFactory.getInstance();
    private final mappedGameKeys : haxe.ds.Vector<GameKey>;
    private final platformToGameKeyMapping : haxe.ds.Vector<GameKey> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    public var negativePlatformToGameKeyMapping : haxe.ds.Vector<GameKey> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public function new() {
        super();
        this.mappedGameKeys = haxe.ds.Vector.fromArrayCopy(([this.gameKeyFactory.UP, this.gameKeyFactory.DOWN, this.gameKeyFactory.LEFT, this.gameKeyFactory.RIGHT] : Array<GameKey>));
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.clear();
    }

    private function clear() : Void {
        {
            var index : Int = this.platformToGameKeyMapping.length - 1;
            while (index >= 0) {
            this.platformToGameKeyMapping[index] = this.gameKeyFactory.NONE;
                index--;
            }
        }
    }

    public override function removeAll() : Void {
        super.removeAll();
        this.clear();
    }

    public override function addMapping(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        {
            var index : Int = inputToGameKeyMapping.getMaxMappable() - 1;
            while (index >= 0) {
            final input : Input = inputToGameKeyMapping.getInstanceFor(index);
            if (input != this.gameKeyFactory.NONE) {
                this.addAll(input, inputToGameKeyMapping.getMappedInput(input));
            }
                index--;
            }
        }
    }

    private function addAll(input : Input, list : BasicArrayList) : Void {
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            var mappedToInput : Input = (cast list.objectArray[index] : Input);
            this.add(input, mappedToInput);
                index--;
            }
        }
    }

    public override function add(input : Input, mappedToInput : Input) : Void {
        super.add(input, mappedToInput);
        this.set(input, mappedToInput);
    }

    public override function remove(input : Input, mappedToInput : Input) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(StringUtil.getInstance().toString(input)).append(" == ").append(StringUtil.getInstance().toString(mappedToInput))), this, "InputToGameKeyMapping::remove");
        super.remove(input, mappedToInput);
        this.set(input, this.gameKeyFactory.NONE);
    }

    private function set(input : Input, mappedToInput : Input) : Void {
        var id : Int = mappedToInput.getId();
        if (id >= 0 && id < this.platformToGameKeyMapping.length) {
            this.platformToGameKeyMapping[id] = (cast input : GameKey);
        }
    }

    public function getMaxMappable() : Int {
        return this.platformToGameKeyMapping.length;
    }

    public function getReverseInstance(id : Int) : BasicArrayList {
        var list : BasicArrayList = new BasicArrayListD();
        final inputFactory : InputFactory = InputFactory.getInstance();
        for (index in 0...this.platformToGameKeyMapping.length) {
            if (this.platformToGameKeyMapping[index].getId() == id) {
                var input : Input = inputFactory.getInstanceById(index);
                if (input != null) {
                    list.add(input);
                }
            }
        }
        return list;
    }

    // throws Exception
    private function initGameKey(canvas : Canvas, gameKey : GameKey) : Void {
        var key : Int = canvas.getKeyCode(gameKey.getId());
        if (key < 0 && -key < this.negativePlatformToGameKeyMapping.length) {
            this.negativePlatformToGameKeyMapping[-key] = gameKey;
        } else if (key > 0) {
            if (this.platformToGameKeyMapping[key] == this.gameKeyFactory.NONE) {
                this.platformToGameKeyMapping[key] = gameKey;
            }
        } else {
            PreLogUtil.putOE(Std.string(new StringMaker().append(Std.string(gameKey)).append(CommonSeps.getInstance().COLON_SEP).appendint(key)), this, this.commonStrings.INIT, new jre.lang.JavaException());
        }
    }

    // throws Exception
    private function getSmallestCanvasGameKeyCode(canvas : Canvas) : Int {
        var nextKey : Int = 0;
        var smallestKey : Int = 0;
        {
            var index : Int = this.mappedGameKeys.length;
            while (--index >= 0) {
            nextKey = canvas.getKeyCode(this.mappedGameKeys[index].getId());
            if (nextKey < smallestKey) {
                smallestKey = nextKey;
            }
            }
        }
        return smallestKey;
    }

    public function init(canvas : Canvas) : Void {
        try {
            var negativePlatformToGameKeyMapping : haxe.ds.Vector<GameKey> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
            var smallestKey : Int = this.getSmallestCanvasGameKeyCode(canvas);
            if (smallestKey < 0) {
                smallestKey--;
                if (smallestKey < -256) {
                    smallestKey = -256;
                }
                negativePlatformToGameKeyMapping = haxe.ds.Vector.fromArrayCopy([for (index in 0...-smallestKey) null]);
                {
                    var index : Int = negativePlatformToGameKeyMapping.length;
                    while (--index >= 0) {
                    negativePlatformToGameKeyMapping[index] = this.gameKeyFactory.NONE;
                    }
                }
                this.negativePlatformToGameKeyMapping = negativePlatformToGameKeyMapping;
            }
            {
                var index : Int = this.mappedGameKeys.length;
                while (--index >= 0) {
                this.initGameKey(canvas, this.mappedGameKeys[index]);
                }
            }
        } catch (t : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, t);
        }
    }

    public function getInstanceForCanvas(canvas : Canvas, id : Int) : GameKey {
        if (id >= 0 && id < this.platformToGameKeyMapping.length) {
            return this.platformToGameKeyMapping[id];
        } else if (id < 0 && -id < this.negativePlatformToGameKeyMapping.length) {
            return this.negativePlatformToGameKeyMapping[-id];
        } else {
            return this.gameKeyFactory.NONE;
        }
    }

    public function getInstanceFor(id : Int) : GameKey {
        if (id >= 0 && id < this.platformToGameKeyMapping.length) {
            return this.platformToGameKeyMapping[id];
        } else if (id < 0 && -id < this.negativePlatformToGameKeyMapping.length) {
            return this.negativePlatformToGameKeyMapping[-id];
        } else {
            return this.gameKeyFactory.NONE;
        }
    }

}

