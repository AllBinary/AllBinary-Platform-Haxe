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
package org.allbinary.game.configuration;

import org.allbinary.game.configuration.event.GameFeatureEvent;
import org.allbinary.game.configuration.event.GameFeatureEventHandler;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class GameConfiguration {
    private static final MIN_VALUE : Null<Int> = Integer.MIN_VALUE;
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    private var defaultValue : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    private var value : Null<Int> = GameConfiguration.MIN_VALUE;
    private var minValue : Null<Int> = this.defaultValue;
    private var maxValue : Null<Int> = this.defaultValue;
    private var modifiable : Null<Bool> = BooleanFactory.getInstance().TRUE;
    public function new(name : String, defaultValue : Null<Int>, minValue : Null<Int>, maxValue : Null<Int>) {
        this.setName(name);
        this.setDefaultValue(defaultValue);
        this.value = this.getDefaultValue();
        this.setMinValue(minValue);
        this.setMaxValue(maxValue);
        GameConfigurationSingleton.getInstance().getHashtable().put(this.getName(), this);
    }

    // throws Exception
    public function setValue(value : Null<Int>) : Void {
        if (this.value != value) {
            final oldValue : Null<Int> = this.value;
            this.value = value;
            GameFeatureEventHandler.getInstance().fireEvent(new GameFeatureEvent(this, new StringMaker().append(this.name).append(" value: from: ").appendint(Std.int(Std.int(oldValue))).append(" to ").appendint(Std.int(Std.int(this.value))).toString()));
        }
    }

    public function getValue() : Null<Int> {
        return this.value;
    }

    public function setMaxValue(maxValue : Null<Int>) : Void {
        this.maxValue = maxValue;
    }

    public function getMaxValue() : Null<Int> {
        return this.maxValue;
    }

    public function setMinValue(minValue : Null<Int>) : Void {
        this.minValue = minValue;
    }

    public function getMinValue() : Null<Int> {
        return this.minValue;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function getName() : String {
        return this.name;
    }

    public function setDefaultValue(defaultValue : Null<Int>) : Void {
        this.defaultValue = defaultValue;
    }

    public function getDefaultValue() : Null<Int> {
        return this.defaultValue;
    }

    // throws Exception
    public function setDefault() : Void {
        this.setValue(this.getDefaultValue());
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Name: ");
        stringBuffer.append(this.name);
        stringBuffer.append(" Min: ");
        stringBuffer.appendint(Std.int(Std.int(this.getMinValue())));
        stringBuffer.append(" Max: ");
        stringBuffer.appendint(Std.int(Std.int(this.getMaxValue())));
        stringBuffer.append(" Value: ");
        stringBuffer.appendint(Std.int(Std.int(this.getValue())));
        stringBuffer.append(" Default: ");
        stringBuffer.appendint(Std.int(Std.int(this.getDefaultValue())));
        stringBuffer.append(" Modifiable: ");
        stringBuffer.appendboolean(this.isModifiable());
        return stringBuffer.toString();
    }

    public function setModifiable(modifiable : Null<Bool>) : Void {
        this.modifiable = modifiable;
    }

    public function isModifiable() : Null<Bool> {
        return this.modifiable;
    }

}

