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
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.image.ImagePersistanceUtil;
import org.allbinary.media.image.ImageProcessorInput;
import org.allbinary.media.image.ImageProcessorInputCompositeInterface;
import org.allbinary.media.image.ImageUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CreateIconImagesJPanel extends javax.swing.JPanel implements ImageProcessorInputCompositeInterface {
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
                    final stringMaker : StringMaker = new StringMaker();
                    final imageProcessorInput : ImageProcessorInput = this.getImageProcessorInput();
                    final files : haxe.ds.Vector<File> = imageProcessorInput.getFiles();
                    final iconWidthList : BasicArrayList = new BasicArrayListD();
                    final iconHeightList : BasicArrayList = new BasicArrayListD();
                    iconWidthList.add(864);
                    iconHeightList.add(864);
                    final ANDROID : String = "android-icon-";
                    final IOS : String = "ios-icon-";
                    final size : Int = iconWidthList.size();
                    var width : Int = 0;
                    var height : Int = 0;
                    for (index2 in 0...size) {
                        width = Std.int(((cast iconWidthList.get(index2) : Null<Int>)));
                        height = Std.int(((cast iconHeightList.get(index2) : Null<Int>)));
                        var generatedBufferedImageArray : haxe.ds.Vector<BufferedImage> = imageUtil.createBufferedImage3(imageProcessorInput.getBufferedImageArray(), width, height, true);
                        final imagePersistanceUtil : ImagePersistanceUtil = ImagePersistanceUtil.getInstance();
                        for (index in 0...generatedBufferedImageArray.length) {
                            final filePath : String = files[index].getAbsolutePath();
                            final endIndex : Int = filePath.lastIndexOf("\\".code);
                            final path : String = filePath.substring(0, endIndex + 1);
                            stringMaker.delete(0, stringMaker.length());
                            stringMaker.append(path).append(ANDROID).appendint(width).append(CanvasStrings.getInstance()._PNG);
                            var newFilePath : String = Std.string(stringMaker);
                            imagePersistanceUtil.saveWithBatik(AbFile.createAbFile(newFilePath), generatedBufferedImageArray[index]);
                            stringMaker.delete(0, stringMaker.length());
                            stringMaker.append(path).append(IOS).appendint(width).append(CanvasStrings.getInstance()._PNG);
                            newFilePath = Std.string(stringMaker);
                            imagePersistanceUtil.saveWithBatik(AbFile.createAbFile(newFilePath), generatedBufferedImageArray[index]);
                        }
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
        this.aboveJButton = new javax.swing.JButton();
        this.aboveJButton.setText("Process");
        this.aboveJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                aboveJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(aboveJButton).addGap(0, 335, Short.MAX_VALUE)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addComponent(aboveJButton).addContainerGap(286, Short.MAX_VALUE)));
    }

    private function aboveJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.process();
    }

    private var aboveJButton : javax.swing.JButton = null;
}

