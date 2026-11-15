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
package org.allbinary.media.image.cache;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;

class BufferedImageInfo {
    private var width : Int;
    private var height : Int;
    private var type : Int;
    public function new(width : Int, height : Int, type : Int) {
        this.width = width;
        this.height = height;
        this.type = type;
    }

    public function getWidth() : Int {
        return this.width;
    }

    public function setWidth(width : Int) : Void {
        this.width = width;
    }

    public function getHeight() : Int {
        return this.height;
    }

    public function setHeight(height : Int) : Void {
        this.height = height;
    }

    public function getType() : Int {
        return this.type;
    }

    public function setType(type : Int) : Void {
        this.type = type;
    }

    public function toString() : String {
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("BufferedImageInfo -");
        stringBuffer.append(commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(this.getWidth());
        stringBuffer.append(commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(this.getHeight());
        stringBuffer.append(" Type: ");
        stringBuffer.appendint(this.getType());
        return stringBuffer.toString();
    }

}

