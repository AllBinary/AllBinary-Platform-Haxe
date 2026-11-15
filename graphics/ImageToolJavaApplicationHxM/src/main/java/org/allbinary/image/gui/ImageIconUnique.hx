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
package org.allbinary.image.gui;

//import java.awt.image.BufferedImage;
//import javax.swing.*;

class ImageIconUnique extends ImageIcon {
    private var id : Int = 0;
    public function new(bufferedImage : BufferedImage, index : Int) {
        super(bufferedImage);
        this.setId(index);
    }

    public function getId() : Int {
        return this.id;
    }

    public function setId(id : Int) : Void {
        this.id = id;
    }

}

