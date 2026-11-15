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
import org.allbinary.media.image.ImageProcessedVisitor;
import org.allbinary.media.image.ImageProcessorInput;
import org.allbinary.media.image.ImageStrings;
import org.allbinary.media.image.SpriteSplitterUtil;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class SpriteSplitterImageJPanel extends javax.swing.JPanel implements ImageProcessedVisitor {
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
                    final spriteSplitterUtil : SpriteSplitterUtil = SpriteSplitterUtil.getInstance();
                    final spriteType : String = (cast spriteTypeJComboBox.getSelectedItem() : String);
                    final totalFrames : Null<Int> = Std.string((cast totalFramesJComboBox.getSelectedItem() : String));
                    final totalAnimations : Null<Int> = Std.string((cast totalAnimationsJComboBox.getSelectedItem() : String));
                    final widthReduction : Int = Std.string(widthReductionTextField.getText());
                    final heightReduction : Int = Std.string(heightReductionTextField.getText());
                    final increaseWidth : Int = Std.string(increaseWidthTextField.getText());
                    final increaseHeight : Int = Std.string(increaseHeightTextField.getText());
                    spriteSplitterUtil.process(this.getImageProcessorInput(), totalFrames, totalAnimations, widthReduction, heightReduction, increaseWidth, increaseHeight, spriteType, this);
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new Thread().start();
    }

    private function initComponents() : Void {
        this.writeOverOriginalJCheckBox = new javax.swing.JCheckBox();
        this.widthReductionTextField = new javax.swing.JTextField();
        this.jLabel5 = new javax.swing.JLabel();
        this.jPanel1 = /* anonymous class body:
            public function paint(graphics : Graphics) : Void {
                if (this.result != null) {
                    graphics.drawImage(this.result, 0, 0, this.result.getWidth(null), this.result.getHeight(null), null);
                }
            }

*/ new javax.swing.JPanel();
        this.jLabel4 = new javax.swing.JLabel();
        this.jLabel6 = new javax.swing.JLabel();
        this.heightReductionTextField = new javax.swing.JTextField();
        this.generateJButton = new javax.swing.JButton();
        this.jPanel2 = new javax.swing.JPanel();
        this.jLabel1 = new javax.swing.JLabel();
        this.totalFramesJComboBox = new javax.swing.JComboBox();
        final size : Int = 70;
        final animationStringArray2 : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size - 1) null]);
        for (index in 1...size) {
            animationStringArray2[index - 1] = Std.string(index);
        }
        this.totalFramesJComboBox.setModel(new javax.swing.DefaultComboBoxModel(animationStringArray2));
        this.jLabel2 = new javax.swing.JLabel();
        this.totalAnimationsJComboBox = new javax.swing.JComboBox();
        final animationStringArray : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size - 1) null]);
        for (index in 1...size) {
            animationStringArray[index - 1] = Std.string(index);
        }
        this.totalAnimationsJComboBox.setModel(new javax.swing.DefaultComboBoxModel(animationStringArray));
        this.jLabel3 = new javax.swing.JLabel();
        this.spriteTypeJComboBox = new javax.swing.JComboBox();
        this.spriteTypeJComboBox.setModel(new javax.swing.DefaultComboBoxModel(haxe.ds.Vector.fromArrayCopy([org.allbinary.media.image.SpriteSplitterUtil.getInstance().DIRECTIONAL_ANIMATIONS, org.allbinary.media.image.SpriteSplitterUtil.getInstance().HORIZONTAL_ANIMATIONS, org.allbinary.media.image.SpriteSplitterUtil.getInstance().HORIZONTAL_SPRITE])));
        jLabel7 = new javax.swing.JLabel();
        this.increaseWidthTextField = new javax.swing.JTextField();
        this.jLabel8 = new javax.swing.JLabel();
        this.increaseHeightTextField = new javax.swing.JTextField();
        this.writeOverOriginalJCheckBox.setText("Write Over Original");
        this.writeOverOriginalJCheckBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                writeOverOriginalJCheckBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.widthReductionTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.widthReductionTextField.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                widthReductionTextFieldActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel5.setText("Less Width:");
        this.jLabel4.setText("Results:");
        var jPanel1Layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addComponent(jLabel4).addGap(0, 0, Short.MAX_VALUE)));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addComponent(jLabel4).addGap(0, 184, Short.MAX_VALUE)));
        this.jLabel6.setText("Less Height:");
        this.heightReductionTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.generateJButton.setText("Generate");
        this.generateJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                generateJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel1.setText("Row Total:");
        this.totalFramesJComboBox.setSelectedIndex(1);
        this.totalFramesJComboBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                totalFramesJComboBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel2.setText("Column Total :");
        this.totalAnimationsJComboBox.setSelectedIndex(3);
        this.totalAnimationsJComboBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                totalAnimationsJComboBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel3.setText("Type:");
        this.spriteTypeJComboBox.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                spriteTypeJComboBoxActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var jPanel2Layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.jPanel2);
        this.jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup().addContainerGap().addComponent(jLabel1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(totalFramesJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel2).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(totalAnimationsJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel3).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(spriteTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 172, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        jPanel2Layout.setVerticalGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel2Layout.createSequentialGroup().addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(totalFramesJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel2).addComponent(totalAnimationsJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel3).addComponent(spriteTypeJComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))));
        this.jLabel7.setText("More Width:");
        this.increaseWidthTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        this.increaseWidthTextField.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                increaseWidthTextFieldActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel8.setText("More Height:");
        this.increaseHeightTextField.setText(CommonPhoneStrings.getInstance().ZERO);
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 415, Short.MAX_VALUE).addGap(78, 78, 78)).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addGroup(layout.createSequentialGroup().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(writeOverOriginalJCheckBox).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(generateJButton)).addGroup(layout.createSequentialGroup().addComponent(jLabel5).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel6).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel7).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(increaseWidthTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel8).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(increaseHeightTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))).addGap(0, 0, Short.MAX_VALUE))).addContainerGap()));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel7).addComponent(increaseWidthTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel8).addComponent(increaseHeightTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel5).addComponent(widthReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel6).addComponent(heightReductionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(writeOverOriginalJCheckBox).addComponent(generateJButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
    }

    private function writeOverOriginalJCheckBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function generateJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.process();
    }

    private function spriteTypeJComboBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        final spriteSplitterUtil : SpriteSplitterUtil = SpriteSplitterUtil.getInstance();
        this.jLabel1.setText(spriteSplitterUtil.ANIMATIONS_LABELS[this.spriteTypeJComboBox.getSelectedIndex()]);
        this.jLabel2.setText(spriteSplitterUtil.ANIMATIONS_LABELS[this.spriteTypeJComboBox.getSelectedIndex() + 1]);
    }

    private function totalAnimationsJComboBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function totalFramesJComboBoxActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function widthReductionTextFieldActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function increaseWidthTextFieldActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private var generateJButton : javax.swing.JButton = null;
    private var heightReductionTextField : javax.swing.JTextField = null;
    private var increaseHeightTextField : javax.swing.JTextField = null;
    private var increaseWidthTextField : javax.swing.JTextField = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var jLabel3 : javax.swing.JLabel = null;
    private var jLabel4 : javax.swing.JLabel = null;
    private var jLabel5 : javax.swing.JLabel = null;
    private var jLabel6 : javax.swing.JLabel = null;
    private var jLabel7 : javax.swing.JLabel = null;
    private var jLabel8 : javax.swing.JLabel = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var jPanel2 : javax.swing.JPanel = null;
    private var spriteTypeJComboBox : javax.swing.JComboBox<String> = null;
    private var totalAnimationsJComboBox : javax.swing.JComboBox<String> = null;
    private var totalFramesJComboBox : javax.swing.JComboBox<String> = null;
    private var widthReductionTextField : javax.swing.JTextField = null;
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
            filePath = Std.string(new StringMaker().append(filePath.substring(0, extensionIndex)).append(this.commonSeps.UNDERSCORE).append(name).append(this.imageStrings.PNG_EXTENSION));
            file = new File(filePath);
        }
        final isWritten : Bool = ImageIO.write((cast this.result : RenderedImage), imageStrings.PNG, file);
        this.logUtil.putF(Std.string(new StringMaker().append("File: ").append(StringUtil.getInstance().toString(file)).append(" Wrote: ").appendboolean(isWritten)), this, this.commonStrings.RUN);
    }

}

