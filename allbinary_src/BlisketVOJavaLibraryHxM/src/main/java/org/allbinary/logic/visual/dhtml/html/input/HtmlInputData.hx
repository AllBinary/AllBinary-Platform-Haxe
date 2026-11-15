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


class HtmlInputData {
    private static final instance : HtmlInputData = new HtmlInputData();
    public static function getInstance() : HtmlInputData {
        return HtmlInputData.instance;
    }

    public final TEXT : String = "text";
    public final RADIO : String = "radio";
    public final CHECKBOX : String = "checkbox";
    public final HIDDEN : String = "hidden";
    public final IMAGE : String = "image";
    public final PASSWORD : String = "password";
    public final RESET : String = "reset";
    public final SUBMIT : String = "submit";
    public final TYPES : haxe.ds.Vector<String>;
    public function new() {
        this.TYPES = haxe.ds.Vector.fromArrayCopy([this.TEXT, this.RADIO, this.CHECKBOX, this.HIDDEN, this.IMAGE, this.PASSWORD, this.RADIO, this.RESET, this.SUBMIT]);
    }
}

