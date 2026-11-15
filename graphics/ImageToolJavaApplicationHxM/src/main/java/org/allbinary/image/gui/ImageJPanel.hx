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

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ImageJPanel extends javax.swing.JPanel {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
    private var isDrawn : Bool = false;
    private var bufferedImage : BufferedImage;
    public function new(bufferedImage : BufferedImage) {
        super();
        this.initComponents();
        this.bufferedImage = bufferedImage;
        this.setSize(this.bufferedImage.getWidth(null), this.bufferedImage.getHeight(null));
    }

    public function paint(graphics : Graphics) : Void {
        if (!this.isDrawn) {
            this.logUtil.putF(this.commonStrings.START, this, this.canvasStrings.PAINT);
            graphics.drawImage(bufferedImage, 0, 0, this.bufferedImage.getWidth(null), this.bufferedImage.getHeight(null), null);
            this.isDrawn = true;
        }
    }

    private function initComponents() : Void {
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 400, Short.MAX_VALUE));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 300, Short.MAX_VALUE));
    }

}

