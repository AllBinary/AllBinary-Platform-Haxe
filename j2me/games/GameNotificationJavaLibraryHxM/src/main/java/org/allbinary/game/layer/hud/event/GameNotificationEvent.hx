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
package org.allbinary.game.layer.hud.event;

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class GameNotificationEvent extends AllBinaryEventObject {
    private var string : String = StringUtil.getInstance().EMPTY_STRING;
    private final seconds : Null<Int>;
    private var basicColor : BasicColor = BasicColorFactory.getInstance().BLACK;
    private final removeable : Null<Bool>;
    public function new(anyType : Any, string : String, seconds : Null<Int>, basicColor : BasicColor, permanent : Null<Bool>) {
        super(anyType);
        this.setString(string);
        this.seconds = seconds;
        this.setBasicColorP(basicColor);
        this.removeable = permanent;
    }

    public function getString() : String {
        return this.string;
    }

    public function getSeconds() : Null<Int> {
        return this.seconds;
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function getPermanent() : Null<Bool> {
        return this.removeable;
    }

    public function setString(string : String) : Void {
        this.string = string;
    }

    public function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
    }

}

