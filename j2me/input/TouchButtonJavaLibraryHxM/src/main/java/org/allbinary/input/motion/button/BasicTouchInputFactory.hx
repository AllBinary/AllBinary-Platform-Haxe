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
    public final SPECIAL_BUTTON_SEVEN_TESTING_ONLY : TouchButtonInput;
    public final SPECIAL_BUTTON_EIGHT_TESTING_ONLY : TouchButtonInput;
    public final SPECIAL_BUTTON_SIX : TouchButtonInput;
    public final SPECIAL_BUTTON_FIVE : TouchButtonInput;
    public final SPECIAL_BUTTON_FOUR : TouchButtonInput;
    public final SPECIAL_BUTTON_THREE : TouchButtonInput;
    public final SPECIAL_BUTTON_TWO : TouchButtonInput;
    public final SPECIAL_BUTTON_ONE : TouchButtonInput;
    public final UP : TouchButtonInput;
    public final LEFT : TouchButtonInput;
    public final RIGHT : TouchButtonInput;
    public final DOWN : TouchButtonInput;
    public final NONE : TouchButtonInput;
    private var initialized : Bool = false;
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        var MAX : Int = InputFactory.getInstance().MAX;
        this.SPECIAL_BUTTON_SEVEN_TESTING_ONLY = new TouchButtonInput(MAX - 41, "Button 7 - Testing Only May Cross Over Key Values");
        this.SPECIAL_BUTTON_EIGHT_TESTING_ONLY = new TouchButtonInput(MAX - 42, "Button 8 - Testing Only May Cross Over Key Values");
        this.SPECIAL_BUTTON_SIX = new TouchButtonInput(MAX - 30, "Button 6");
        this.SPECIAL_BUTTON_FIVE = new TouchButtonInput(MAX - 31, "Button 5");
        this.SPECIAL_BUTTON_FOUR = new TouchButtonInput(MAX - 32, "Button 4");
        this.SPECIAL_BUTTON_THREE = new TouchButtonInput(MAX - 33, "Button 3");
        this.SPECIAL_BUTTON_TWO = new TouchButtonInput(MAX - 34, "Button 2");
        this.SPECIAL_BUTTON_ONE = new TouchButtonInput(MAX - 35, "Button 1");
        this.UP = new TouchButtonInput(MAX - 36, "Up Button");
        this.LEFT = new TouchButtonInput(MAX - 37, "Left Button");
        this.RIGHT = new TouchButtonInput(MAX - 38, "Right Button");
        this.DOWN = new TouchButtonInput(MAX - 39, "Down Button");
        this.NONE = new TouchButtonInput(MAX - 40, "No Button");
    }

    // synchronized
    public function init(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        if (!this.initialized) {
            this.initialized = true;
            this.list.add(this.UP);
            this.list.add(this.LEFT);
            this.list.add(this.RIGHT);
            this.list.add(this.DOWN);
            this.list.add(this.SPECIAL_BUTTON_TWO);
            this.list.add(this.SPECIAL_BUTTON_FOUR);
            this.list.add(this.SPECIAL_BUTTON_THREE);
            this.list.add(this.SPECIAL_BUTTON_ONE);
            this.list.add(this.SPECIAL_BUTTON_FIVE);
            this.list.add(this.SPECIAL_BUTTON_SIX);
            this.list.add(this.SPECIAL_BUTTON_SIX);
            this.list.add(this.SPECIAL_BUTTON_SEVEN_TESTING_ONLY);
            this.list.add(this.SPECIAL_BUTTON_EIGHT_TESTING_ONLY);
            this.updateAllFromList(this.list, inputToGameKeyMapping);
        }
    }

    public function updateAll(inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        this.updateAllFromList(this.list, inputToGameKeyMapping);
    }

    public function updateAllFromList(list : BasicArrayList, inputToGameKeyMapping : InputToGameKeyMapping) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).appendint(list.size())), this, "updateAll");
        var touchButtonInput : TouchButtonInput = null;
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            touchButtonInput = (cast list.objectArray[index] : TouchButtonInput);
            touchButtonInput.update(inputToGameKeyMapping);
                index--;
            }
        }
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

}

