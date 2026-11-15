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
package org.allbinary.input.motion.button;

import org.allbinary.game.input.InputFactory;
import org.allbinary.game.input.mapping.InputToGameKeyMapping;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicTouchInputFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : BasicTouchInputFactory {
        if (BasicTouchInputFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            BasicTouchInputFactory.instance = new BasicTouchInputFactory();
        }
        return (cast BasicTouchInputFactory.instance : BasicTouchInputFactory);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final SPECIAL_BUTTON_SIX : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 30, "Button 6");
    public final SPECIAL_BUTTON_FIVE : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 31, "Button 5");
    public final SPECIAL_BUTTON_FOUR : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 32, "Button 4");
    public final SPECIAL_BUTTON_THREE : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 33, "Button 3");
    public final SPECIAL_BUTTON_TWO : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 34, "Button 2");
    public final SPECIAL_BUTTON_ONE : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 35, "Button 1");
    public final UP : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 36, "Up Button");
    public final LEFT : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 37, "Left Button");
    public final RIGHT : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 38, "Right Button");
    public final DOWN : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 39, "Down Button");
    public final NONE : TouchButtonInput = new TouchButtonInput(InputFactory.getInstance().MAX - 40, "No Button");
    private var initialized : Bool = false;
    private final list : BasicArrayList = new BasicArrayListD();
    // synchronized
    public function init(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        if (!this.initialized) {
            this.initialized = true;
            this.list.add(this.UP);
            this.list.add(this.LEFT);
            this.list.add(this.RIGHT);
            this.list.add(this.DOWN);
            this.list.add(SPECIAL_BUTTON_TWO);
            this.list.add(SPECIAL_BUTTON_FOUR);
            this.list.add(SPECIAL_BUTTON_THREE);
            this.list.add(SPECIAL_BUTTON_ONE);
            this.list.add(SPECIAL_BUTTON_FIVE);
            this.list.add(SPECIAL_BUTTON_SIX);
            this.updateAllList(this.list, inputToGameKeyMapping);
        }
    }

    public function updateAll(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        this.updateAllList(this.getList(), inputToGameKeyMapping);
    }

    public function updateAllList(list : BasicArrayList, inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START).appendint(list.size())), this, "updateAll");
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            var touchButtonInput : TouchButtonInput = (cast list.get(index) : TouchButtonInput);
            touchButtonInput.update(inputToGameKeyMapping);
                index--;
            }
        }
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

    public function new() {
    }
}

