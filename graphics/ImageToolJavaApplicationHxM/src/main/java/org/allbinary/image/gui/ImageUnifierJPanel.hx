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
//import java.io.File;
//import javax.swing.*;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.image.ImagePersistanceUtil;
import org.allbinary.media.image.ImageProcessorInput;
import org.allbinary.media.image.ImageProcessorInputCompositeInterface;
import org.allbinary.media.image.ImageStrings;
import org.allbinary.media.image.ImageUnifierCell;
import org.allbinary.media.image.ImageUnifierProperties;
import org.allbinary.media.image.ImageUnifierUtil;
import org.allbinary.media.image.ImageUtil;
import org.allbinary.media.image.ImagesRatioUtil;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class ImageUnifierJPanel extends javax.swing.JPanel implements ImageProcessorInputCompositeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final imageStrings : ImageStrings = ImageStrings.getInstance();
    private final imagesRatioUtil : ImagesRatioUtil = ImagesRatioUtil.getInstance();
    private var imageProcessorInput : ImageProcessorInput = null;
    private var icon : haxe.ds.Vector<ImageIconUnique> = null;
    private var imageUnifierProperties : ImageUnifierProperties = null;
    private var result : BufferedImage = null;
    private var isImageFillIn : Bool = true;
    public function new(imageProcessorInput : ImageProcessorInput) {
        super();
        this.initComponents();
        this.setImageProcessorInput(imageProcessorInput);
    }

    public function init() : Void {
        try {
            final imageProcessorInput : ImageProcessorInput = this.getImageProcessorInput();
            final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
            this.icon = haxe.ds.Vector.fromArrayCopy([for (index in 0...bufferedImageArray.length) null]);
            final defaultListModel : DefaultListModel = new DefaultListModel();
            for (index in 0...bufferedImageArray.length) {
                final width : Float = bufferedImageArray[index].getWidth();
                final height : Float = bufferedImageArray[index].getHeight();
                final newWidth : Int = 52;
                final oldRatio : Float = width / height;
                final newHeight : Int = Std.int((newWidth / oldRatio));
                final iconBufferedImage : BufferedImage = ImageUtil.getInstance().createBufferedImage(bufferedImageArray[index], newWidth, newHeight, true);
                this.icon[index] = new ImageIconUnique(iconBufferedImage, index);
                defaultListModel.addElement(this.icon[index]);
            }
            this.imageJList.setModel(defaultListModel);
            this.updateOnPropertiesChange();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
        }
    }

    private function updateImage() : Void {
        try {
            final bufferedImageArray : haxe.ds.Vector<BufferedImage> = this.getImageProcessorInput().getBufferedImageArray();
            final tempBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...bufferedImageArray.length) null]);
            for (index in 0...bufferedImageArray.length) {
                final indexedImageIcon : ImageIconUnique = (cast this.imageJList.getModel().getElementAt(index) : ImageIconUnique);
                final bufferedImage : BufferedImage = ImageUtil.getInstance().createBufferedImage(bufferedImageArray[indexedImageIcon.getId()], this.imageUnifierProperties.getImageUnifierCell().getWidth(), this.imageUnifierProperties.getImageUnifierCell().getHeight(), false);
                tempBufferedImageArray[index] = bufferedImage;
            }
            var totalImages : Int = this.imageUnifierProperties.getRows() * this.imageUnifierProperties.getColumns();
            var averageRatio : Float = this.imagesRatioUtil.getAverage(tempBufferedImageArray, totalImages);
            var averageRatioString : String = averageRatio.toString();
            if (averageRatioString.length > 4) {
                averageRatioString = averageRatioString.substring(0, 4);
            }
            this.avgRatioJTextField.setText(averageRatioString);
            this.fudgeItJButton.setEnabled(false);
            if (!this.imagesRatioUtil.isEqual(tempBufferedImageArray, totalImages)) {
                if (this.isImageFillIn) {
                    this.fudgeItJButton.setEnabled(true);
                }
            }
            this.updateImage(tempBufferedImageArray);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "updateImage", e);
        }
    }

    private function updateImageWithFudgedImages() : Void {
        try {
            final bufferedImageArray : haxe.ds.Vector<BufferedImage> = this.getImageProcessorInput().getBufferedImageArray();
            final tempBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...bufferedImageArray.length) null]);
            for (index in 0...bufferedImageArray.length) {
                final indexedImageIcon : ImageIconUnique = (cast this.imageJList.getModel().getElementAt(index) : ImageIconUnique);
                final bufferedImage : BufferedImage = ImageUtil.getInstance().createBufferedImage(bufferedImageArray[indexedImageIcon.getId()], this.imageUnifierProperties.getImageUnifierCell().getWidth(), this.imageUnifierProperties.getImageUnifierCell().getHeight(), false);
                tempBufferedImageArray[index] = bufferedImage;
            }
            final totalImages : Int = this.imageUnifierProperties.getRows() * this.imageUnifierProperties.getColumns();
            final averageRatio : Float = this.imagesRatioUtil.getAverage(tempBufferedImageArray, totalImages);
            final fudgedBufferedImageArray : haxe.ds.Vector<BufferedImage> = imagesRatioUtil.fudge(tempBufferedImageArray, totalImages, averageRatio);
            this.updateImage(fudgedBufferedImageArray);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "updateImageWithFudgedImages", e);
        }
    }

    private function updateImage(tempBufferedImageArray : haxe.ds.Vector<BufferedImage>) : Void {
        this.result = ImageUnifierUtil.getInstance().getImage(tempBufferedImageArray, this.imageUnifierProperties);
        final image : Icon = new ImageIcon(this.result);
        final label : JLabel = new JLabel(image);
        this.jScrollPane2.getViewport().add(label);
        this.updateUI();
    }

    private function updateOnPropertiesChange() : Void {
        if (this.rowsJTextField.getText().length() > 0 && this.columnsJTextField.getText().length() > 0 && this.cellWidthJTextField.getText().length() > 0 && this.cellHeightJTextField.getText().length() > 0) {
            this.imageUnifierProperties = new ImageUnifierProperties();
            this.imageUnifierProperties.setRows(this.rowsJTextField.getText());
            this.imageUnifierProperties.setColumns(this.columnsJTextField.getText());
            final imageUnifierCell : ImageUnifierCell = new ImageUnifierCell(this.cellWidthJTextField.getText(), this.cellHeightJTextField.getText());
            this.imageUnifierProperties.setImageUnifierCell(imageUnifierCell);
            final cellRatio : Float = (imageUnifierCell.getWidth() / imageUnifierCell.getHeight());
            var cellRatioString : String = cellRatio.toString();
            if (cellRatioString.length > 4) {
                cellRatioString = cellRatioString.substring(0, 4);
            }
            this.cellRatioJTextField.setText(cellRatioString);
            this.updateImage();
        }
    }

    private function initComponents() : Void {
        final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
        this.jScrollPane1 = new javax.swing.JScrollPane();
        this.imageJList = new javax.swing.JList();
        this.jScrollPane2 = new javax.swing.JScrollPane();
        this.jPanel1 = new javax.swing.JPanel();
        this.jButton1 = new javax.swing.JButton();
        this.upJButton = new javax.swing.JButton();
        this.downJButton = new javax.swing.JButton();
        this.fudgeItJButton = new javax.swing.JButton();
        this.jLabel2 = new javax.swing.JLabel();
        this.columnsJTextField = new javax.swing.JTextField();
        this.jLabel1 = new javax.swing.JLabel();
        this.rowsJTextField = new javax.swing.JTextField();
        this.jLabel3 = new javax.swing.JLabel();
        this.cellWidthJTextField = new javax.swing.JTextField();
        this.jLabel4 = new javax.swing.JLabel();
        this.cellHeightJTextField = new javax.swing.JTextField();
        this.jLabel5 = new javax.swing.JLabel();
        this.cellRatioJTextField = new javax.swing.JTextField();
        this.jLabel6 = new javax.swing.JLabel();
        this.avgRatioJTextField = new javax.swing.JTextField();
        this.jButton2 = new javax.swing.JButton();
        this.jButtonOrder = new javax.swing.JButton();
        setMinimumSize(new java.awt.Dimension(500, 375));
        setPreferredSize(new java.awt.Dimension(0, 0));
        this.imageJList.setMinimumSize(new java.awt.Dimension(50, 0));
        this.jScrollPane1.setViewportView(this.imageJList);
        this.jButton1.setText("Save");
        this.jButton1.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jButton1ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.upJButton.setText("Up");
        this.upJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                upJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.downJButton.setText("Down");
        this.downJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                downJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.fudgeItJButton.setText("Fudge It!");
        this.fudgeItJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                fudgeItJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel2.setText("Columns:");
        this.columnsJTextField.setText(commonPhoneStrings.TWO);
        this.columnsJTextField.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                columnsJTextFieldActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.columnsJTextField.addPropertyChangeListener(/* anonymous class body:
            public function propertyChange(evt : java.beans.PropertyChangeEvent) : Void {
                columnsJTextFieldPropertyChange(evt);
            }

*/ new java.beans.PropertyChangeListener());
        this.columnsJTextField.addKeyListener(/* anonymous class body:
            public function keyPressed(evt : java.awt.event.KeyEvent) : Void {
                columnsJTextFieldKeyPressed(evt);
            }

            public function keyTyped(evt : java.awt.event.KeyEvent) : Void {
                columnsJTextFieldKeyTyped(evt);
            }

*/ new java.awt.event.KeyAdapter());
        this.jLabel1.setText("Rows:");
        this.rowsJTextField.setText(commonPhoneStrings.TWO);
        this.rowsJTextField.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                rowsJTextFieldActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel3.setText("Cell Width:");
        this.cellWidthJTextField.setText("200");
        this.cellWidthJTextField.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                cellWidthJTextFieldActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel4.setText("Cell Height:");
        this.cellHeightJTextField.setText("150");
        this.cellHeightJTextField.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                cellHeightJTextFieldActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jLabel5.setText("Cell Ratio:");
        this.cellRatioJTextField.setEditable(false);
        this.jLabel6.setText("Avg Image Ratio:");
        this.avgRatioJTextField.setEditable(false);
        this.jButton2.setText(this.commonStrings.UPDATE);
        this.jButton2.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jButton2ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jButtonOrder.setText("Order");
        this.jButtonOrder.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jButtonOrderActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var jPanel1Layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup().addContainerGap().addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING).addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addGroup(jPanel1Layout.createSequentialGroup().addComponent(upJButton, javax.swing.GroupLayout.PREFERRED_SIZE, 71, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 10, Short.MAX_VALUE).addComponent(downJButton, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)).addComponent(fudgeItJButton, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup().addComponent(jLabel3).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 99, javax.swing.GroupLayout.PREFERRED_SIZE)).addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup().addComponent(jLabel4).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 96, javax.swing.GroupLayout.PREFERRED_SIZE)).addComponent(avgRatioJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addComponent(jLabel6, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addComponent(cellRatioJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addComponent(jLabel5, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addComponent(cellHeightJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addComponent(cellWidthJTextField, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addComponent(jButton2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE).addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup().addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jLabel2).addComponent(jLabel1)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(rowsJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 103, Short.MAX_VALUE).addGroup(jPanel1Layout.createSequentialGroup().addComponent(columnsJTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 102, Short.MAX_VALUE).addGap(1, 1, 1)))).addComponent(jButtonOrder, javax.swing.GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE)).addContainerGap()));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addContainerGap().addComponent(jButton1).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(upJButton).addComponent(downJButton)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jButtonOrder).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(fudgeItJButton).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel2).addComponent(columnsJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(jLabel1).addComponent(rowsJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel3).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(cellWidthJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel4).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(cellHeightJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jButton2).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jLabel5).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(cellRatioJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addGap(7, 7, 7).addComponent(jLabel6).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(avgRatioJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addGap(66, 66, 66)));
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 527, Short.MAX_VALUE)));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING).addComponent(jPanel1, javax.swing.GroupLayout.Alignment.LEADING, 0, 445, Short.MAX_VALUE).addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 445, Short.MAX_VALUE).addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 445, Short.MAX_VALUE)).addContainerGap()));
    }

    private function jButton2ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateOnPropertiesChange();
    }

    private function columnsJTextFieldKeyPressed(evt : java.awt.event.KeyEvent) : Void {
    }

    private function columnsJTextFieldKeyTyped(evt : java.awt.event.KeyEvent) : Void {
    }

    private function columnsJTextFieldPropertyChange(evt : java.beans.PropertyChangeEvent) : Void {
    }

    private function fudgeItJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateImageWithFudgedImages();
    }

    private function cellHeightJTextFieldActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateOnPropertiesChange();
    }

    private function cellWidthJTextFieldActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateOnPropertiesChange();
    }

    private function columnsJTextFieldActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateOnPropertiesChange();
    }

    private function rowsJTextFieldActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.updateOnPropertiesChange();
    }

    private function jButton1ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            final fileArray : haxe.ds.Vector<File> = this.imageProcessorInput.getFiles();
            final file : File = fileArray[0];
            var filePath : String = file.getAbsolutePath();
            final extensionIndex : Int = filePath.indexOf(this.imageStrings.PNG_EXTENSION);
            filePath = new StringMaker().append(filePath.substring(0, extensionIndex)).append(CommonSeps.getInstance().UNDERSCORE).appendint(Std.int(this.imageUnifierProperties.getColumns())).append("_By_").appendint(Std.int(this.imageUnifierProperties.getRows())).append("_Unified").append(this.imageStrings.PNG_EXTENSION).toString();
            this.logUtil.putF("New File Path: " + filePath, this, StringUtil.getInstance().EMPTY_STRING);
            final outputFile : File = new File(filePath);
            ImagePersistanceUtil.getInstance().saveWithBatik(FileWrapperUtil.wrapFile(outputFile), this.result);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "jButton1ActionPerformed", e);
        }
    }

    private function downJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        var index : Int = this.imageJList.getSelectedIndex();
        var defaultListModel : DefaultListModel = (cast this.imageJList.getModel() : DefaultListModel);
        if (index >= 0 && index + 1 < defaultListModel.size()) {
            var indexedImageIcon : ImageIconUnique = (cast defaultListModel.remove(index) : ImageIconUnique);
            defaultListModel.insertElementAt(indexedImageIcon, index + 1);
            this.imageJList.setSelectedIndex(index + 1);
            this.updateImage();
        }
    }

    private function upJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        var index : Int = this.imageJList.getSelectedIndex();
        if (index > 0) {
            var defaultListModel : DefaultListModel = (cast this.imageJList.getModel() : DefaultListModel);
            var indexedImageIcon : ImageIconUnique = (cast defaultListModel.remove(index) : ImageIconUnique);
            defaultListModel.insertElementAt(indexedImageIcon, index - 1);
            this.imageJList.setSelectedIndex(index - 1);
            this.updateImage();
        }
    }

    private function jButtonOrderActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        var defaultListModel : DefaultListModel = (cast this.imageJList.getModel() : DefaultListModel);
        var size : Int = defaultListModel.size();
        var last : Int = size - 1;
        {
            var index : Int = last;
            while (index >= 0) {
            var indexedImageIcon : ImageIconUnique = (cast defaultListModel.remove(last) : ImageIconUnique);
            defaultListModel.insertElementAt(indexedImageIcon, last - index);
                index--;
            }
        }
        if (size > 0) {
            this.imageJList.setSelectedIndex(0);
            this.updateImage();
        }
    }

    private var avgRatioJTextField : javax.swing.JTextField = null;
    private var cellHeightJTextField : javax.swing.JTextField = null;
    private var cellRatioJTextField : javax.swing.JTextField = null;
    private var cellWidthJTextField : javax.swing.JTextField = null;
    private var columnsJTextField : javax.swing.JTextField = null;
    private var downJButton : javax.swing.JButton = null;
    private var fudgeItJButton : javax.swing.JButton = null;
    private var imageJList : javax.swing.JList = null;
    private var jButton1 : javax.swing.JButton = null;
    private var jButton2 : javax.swing.JButton = null;
    private var jButtonOrder : javax.swing.JButton = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var jLabel3 : javax.swing.JLabel = null;
    private var jLabel4 : javax.swing.JLabel = null;
    private var jLabel5 : javax.swing.JLabel = null;
    private var jLabel6 : javax.swing.JLabel = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var jScrollPane1 : javax.swing.JScrollPane = null;
    private var jScrollPane2 : javax.swing.JScrollPane = null;
    private var rowsJTextField : javax.swing.JTextField = null;
    private var upJButton : javax.swing.JButton = null;
    public function getImageProcessorInput() : ImageProcessorInput {
        return this.imageProcessorInput;
    }

    public function setImageProcessorInput(imageProcessorInput : ImageProcessorInput) : Void {
        this.imageProcessorInput = imageProcessorInput;
        this.init();
    }

}

