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
//import java.util.Arrays;
//import java.util.Comparator;
//import javax.imageio.ImageIO;
import org.allbinary.gui.dialog.FileJDialog;
import org.allbinary.gui.dialog.FileJDialogListenerInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.ImageProcessorInput;
import org.allbinary.media.image.ImageProcessorInputCompositeInterface;
import org.allbinary.media.image.analysis.ColorRange;
import org.allbinary.media.image.analysis.ColorRangeInterface;
import org.allbinary.media.image.analysis.ImageAnalysis;
import org.allbinary.media.image.analysis.ImageAnalysisResults;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonStrings;

class ImageToolJFrame extends javax.swing.JFrame implements FileJDialogListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private static var imageProcessorInputCompositeInterface : ImageProcessorInputCompositeInterface = null;
    private var fileJDialog : FileJDialog;
    private var imageProcessorInput : ImageProcessorInput = null;
    public function new() {
        super();
        this.initComponents();
        final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
        this.setSize(640, 480);
        this.getMaxRedJTextField().setText("255");
        this.getMaxGreenJTextField().setText("255");
        this.getMaxBlueJTextField().setText("255");
        this.getMinRedJTextField().setText(commonPhoneStrings.ZERO);
        this.getMinGreenJTextField().setText(commonPhoneStrings.ZERO);
        this.getMinBlueJTextField().setText(commonPhoneStrings.ZERO);
        this.fileJDialog = new FileJDialog();
        this.fileJDialog.addFinishedListener(this);
    }

    private function initComponents() : Void {
        analysisActionJDialog = new javax.swing.JDialog();
        this.titleJLabel = new javax.swing.JLabel();
        this.colorRangeJLabel = new javax.swing.JLabel();
        this.redJLabel = new javax.swing.JLabel();
        this.minJLabel = new javax.swing.JLabel();
        this.maxJLabel = new javax.swing.JLabel();
        this.greenJLabel = new javax.swing.JLabel();
        this.blueJLabel = new javax.swing.JLabel();
        this.minRedJTextField = new javax.swing.JTextField();
        this.maxRedJTextField = new javax.swing.JTextField();
        this.maxGreenJTextField = new javax.swing.JTextField();
        this.minBlueJTextField = new javax.swing.JTextField();
        this.maxBlueJTextField = new javax.swing.JTextField();
        this.okJButton = new javax.swing.JButton();
        this.minGreenJTextField = new javax.swing.JTextField();
        this.jPanel1 = new javax.swing.JPanel();
        this.mainJMenuBar = new javax.swing.JMenuBar();
        this.fileJMenu = new javax.swing.JMenu();
        this.openImageJMenuItem = new javax.swing.JMenuItem();
        this.processingJMenu = new javax.swing.JMenu();
        this.analyzeJMenuItem = new javax.swing.JMenuItem();
        this.generateSpriteSplitterMenuItem = new javax.swing.JMenuItem();
        this.generateRotationMenuItem = new javax.swing.JMenuItem();
        this.generateMirrorSpriteMenuItem = new javax.swing.JMenuItem();
        this.generateRotationSpriteJMenuItem = new javax.swing.JMenuItem();
        this.createStripImageJMenuItem = new javax.swing.JMenuItem();
        this.mirrorJMenuItem = new javax.swing.JMenuItem();
        this.scaleImagesJMenuItem = new javax.swing.JMenuItem();
        this.canvasImagesJMenuItem = new javax.swing.JMenuItem();
        this.createIconImagesJMenuItem = new javax.swing.JMenuItem();
        this.analysisActionJDialog.setMinimumSize(new java.awt.Dimension(350, 250));
        this.titleJLabel.setText("              Color At Action Options            ");
        this.colorRangeJLabel.setText("Color Range");
        this.redJLabel.setText("Red:");
        this.minJLabel.setText("Minimum");
        this.maxJLabel.setText("Maximum");
        this.greenJLabel.setText("Green:");
        this.blueJLabel.setText("Blue:");
        this.okJButton.setText("OK");
        this.okJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                okJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var analysisActionJDialogLayout : org.jdesktop.layout.GroupLayout = new org.jdesktop.layout.GroupLayout(this.analysisActionJDialog.getContentPane());
        this.analysisActionJDialog.getContentPane().setLayout(analysisActionJDialogLayout);
        analysisActionJDialogLayout.setHorizontalGroup(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(analysisActionJDialogLayout.createSequentialGroup().addContainerGap().add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(analysisActionJDialogLayout.createSequentialGroup().add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(blueJLabel).add(greenJLabel).add(redJLabel).add(colorRangeJLabel)).add(29, 29, 29).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(org.jdesktop.layout.GroupLayout.TRAILING, minJLabel, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 58, Short.MAX_VALUE).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false).add(org.jdesktop.layout.GroupLayout.LEADING, minBlueJTextField).add(org.jdesktop.layout.GroupLayout.LEADING, minGreenJTextField).add(org.jdesktop.layout.GroupLayout.LEADING, minRedJTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 42, Short.MAX_VALUE).add(org.jdesktop.layout.GroupLayout.LEADING, okJButton))).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING).add(org.jdesktop.layout.GroupLayout.LEADING, analysisActionJDialogLayout.createSequentialGroup().add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false).add(org.jdesktop.layout.GroupLayout.LEADING, maxRedJTextField).add(org.jdesktop.layout.GroupLayout.LEADING, analysisActionJDialogLayout.createSequentialGroup().add(1, 1, 1).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(maxBlueJTextField).add(maxGreenJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 43, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 17, Short.MAX_VALUE)).add(org.jdesktop.layout.GroupLayout.LEADING, maxJLabel, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 61, Short.MAX_VALUE)).addContainerGap()).add(org.jdesktop.layout.GroupLayout.TRAILING, analysisActionJDialogLayout.createSequentialGroup().add(titleJLabel).add(25, 25, 25)))));
        analysisActionJDialogLayout.setVerticalGroup(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(analysisActionJDialogLayout.createSequentialGroup().add(titleJLabel).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE).add(minJLabel).add(colorRangeJLabel).add(maxJLabel)).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING).add(redJLabel).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE).add(minRedJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE).add(maxRedJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING).add(greenJLabel).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE).add(minGreenJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE).add(maxGreenJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))).addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING).add(blueJLabel).add(analysisActionJDialogLayout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE).add(minBlueJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE).add(maxBlueJTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))).add(16, 16, 16).add(okJButton).addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new java.awt.GridLayout(1, 0));
        this.jPanel1.setLayout(new java.awt.GridLayout(1, 0));
        getContentPane().add(this.jPanel1);
        this.fileJMenu.setText("File");
        this.fileJMenu.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                fileJMenuActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.openImageJMenuItem.setText("Open");
        this.openImageJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                openImageJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.fileJMenu.add(this.openImageJMenuItem);
        this.mainJMenuBar.add(this.fileJMenu);
        this.processingJMenu.setText("Processing");
        this.processingJMenu.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                processingJMenuActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.analyzeJMenuItem.setText("Image Analyze");
        this.analyzeJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                analyzeJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.analyzeJMenuItem);
        this.generateMirrorSpriteMenuItem.setText("Mirror Sprite Generator");
        this.generateMirrorSpriteMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                generateMirrorSpriteMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.generateMirrorSpriteMenuItem);
        this.generateRotationSpriteJMenuItem.setText("Rotation Sprite Generator");
        this.generateRotationSpriteJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                generateRotationSpriteJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.generateRotationSpriteJMenuItem);
        this.generateSpriteSplitterMenuItem.setText("Sprite Splitter Generator");
        this.generateSpriteSplitterMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                generateSpriteSplitterMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.generateSpriteSplitterMenuItem);
        this.generateRotationMenuItem.setText("Rotate Image Generator");
        this.generateRotationMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                generateRotationMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.generateRotationMenuItem);
        this.createStripImageJMenuItem.setText("Multi Image Unifier");
        this.createStripImageJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                createStripImageJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.createStripImageJMenuItem);
        this.mirrorJMenuItem.setText("Mirror Image(s)");
        this.mirrorJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                mirrorJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.mirrorJMenuItem);
        this.scaleImagesJMenuItem.setText("Scale Image(s)");
        this.scaleImagesJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                scaleImagesJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.scaleImagesJMenuItem);
        this.canvasImagesJMenuItem.setText("Canvas Image(s)");
        this.canvasImagesJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                canvasImagesJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.canvasImagesJMenuItem);
        this.createIconImagesJMenuItem.setText("Create Icon Image(s)");
        this.createIconImagesJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                createIconsJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.createIconImagesJMenuItem);
        this.mainJMenuBar.add(this.processingJMenu);
        setJMenuBar(this.mainJMenuBar);
        pack();
    }

    private function createStripImageJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            var imageUnifierJPanel : ImageUnifierJPanel = new ImageUnifierJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(imageUnifierJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = imageUnifierJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "createStripImageJMenuItemActionPerformed", e);
        }
    }

    private function okJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "okJButtonActionPerformed");
            final imageAnalysisResultsArray : haxe.ds.Vector<ImageAnalysisResults> = ImageAnalysis.getInstance().process(this.imageProcessorInput.getBufferedImageArray(), this.getColorRangeInterface());
            this.jPanel1.removeAll();
            this.jPanel1.add(new ImageAnalysisResultsJPanel(imageAnalysisResultsArray));
            this.jPanel1.updateUI();
            this.analysisActionJDialog.setVisible(false);
            ImageToolJFrame.imageProcessorInputCompositeInterface = null;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "okJButtonActionPerformed", e);
        }
    }

    private function processingJMenuActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function openImageJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "openImageJMenuItemActionPerformed");
            this.fileJDialog.setVisible(true);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "openImageJMenuItemActionPerformed", e);
        }
    }

    public function onFiles(files : haxe.ds.Vector<File>) : Void {
        try {
            this.logUtil.putF("Reading " + files.length + " files.", this, "onFiles");
            Arrays.sort(files, /* anonymous class body:
                public function compare(file1 : File, file2 : File) : Int {
                    final fileNameIndexValue1 : Int = extractIndexNumberIfAnyFromFileName(file1.getName());
                    final fileNameIndexValue2 : Int = extractIndexNumberIfAnyFromFileName(file2.getName());
                    return fileNameIndexValue1 - fileNameIndexValue2;
                }

                private function extractIndexNumberIfAnyFromFileName(name : String) : Int {
                    var i : Int = 0;
                    try {
                        final start : Int = name.lastIndexOf("_".code) + 1;
                        final end : Int = name.lastIndexOf(".".code);
                        final number : String = name.substring(start, end);
                        i = Std.parseInt(number);
                    } catch (e : haxe.Exception) {
                        i = 0;
                    }
                    return i;
                }

*/ new Comparator<File>());
            final bufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...files.length) null]);
            for (index in 0...files.length) {
                bufferedImageArray[index] = ImageIO.read(files[index]);
                if (bufferedImageArray[index] == null) {
                    throw new haxe.Exception("Unable to read file: " + files[index].getPath());
                }
            }
            this.imageProcessorInput = new ImageProcessorInput(files, bufferedImageArray);
            this.fileJDialog.setVisible(false);
            if (ImageToolJFrame.imageProcessorInputCompositeInterface != null) {
                ImageToolJFrame.imageProcessorInputCompositeInterface.setImageProcessorInput(this.imageProcessorInput);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onFiles", e);
        }
    }

    private function fileJMenuActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function analyzeJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "analyzeJMenuItemActionPerformed");
            this.analysisActionJDialog.setVisible(true);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "analyzeJMenuItemActionPerformed", e);
        }
    }

    private function generateRotationSpriteJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "generateRotationSpriteJMenuItemActionPerformed");
            var spriteImageJPanel : RotationSpriteImageJPanel = new RotationSpriteImageJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(spriteImageJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = spriteImageJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateRotationSpriteJMenuItemActionPerformed", e);
        }
    }

    private function generateSpriteSplitterMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "generateRotationSpriteJMenuItemActionPerformed");
            var imageJPanel : SpriteSplitterImageJPanel = new SpriteSplitterImageJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(imageJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = imageJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateRotationMenuItemActionPerformed", e);
        }
    }

    private function generateRotationMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "generateRotationSpriteJMenuItemActionPerformed");
            var rotationImageJPanel : RotationImageJPanel = new RotationImageJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(rotationImageJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = rotationImageJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateRotationMenuItemActionPerformed", e);
        }
    }

    private function scaleImagesJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "scaleImagesJMenuItemActionPerformed");
            final resizeImageJPanel : ResizeImageJPanel = new ResizeImageJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(resizeImageJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = resizeImageJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "scaleImagesJMenuItemActionPerformed", e);
        }
    }

    private function createIconsJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "createIconsJMenuItemActionPerformed");
            final createIconImagesJPanel : CreateIconImagesJPanel = new CreateIconImagesJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(createIconImagesJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = createIconImagesJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "scaleImagesJMenuItemActionPerformed", e);
        }
    }

    private function canvasImagesJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "canvasImagesJMenuItemActionPerformed");
            final resizeImageJPanel : CanvasImageJPanel = new CanvasImageJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(resizeImageJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = resizeImageJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "scaleImagesJMenuItemActionPerformed", e);
        }
    }

    private function generateMirrorSpriteMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "generateMirrorSpriteJMenuItemActionPerformed");
            var spriteImageJPanel : MirrorSpriteImageJPanel = new MirrorSpriteImageJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(spriteImageJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = spriteImageJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateMirrorSpriteJMenuItemActionPerformed", e);
        }
    }

    private function mirrorJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "generateMirrorJMenuItemActionPerformed");
            var mirrorImageJPanel : MirrorImageJPanel = new MirrorImageJPanel(this.imageProcessorInput);
            this.jPanel1.removeAll();
            this.jPanel1.add(mirrorImageJPanel);
            this.jPanel1.updateUI();
            ImageToolJFrame.imageProcessorInputCompositeInterface = mirrorImageJPanel;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateMirrorJMenuItemActionPerformed", e);
        }
    }

    private function getColorRangeInterface() : ColorRangeInterface {
        var colorRangeInterface : ColorRangeInterface = (cast new ColorRange() : ColorRangeInterface);
        colorRangeInterface.setMinRed(Std.int(this.getMinRedJTextField().getText()));
        colorRangeInterface.setMaxRed(Std.int(this.getMaxRedJTextField().getText()));
        colorRangeInterface.setMinGreen(Std.int(this.getMinGreenJTextField().getText()));
        colorRangeInterface.setMaxGreen(Std.int(this.getMaxGreenJTextField().getText()));
        colorRangeInterface.setMinBlue(Std.int(this.getMinBlueJTextField().getText()));
        colorRangeInterface.setMaxBlue(Std.int(this.getMaxBlueJTextField().getText()));
        return colorRangeInterface;
    }

    public function getMaxBlueJTextField() : javax.swing.JTextField {
        return this.maxBlueJTextField;
    }

    public function setMaxBlueJTextField(maxBlueJTextField : javax.swing.JTextField) : Void {
        this.maxBlueJTextField = this.maxBlueJTextField;
    }

    public function getMaxGreenJTextField() : javax.swing.JTextField {
        return this.maxGreenJTextField;
    }

    public function setMaxGreenJTextField(maxGreenJTextField : javax.swing.JTextField) : Void {
        this.maxGreenJTextField = this.maxGreenJTextField;
    }

    public function getMaxRedJTextField() : javax.swing.JTextField {
        return this.maxRedJTextField;
    }

    public function setMaxRedJTextField(maxRedJTextField : javax.swing.JTextField) : Void {
        this.maxRedJTextField = this.maxRedJTextField;
    }

    public function getMinBlueJTextField() : javax.swing.JTextField {
        return this.minBlueJTextField;
    }

    public function setMinBlueJTextField(minBlueJTextField : javax.swing.JTextField) : Void {
        this.minBlueJTextField = this.minBlueJTextField;
    }

    public function getMinGreenJTextField() : javax.swing.JTextField {
        return this.minGreenJTextField;
    }

    public function setMinGreenJTextField(minGreenJTextField : javax.swing.JTextField) : Void {
        this.minGreenJTextField = this.minGreenJTextField;
    }

    public function getMinRedJTextField() : javax.swing.JTextField {
        return this.minRedJTextField;
    }

    public function setMinRedJTextField(minRedJTextField : javax.swing.JTextField) : Void {
        this.minRedJTextField = this.minRedJTextField;
    }

    private var analysisActionJDialog : javax.swing.JDialog = null;
    private var analyzeJMenuItem : javax.swing.JMenuItem = null;
    private var blueJLabel : javax.swing.JLabel = null;
    private var colorRangeJLabel : javax.swing.JLabel = null;
    private var createStripImageJMenuItem : javax.swing.JMenuItem = null;
    private var fileJMenu : javax.swing.JMenu = null;
    private var generateSpriteSplitterMenuItem : javax.swing.JMenuItem = null;
    private var generateRotationMenuItem : javax.swing.JMenuItem = null;
    private var generateMirrorSpriteMenuItem : javax.swing.JMenuItem = null;
    private var generateRotationSpriteJMenuItem : javax.swing.JMenuItem = null;
    private var greenJLabel : javax.swing.JLabel = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var mainJMenuBar : javax.swing.JMenuBar = null;
    private var maxBlueJTextField : javax.swing.JTextField = null;
    private var maxGreenJTextField : javax.swing.JTextField = null;
    private var maxJLabel : javax.swing.JLabel = null;
    private var maxRedJTextField : javax.swing.JTextField = null;
    private var minBlueJTextField : javax.swing.JTextField = null;
    private var minGreenJTextField : javax.swing.JTextField = null;
    private var minJLabel : javax.swing.JLabel = null;
    private var minRedJTextField : javax.swing.JTextField = null;
    private var mirrorJMenuItem : javax.swing.JMenuItem = null;
    private var okJButton : javax.swing.JButton = null;
    private var openImageJMenuItem : javax.swing.JMenuItem = null;
    private var processingJMenu : javax.swing.JMenu = null;
    private var redJLabel : javax.swing.JLabel = null;
    private var scaleImagesJMenuItem : javax.swing.JMenuItem = null;
    private var canvasImagesJMenuItem : javax.swing.JMenuItem = null;
    private var createIconImagesJMenuItem : javax.swing.JMenuItem = null;
    private var titleJLabel : javax.swing.JLabel = null;
}

