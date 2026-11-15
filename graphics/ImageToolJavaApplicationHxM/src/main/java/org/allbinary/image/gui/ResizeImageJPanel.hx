/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
//import java.awt.image.Raster;
//import java.io.File;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.media.image.ImagePersistanceUtil;
import org.allbinary.media.image.ImageProcessorInput;
import org.allbinary.media.image.ImageProcessorInputCompositeInterface;
import org.allbinary.media.image.ImageUtil;
import org.allbinary.string.CommonStrings;

class ResizeImageJPanel extends javax.swing.JPanel implements ImageProcessorInputCompositeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var imageProcessorInput : ImageProcessorInput;
    public function new(imageProcessorInput : ImageProcessorInput) {
        super();
        initComponents();
        this.imageProcessorInput = imageProcessorInput;
        var numberStringArray : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...101) null]);
        numberStringArray[0] = Std.string(-1);
        for (index in 1...100) {
            numberStringArray[index] = Std.string(index);
        }
        this.jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(numberStringArray));
        final araster : Raster = this.imageProcessorInput.getBufferedImageArray()[0].getAlphaRaster();
        if (araster == null) {
            trace("there is no Alpha channel!!!!!!!!!");
        } else {
            trace("Alpha channel found !");
        }
    }

    public function process() : Void {
        /* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    final imageUtil : ImageUtil = ImageUtil.getInstance();
                    final percent : Null<Int> = Std.string((cast this.jComboBox1.getSelectedItem() : String));
                    final percentAsFloat : Null<Float> = Std.parseFloat(this.floatPercentJTextField.getText());
                    final imageProcessorInput : ImageProcessorInput = this.getImageProcessorInput();
                    final files : haxe.ds.Vector<File> = imageProcessorInput.getFiles();
                    var generatedBufferedImageArray : haxe.ds.Vector<BufferedImage> = null;
                    if (Std.int(percentAsFloat) != -1) {
                        generatedBufferedImageArray = imageUtil.createBufferedImage2(imageProcessorInput.getBufferedImageArray(), percentAsFloat, true);
                    } else if (Std.int(percent) != -1) {
                        generatedBufferedImageArray = imageUtil.createBufferedImageForResize(imageProcessorInput.getBufferedImageArray(), percent, true);
                    } else {
                        final width : Null<Int> = Std.string((cast this.jTextField1.getText() : String));
                        final height : Null<Int> = Std.string((cast this.jTextField2.getText() : String));
                        generatedBufferedImageArray = imageUtil.createBufferedImage3(imageProcessorInput.getBufferedImageArray(), width, height, true);
                    }
                    final araster : Raster = generatedBufferedImageArray[0].getAlphaRaster();
                    if (araster == null) {
                        trace("No Alpha Channel In Result");
                    } else {
                        trace("Found Alpha Channel In Result");
                    }
                    final imagePersistanceUtil : ImagePersistanceUtil = ImagePersistanceUtil.getInstance();
                    for (index in 0...generatedBufferedImageArray.length) {
                        imagePersistanceUtil.saveWithBatik(FileWrapperUtil.wrapFile(files[index]), generatedBufferedImageArray[index]);
                    }
                    this.getParent().repaint();
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new Thread().start();
    }

    public function update() : Void {
        /* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    final imageProcessorInput : ImageProcessorInput = this.getImageProcessorInput();
                    final size : Int = imageProcessorInput.getBufferedImageArray().length;
                    final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
                    var bufferedImage : BufferedImage = null;
                    for (index in 0...size) {
                        bufferedImage = bufferedImageArray[0];
                        this.jTextField1.setText(Std.string(bufferedImage.getWidth()));
                        this.jTextField2.setText(Std.string(bufferedImage.getHeight()));
                    }
                    this.getParent().repaint();
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new Thread().start();
    }

    public function updateFor16Above() : Void {
        /* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    final imageProcessorInput : ImageProcessorInput = this.getImageProcessorInput();
                    final size : Int = imageProcessorInput.getBufferedImageArray().length;
                    final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
                    var bufferedImage : BufferedImage = null;
                    for (index in 0...size) {
                        bufferedImage = bufferedImageArray[0];
                        this.jTextField1.setText(Std.string(bufferedImage.getWidth() / 16 * 16));
                        this.jTextField2.setText(Std.string(bufferedImage.getHeight() / 16 * 16));
                    }
                    this.getParent().repaint();
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new Thread().start();
    }

    public function updateFor16Below() : Void {
        /* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    final imageProcessorInput : ImageProcessorInput = this.getImageProcessorInput();
                    final size : Int = imageProcessorInput.getBufferedImageArray().length;
                    final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
                    var bufferedImage : BufferedImage = null;
                    for (index in 0...size) {
                        bufferedImage = bufferedImageArray[0];
                        this.jTextField1.setText(Std.string(((bufferedImage.getWidth() / 16) + 1) * 16));
                        this.jTextField2.setText(Std.string(((bufferedImage.getHeight() / 16) + 1) * 16));
                    }
                    this.getParent().repaint();
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new Thread().start();
    }

    public function getImageProcessorInput() : ImageProcessorInput {
        return this.imageProcessorInput;
    }

    public function setImageProcessorInput(imageProcessorInput : ImageProcessorInput) : Void {
        this.imageProcessorInput = imageProcessorInput;
    }

    private function initComponents() : Void {
        this.jLabel1 = new javax.swing.JLabel();
        this.jComboBox1 = new javax.swing.JComboBox();
        this.aboveJButton = new javax.swing.JButton();
        this.jTextField1 = new javax.swing.JTextField();
        this.jLabel2 = new javax.swing.JLabel();
        this.jLabel3 = new javax.swing.JLabel();
        this.jTextField2 = new javax.swing.JTextField();
        this.updateJButton = new javax.swing.JButton();
        this.floatPercentJTextField = new javax.swing.JTextField();
        this.adjustFor16AboveJButton = new javax.swing.JButton();
        this.adjustFor16BelowJButton = new javax.swing.JButton();
        this.jLabel1.setText("Percent:");
        this.jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(haxe.ds.Vector.fromArrayCopy(["Item 1", "Item 2", "Item 3", "Item 4"])));
        this.aboveJButton.setText("Process");
        this.aboveJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                aboveJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel2.setText("Width:");
        this.jLabel3.setText("Height:");
        this.updateJButton.setText("Update");
        this.updateJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                updateJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.floatPercentJTextField.setText("-1.000000");
        this.floatPercentJTextField.setMinimumSize(new java.awt.Dimension(120, 22));
        this.adjustFor16AboveJButton.setText("Adjust for 16 Above");
        this.adjustFor16AboveJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                adjustFor16AboveJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.adjustFor16BelowJButton.setText("Adjust for 16 Below");
        this.adjustFor16BelowJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                adjustFor16BelowJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jLabel1).addComponent(jLabel2).addComponent(jLabel3)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false).addComponent(jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(jTextField1).addComponent(jTextField2)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(floatPercentJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(adjustFor16AboveJButton).addComponent(adjustFor16BelowJButton)).addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)).addGroup(layout.createSequentialGroup().addComponent(updateJButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(aboveJButton).addGap(0, 250, Short.MAX_VALUE)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(floatPercentJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel2).addComponent(adjustFor16AboveJButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel3).addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(adjustFor16BelowJButton)).addGap(18, 18, 18).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(aboveJButton).addComponent(updateJButton)).addContainerGap(175, Short.MAX_VALUE)));
    }

    private function aboveJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.process();
    }

    private function updateJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.update();
    }

    private function adjustFor16AboveJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateFor16Above();
    }

    private function adjustFor16BelowJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateFor16Below();
    }

    private var aboveJButton : javax.swing.JButton = null;
    private var adjustFor16AboveJButton : javax.swing.JButton = null;
    private var adjustFor16BelowJButton : javax.swing.JButton = null;
    private var floatPercentJTextField : javax.swing.JTextField = null;
    private var jComboBox1 : javax.swing.JComboBox<String> = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var jLabel3 : javax.swing.JLabel = null;
    private var jTextField1 : javax.swing.JTextField = null;
    private var jTextField2 : javax.swing.JTextField = null;
    private var updateJButton : javax.swing.JButton = null;
}

