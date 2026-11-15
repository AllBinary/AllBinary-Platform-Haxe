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
package org.allbinary.logic.visual.dhtml.html.input;

import org.allbinary.logic.java.bool.BooleanFactory;

class HtmlRadioInput extends HtmlValueInput {
    private final CHECKED : String = "checked";
    public function new(before : String, name : String, value : String, after : String) {
        super(before, HtmlInputData.getInstance().RADIO, name, value, after);
    }

    public function setSelected() : Void {
        super.addAttribute(this.CHECKED, BooleanFactory.getInstance().TRUE_STRING);
    }

}

