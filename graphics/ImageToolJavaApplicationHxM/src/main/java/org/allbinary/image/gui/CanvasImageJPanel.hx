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

//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.awt.image.RenderedImage;
//import java.io.File;
//import java.io.IOException;
//import javax.imageio.ImageIO;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.image.CanvasExpandUtil;
import org.allbinary.media.image.CanvasTrimUtil;
import org.allbinary.media.image.ImageProcessedVisitor;
import org.allbinary.media.image.ImageProcessorInput;
import org.allbinary.media.image.ImageStrings;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class CanvasImageJPanel extends javax.swing.JPanel implements ImageProcessedVisitor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final imageStrings : ImageStrings = ImageStrings.getInstance();
    private var imageProcessorInput : ImageProcessorInput;
    private var result : BufferedImage = null;
    public function new(imageProcessorInput : ImageProcessorInput) {
        super();
        initComponents();
        this.imageProcessorInput = imageProcessorInput;
    }

    public function process() : Void {
        /* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                try {
                    final canvasTrimUtil : CanvasTrimUtil = CanvasTrimUtil.getInstance();
                    final canvasExpandUtil : CanvasExpandUtil = CanvasExpandUtil.getInstance();
                    final leftReduction : Int = Std.string(widthReductionTextField1.getText());
                    final topReduction : Int = Std.string(heightReductionTextField1.getText());
                    final widthReduction : Int = Std.string(widthReductionTextField.getText());
                    final heightReduction : Int = Std.string(heightReductionTextField.getText());
                    if (leftReduction <= 0 || topReduction <= 0 || widthReduction <= 0 || heightReduction <= 0) {
                        canvasTrimUtil.process(this.getImageProcessorInput(), -leftReduction, -topReduction, -widthReduction, -heightReduction, this);
                    } else {
                        canvasExpandUtil.process(this.getImageProcessorInput(), leftReduction, topReduction, this);
                    }
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new Thread().start();
    }

    private function initComponents() : Void {
        this.writeOverOriginalJCheckBox = new javax.swing.JCheckBox();
        this.jPanel1 = /* anonymous class body:
            public function paint(graphics : Graphics) : Void {
                if (this.result != null) {
                    graphics.drawImage(this.result, 0, 0, this.result.getWidth(null), this.result.getHeight(null), null);
                }
            }

*/ new javax.swing.JPanel();
        this.generateJButton = new javax.swing.JButton();
        this.jLabel4 = new javax.swing.JLabel();
        this.jPanel2 = new javax.swing.JPanel();
        this.jLabel5 = new javax.swing.JLabel();
        this.widthReductionTextField = new javax.swing.JTextField();
        this.jLabel6 = new javax.swing.JLabel();
        this.heightReductionTextField = new javax.swing.JTextField();
        this.widthReductionTextField1 = new javax.swing.JTextField();
        this.jLabel7 = new javax.swing.JLabel();
        this.jLabel8 = new javax.swing.JLabel();
        this.heightReductionTextField1 = new javax.swing.JTextField();
        this.writeOverOriginalJCheckBox.setSelected(true);
        this.writeOverOriginalJCheckBox.setText("Write Over Original");
        this.writeOverOriginalJCheckBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                writeOverOriginalJCheckBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var jPanel1Layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 0, Short.MAX_VALUE));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 196, Short.MAX_VALUE));
        this.generateJButton.setText("Generate");
        this.generateJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                generateJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel4.setText("Results:");
        this.jLabel5.setText("Right:");
        this.widthReductionTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.widthReductionTextField.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                widthReductionTextFieldActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel6.setText("Bottom");
        this.heightReductionTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.widthReductionTextField1.setText(CommonPhoneStrings.getInstance().ZERO);
        this.widthReductionTextField1.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                widthReductionTextField1ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel7.setText("Top");
        this.jLabel8.setText("Left:");
        this.heightReductionTextField1.setText(CommonPhoneStrings.getInstance().ZERO);
        var jPanel2Layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.jPanel2);
        this.jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel2Layout.createSequentialGroup().addContainerGap().addComponent(jLabel8).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(widthReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel5).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel7).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(heightReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel6).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap(140, Short.MAX_VALUE)));
        jPanel2Layout.setVerticalGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup().addGap(0, 16, Short.MAX_VALUE).addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel6).addComponent(heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel8).addComponent(widthReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel7).addComponent(heightReductionTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel5).addComponent(widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)))));
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addGap(78, 78, 78)).addGroup(layout.createSequentialGroup().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)).addGroup(layout.createSequentialGroup().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jLabel4).addGroup(layout.createSequentialGroup().addComponent(writeOverOriginalJCheckBox).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(generateJButton))).addGap(0, 0, Short.MAX_VALUE))).addContainerGap()));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(generateJButton).addComponent(writeOverOriginalJCheckBox)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel4).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
    }

    private function writeOverOriginalJCheckBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function generateJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.process();
    }

    private function widthReductionTextFieldActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function widthReductionTextField1ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private var generateJButton : javax.swing.JButton = null;
    private var heightReductionTextField : javax.swing.JTextField = null;
    private var heightReductionTextField1 : javax.swing.JTextField = null;
    private var jLabel4 : javax.swing.JLabel = null;
    private var jLabel5 : javax.swing.JLabel = null;
    private var jLabel6 : javax.swing.JLabel = null;
    private var jLabel7 : javax.swing.JLabel = null;
    private var jLabel8 : javax.swing.JLabel = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var jPanel2 : javax.swing.JPanel = null;
    private var widthReductionTextField : javax.swing.JTextField = null;
    private var widthReductionTextField1 : javax.swing.JTextField = null;
    private var writeOverOriginalJCheckBox : javax.swing.JCheckBox = null;
    public function getImageProcessorInput() : ImageProcessorInput {
        return this.imageProcessorInput;
    }

    public function setImageProcessorInput(imageProcessorInput : ImageProcessorInput) : Void {
        this.imageProcessorInput = imageProcessorInput;
    }

    // throws IOException
    public override function visit(generatedBufferedImage : BufferedImage, name : String, index : Int) : Void {
        this.logUtil.putF(this.commonStrings.VISIT, this, this.commonStrings.VISIT);
        this.result = generatedBufferedImage;
        this.getParent().repaint();
        var file : File = this.imageProcessorInput.getFiles()[index];
        if (!this.writeOverOriginalJCheckBox.isSelected()) {
            var filePath : String = file.getAbsolutePath();
            final extensionIndex : Int = filePath.indexOf(this.imageStrings.PNG_EXTENSION);
            filePath = new StringMaker().append(filePath.substring(0, extensionIndex)).append(this.commonSeps.UNDERSCORE).append(name).append(this.imageStrings.PNG_EXTENSION).toString();
            file = new File(filePath);
        }
        final isWritten : Bool = ImageIO.write((cast this.result : RenderedImage), imageStrings.PNG, file);
        this.logUtil.putF(new StringMaker().append("File: ").append(StringUtil.getInstance().toString(file)).append(" Wrote: ").appendboolean(isWritten).toString(), this, this.commonStrings.RUN);
    }

}

