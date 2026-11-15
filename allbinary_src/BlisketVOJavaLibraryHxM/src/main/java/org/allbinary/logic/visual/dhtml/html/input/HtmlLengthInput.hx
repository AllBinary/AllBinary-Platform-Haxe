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


class HtmlLengthInput extends HtmlValueInput {
    private final MAXLENGTH : String = "MAXLENGTH";
    private final SIZE : String = "SIZE";
    private var length : String = null;
    private var size : String = null;
    public function new(before : String, type : String, name : String, value : String, after : String) {
        super(before, type, name, value, after);
    }

    public function setMaxLength(length : Null<Int>) : Void {
        this.length = length;
        addAttribute(this.MAXLENGTH, this.length);
    }

    public function setSize(size : Null<Int>) : Void {
        this.size = size;
        addAttribute(this.MAXLENGTH, this.size);
    }

}

