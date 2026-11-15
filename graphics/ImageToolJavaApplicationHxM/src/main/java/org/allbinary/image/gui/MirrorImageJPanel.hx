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
//import java.awt.image.RenderedImage;
//import java.io.File;
//import javax.imageio.ImageIO;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.ImageProcessorInput;
import org.allbinary.media.image.ImageProcessorInputCompositeInterface;
import org.allbinary.media.image.ImageStrings;
import org.allbinary.media.image.MirrorImageUtil;
import org.allbinary.string.CommonStrings;

class MirrorImageJPanel extends javax.swing.JPanel implements ImageProcessorInputCompositeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final imageStrings : ImageStrings = ImageStrings.getInstance();
    private var imageProcessorInput : ImageProcessorInput;
    private var result : BufferedImage = null;
    public function new(imageProcessorInput : ImageProcessorInput) {
        super();
        this.logUtil.putF("Starting", this, this.commonStrings.CONSTRUCTOR);
        this.initComponents();
        this.imageProcessorInput = imageProcessorInput;
    }

    public function process() : Void {
        /* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    final imageProcessorInput : ImageProcessorInput = this.getImageProcessorInput();
                    final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
                    for (index in 0...bufferedImageArray.length) {
                        this.result = MirrorImageUtil.getInstance().getImage(bufferedImageArray[index], this.verticleJCheckBox.isSelected(), this.horizontalJCheckBox.isSelected());
                        var file : File = imageProcessorInput.getFiles()[index];
                        if (this.writeOverOriginalJRadioButton.isSelected()) {
                        } else if (this.renameJRadioButton.isSelected()) {
                            var filePath : String = file.getAbsolutePath();
                            var extensionIndex : Int = filePath.indexOf(imageStrings.PNG_EXTENSION);
                            filePath = filePath.substring(0, extensionIndex) + "_mirror" + imageStrings.PNG_EXTENSION;
                            logUtil.putF("Renamed File: " + filePath, this, commonStrings.RUN);
                            file = new File(filePath);
                        }
                        var isWritten : Bool = ImageIO.write((cast this.result : RenderedImage), imageStrings.PNG, file);
                        logUtil.putF("File: " + file + " Wrote: " + isWritten, this, commonStrings.RUN);
                        this.getParent().repaint();
                    }
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new Thread().start();
    }

    private function initComponents() : Void {
        jLayeredPane1 = new javax.swing.JLayeredPane();
        this.buttonGroup = new javax.swing.ButtonGroup();
        this.jPanel1 = /* anonymous class body:
            public function paint(graphics : Graphics) : Void {
                if (this.result != null) {
                    graphics.drawImage(this.result, 0, 0, this.result.getWidth(null), this.result.getHeight(null), null);
                }
            }

*/ new javax.swing.JPanel();
        this.jPanel2 = new javax.swing.JPanel();
        this.horizontalJCheckBox = new javax.swing.JCheckBox();
        this.verticleJCheckBox = new javax.swing.JCheckBox();
        this.generateJButton = new javax.swing.JButton();
        this.renameJRadioButton = new javax.swing.JRadioButton();
        this.writeOverOriginalJRadioButton = new javax.swing.JRadioButton();
        this.jPanel3 = new javax.swing.JPanel();
        this.jLabel2 = new javax.swing.JLabel();
        var jPanel1Layout : org.jdesktop.layout.GroupLayout = new org.jdesktop.layout.GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(0, 522, Short.MAX_VALUE));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(0, 230, Short.MAX_VALUE));
        this.horizontalJCheckBox.setSelected(true);
        this.horizontalJCheckBox.setText("Horizontal");
        this.horizontalJCheckBox.setEnabled(false);
        this.verticleJCheckBox.setText("Verticle");
        this.verticleJCheckBox.setEnabled(false);
        this.generateJButton.setText("Generate");
        this.generateJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                generateJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.renameJRadioButton.setText("Save As filename_mirror");
        this.renameJRadioButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                renameJRadioButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.writeOverOriginalJRadioButton.setText("Write Over Original");
        var jPanel2Layout : org.jdesktop.layout.GroupLayout = new org.jdesktop.layout.GroupLayout(this.jPanel2);
        this.jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel2Layout.createSequentialGroup().addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).add(verticleJCheckBox).addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED).add(horizontalJCheckBox).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(writeOverOriginalJRadioButton).addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED).add(renameJRadioButton).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(generateJButton).add(37, 37, 37)));
        jPanel2Layout.setVerticalGroup(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel2Layout.createSequentialGroup().add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE).add(horizontalJCheckBox).add(verticleJCheckBox).add(writeOverOriginalJRadioButton).add(renameJRadioButton).add(generateJButton)).addContainerGap()));
        this.jLabel2.setText("Results:");
        var jPanel3Layout : org.jdesktop.layout.GroupLayout = new org.jdesktop.layout.GroupLayout(this.jPanel3);
        this.jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel3Layout.createSequentialGroup().add(jLabel2).addContainerGap(433, Short.MAX_VALUE)));
        jPanel3Layout.setVerticalGroup(jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jLabel2));
        var layout : org.jdesktop.layout.GroupLayout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup().addContainerGap().add(jPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addContainerGap()).add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).add(layout.createSequentialGroup().add(jPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        layout.setVerticalGroup(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(layout.createSequentialGroup().add(jPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 25, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(jPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
    }

    private function generateJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.process();
    }

    private function renameJRadioButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private var buttonGroup : javax.swing.ButtonGroup = null;
    private var generateJButton : javax.swing.JButton = null;
    private var horizontalJCheckBox : javax.swing.JCheckBox = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var jLayeredPane1 : javax.swing.JLayeredPane = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var jPanel2 : javax.swing.JPanel = null;
    private var jPanel3 : javax.swing.JPanel = null;
    private var renameJRadioButton : javax.swing.JRadioButton = null;
    private var verticleJCheckBox : javax.swing.JCheckBox = null;
    private var writeOverOriginalJRadioButton : javax.swing.JRadioButton = null;
    public function getImageProcessorInput() : ImageProcessorInput {
        return this.imageProcessorInput;
    }

    public function setImageProcessorInput(imageProcessorInput : ImageProcessorInput) : Void {
        this.imageProcessorInput = imageProcessorInput;
    }

}

