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
package org.allbinary.logic.visual.dhtml.html.table;

import org.allbinary.string.CommonStrings;

class HtmlTableData {
    private static final instance : HtmlTableData = new HtmlTableData();
    public static function getInstance() : HtmlTableData {
        return HtmlTableData.instance;
    }

    public final LEFT : String = CommonStrings.getInstance().LEFT;
    public final RIGHT : String = CommonStrings.getInstance().RIGHT;
    public final NONE : String = "none";
    public final TOP : String = "top";
    public final BOTTOM : String = "bottom";
    public final TOPBOT : String = "topbot";
    public final SIDES : String = "sides";
    public final ALL : String = "all";
    public final BORDERED : String = "border";
    public final BASIC : String = "basic";
    public final ROWS : String = "rows";
    public final FRAMES : haxe.ds.Vector<String>;
    public function new() {
        this.FRAMES = haxe.ds.Vector.fromArrayCopy([this.NONE, this.TOP, this.BOTTOM, this.TOPBOT, this.SIDES, this.ALL, this.BORDERED]);
    }
}

