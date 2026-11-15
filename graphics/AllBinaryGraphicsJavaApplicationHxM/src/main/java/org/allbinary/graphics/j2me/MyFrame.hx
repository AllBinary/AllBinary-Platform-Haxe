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
package org.allbinary.graphics.j2me;

//import java.awt.*;
//import java.io.File;
//import java.util.HashMap;
//import javax.swing.*;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.dom.DomHelper;
import org.allbinary.graphics.j2me.dialog.NewWorkAreaJDialog;
import org.allbinary.graphics.j2me.dialog.RotateJDialog;
import org.allbinary.graphics.j2me.workarea.WorkAreaDom;
import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel;
import org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService;
import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource;
import org.allbinary.gui.dialog.FileJDialog;
import org.allbinary.gui.dialog.FileJDialogListenerInterface;
import org.allbinary.gui.dialog.HashMapJDialogListenerInterface;
import org.allbinary.log.LOGGING;
import org.allbinary.logic.communication.log.GuiLog;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.math.AngleFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;

class MyFrame extends javax.swing.JFrame implements FileJDialogListenerInterface implements HashMapJDialogListenerInterface implements java.awt.event.KeyListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final guiLog : GuiLog = GuiLog.getInstance();
    private final xslHelper : XslHelper = XslHelper.getInstance();
    private static final MAXWORKAREAS : Int = 10;
    private static var numberOfWorkAreas : Int = 0;
    private final JAVA_TEMPLATE : String = "svgExport.xsl";
    private final SAVEEXTENSION : String = ".gxml";
    private final JAVAEXTENSION : String = ".javax";
    private static final PATH : String = "G:/mnt/bc/mydev/work/graphics/AllBinaryGraphicsJavaApplication";
    private static final SAVE_PATH : String = MyFrame.PATH + "/save";
    private static final TEMPLATE_EXPORT_PATH : String = MyFrame.PATH + "/templates/export";
    private var fileJDialog : FileJDialog;
    private var rotateJDialog : RotateJDialog;
    public function new() {
        super();
        this.initComponents();
        this.setSize(new Dimension(550, 400));
        this.mainJPanel.setSize(new Dimension(550, 400));
        this.jTabbedPane.setSize(new Dimension(550, 400));
        this.fileJDialog = new FileJDialog();
        this.fileJDialog.addFinishedListener(this);
        this.rotateJDialog = new RotateJDialog(this, false);
    }

    private function initComponents() : Void {
        jToolBar1 = new javax.swing.JToolBar();
        this.jButton2 = new javax.swing.JButton();
        this.saveJButton = new javax.swing.JButton();
        this.jButton1 = new javax.swing.JButton();
        this.openJButton = new javax.swing.JButton();
        this.jButton3 = new javax.swing.JButton();
        this.jButton4 = new javax.swing.JButton();
        this.jButton41 = new javax.swing.JButton();
        this.jButton5 = new javax.swing.JButton();
        this.animateJButton = new javax.swing.JButton();
        this.playJButton = new javax.swing.JButton();
        this.stopJjButton = new javax.swing.JButton();
        this.jPanel1 = new javax.swing.JPanel();
        this.mainJPanel = new javax.swing.JPanel();
        this.jTabbedPane = new javax.swing.JTabbedPane();
        this.statusJPanel = new javax.swing.JPanel();
        MyFrame.statusJLabel = new javax.swing.JLabel();
        this.menuJMenuBar = new javax.swing.JMenuBar();
        this.fileJMenu = new javax.swing.JMenu();
        this.newJMenuItem = new javax.swing.JMenuItem();
        this.openJMenuItem = new javax.swing.JMenuItem();
        this.saveJMenuItem = new javax.swing.JMenuItem();
        this.saveAsJMenuItem = new javax.swing.JMenuItem();
        this.exportJMenuItem1 = new javax.swing.JMenuItem();
        this.exitJMenuItem = new javax.swing.JMenuItem();
        this.viewJMenu = new javax.swing.JMenu();
        this.zoomInJMenuItem = new javax.swing.JMenuItem();
        this.zoomOutJMenuItem = new javax.swing.JMenuItem();
        this.objectJMenu = new javax.swing.JMenu();
        this.explodeAllJMenuItem = new javax.swing.JMenuItem();
        this.frameJMenu = new javax.swing.JMenu();
        this.previousFrameJMenuItem = new javax.swing.JMenuItem();
        this.nextFrameJMenuItem = new javax.swing.JMenuItem();
        this.removeJMenuItem = new javax.swing.JMenuItem();
        this.copyJMenuItem1 = new javax.swing.JMenuItem();
        this.insertAfterJMenuItem = new javax.swing.JMenuItem();
        this.insertBeforeJMenuItem = new javax.swing.JMenuItem();
        this.generateJMenu = new javax.swing.JMenu();
        this.centerJMenuItem = new javax.swing.JMenuItem();
        this.autoDamageJMenuItem = new javax.swing.JMenuItem();
        this.autoExplodeJMenuItem = new javax.swing.JMenuItem();
        this.autoGrowJMenuItem = new javax.swing.JMenuItem();
        this.jMenuItem1 = new javax.swing.JMenuItem();
        this.autoRotateGenerationJMenuItem = new javax.swing.JMenuItem();
        this.autoSheildMenuItem = new javax.swing.JMenuItem();
        this.autoShrinkJMenuItem = new javax.swing.JMenuItem();
        this.jMenu1 = new javax.swing.JMenu();
        addWindowListener(/* anonymous class body:
            public function windowClosing(evt : java.awt.event.WindowEvent) : Void {
                exitForm(evt);
            }

*/ new java.awt.event.WindowAdapter());
        this.jButton2.setText("New");
        this.jButton2.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jButton2ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jToolBar1.add(this.jButton2);
        this.saveJButton.setText("Save");
        this.saveJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                saveJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jToolBar1.add(this.saveJButton);
        this.jButton1.setText("Export");
        this.jButton1.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jButton1ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jToolBar1.add(this.jButton1);
        this.openJButton.setText("Open");
        this.openJButton.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                openJButtonActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.jToolBar1.add(this.openJButton);
        this.jButton3.setText("Copy");
        this.jToolBar1.add(this.jButton3);
        this.jButton4.setText("Insert Before");
        this.jToolBar1.add(this.jButton4);
        this.jButton41.setText("Insert After");
        this.jToolBar1.add(this.jButton41);
        this.jButton5.setText("Delete");
        this.jToolBar1.add(this.jButton5);
        this.animateJButton.setText("AnimateEdit");
        this.jToolBar1.add(this.animateJButton);
        this.playJButton.setText("Play");
        this.playJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                playJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.jToolBar1.add(this.playJButton);
        this.stopJjButton.setText("Stop");
        this.stopJjButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                stopJjButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.jToolBar1.add(this.stopJjButton);
        getContentPane().add(this.jToolBar1, java.awt.BorderLayout.NORTH);
        this.jPanel1.setLayout(new java.awt.GridLayout(1, 0));
        this.mainJPanel.setLayout(new java.awt.GridLayout(1, 0));
        this.jTabbedPane.setMinimumSize(new java.awt.Dimension(550, 400));
        this.jTabbedPane.addChangeListener(/* anonymous class body:
            public function stateChanged(evt : javax.swing.event.ChangeEvent) : Void {
                jTabbedPaneStateChanged(evt);
            }

*/ new javax.swing.event.ChangeListener());
        this.mainJPanel.add(this.jTabbedPane);
        this.jPanel1.add(this.mainJPanel);
        getContentPane().add(this.jPanel1, java.awt.BorderLayout.CENTER);
        this.statusJPanel.setLayout(new java.awt.GridLayout(1, 0));
        MyFrame.statusJLabel.setText("Status Bar");
        this.statusJPanel.add(MyFrame.statusJLabel);
        getContentPane().add(this.statusJPanel, java.awt.BorderLayout.SOUTH);
        this.fileJMenu.setText("File");
        this.fileJMenu.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                fileJMenuActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.newJMenuItem.setText("New");
        this.newJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                newJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.fileJMenu.add(this.newJMenuItem);
        this.openJMenuItem.setText("Open");
        this.openJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                openJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.fileJMenu.add(this.openJMenuItem);
        this.saveJMenuItem.setText("Save");
        this.saveJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                saveJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.fileJMenu.add(this.saveJMenuItem);
        this.saveAsJMenuItem.setText("SaveAs");
        this.fileJMenu.add(this.saveAsJMenuItem);
        this.exportJMenuItem1.setText("Export");
        this.exportJMenuItem1.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                exportJMenuItem1ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.fileJMenu.add(this.exportJMenuItem1);
        this.exitJMenuItem.setText("Exit");
        this.exitJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                exitJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.fileJMenu.add(this.exitJMenuItem);
        this.menuJMenuBar.add(this.fileJMenu);
        this.viewJMenu.setText("View");
        this.zoomInJMenuItem.setText("Zoom In");
        this.zoomInJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                zoomInJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.viewJMenu.add(this.zoomInJMenuItem);
        this.zoomOutJMenuItem.setText("Zoom Out");
        this.zoomOutJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                zoomOutJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.viewJMenu.add(this.zoomOutJMenuItem);
        this.menuJMenuBar.add(this.viewJMenu);
        this.objectJMenu.setText("Objects");
        this.explodeAllJMenuItem.setText("Explode All");
        this.explodeAllJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                explodeAllJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.objectJMenu.add(this.explodeAllJMenuItem);
        this.menuJMenuBar.add(this.objectJMenu);
        this.frameJMenu.setText("Frame");
        this.frameJMenu.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                frameJMenuActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.previousFrameJMenuItem.setText("Previous");
        this.frameJMenu.add(this.previousFrameJMenuItem);
        this.nextFrameJMenuItem.setText(CommonLabels.getInstance().NEXT);
        this.frameJMenu.add(this.nextFrameJMenuItem);
        this.removeJMenuItem.setText("Remove");
        this.frameJMenu.add(this.removeJMenuItem);
        this.copyJMenuItem1.setText("Copy");
        this.frameJMenu.add(this.copyJMenuItem1);
        this.insertAfterJMenuItem.setText("Ins After");
        this.frameJMenu.add(this.insertAfterJMenuItem);
        this.insertBeforeJMenuItem.setText("Ins Before");
        this.frameJMenu.add(this.insertBeforeJMenuItem);
        this.menuJMenuBar.add(this.frameJMenu);
        this.generateJMenu.setText("Generate");
        this.centerJMenuItem.setText("Center");
        this.centerJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                centerJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.generateJMenu.add(this.centerJMenuItem);
        this.autoDamageJMenuItem.setText("Damage");
        this.generateJMenu.add(this.autoDamageJMenuItem);
        this.autoExplodeJMenuItem.setText("Explode");
        this.autoExplodeJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                autoExplodeJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.generateJMenu.add(this.autoExplodeJMenuItem);
        this.autoGrowJMenuItem.setText("Grow");
        this.generateJMenu.add(this.autoGrowJMenuItem);
        this.jMenuItem1.setText("Mirror");
        this.jMenuItem1.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jMenuItem1ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.generateJMenu.add(this.jMenuItem1);
        this.autoRotateGenerationJMenuItem.setText("Rotate");
        this.autoRotateGenerationJMenuItem.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                autoRotateGenerationJMenuItemMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        this.generateJMenu.add(this.autoRotateGenerationJMenuItem);
        this.autoSheildMenuItem.setText("Shield");
        this.generateJMenu.add(this.autoSheildMenuItem);
        this.autoShrinkJMenuItem.setText("Shrink");
        this.generateJMenu.add(this.autoShrinkJMenuItem);
        this.menuJMenuBar.add(this.generateJMenu);
        this.jMenu1.setText("Help");
        this.menuJMenuBar.add(this.jMenu1);
        setJMenuBar(this.menuJMenuBar);
        pack();
    }

    private function explodeAllJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        try {
            MyCanvasEventService.fire(new MyCanvasEvent((cast new MyCanvasEventSource(MyCanvasEventService.EXPLODE, null) : Any)));
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "explodeAllJMenuItemMousePressed", e);
        }
    }

    private function autoExplodeJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        try {
            MyCanvasEventService.fire(new MyCanvasEvent((cast new MyCanvasEventSource(MyCanvasEventService.AUTOEXPLODE, null) : Any)));
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "autoExplodeJMenuItemMousePressed", e);
        }
    }

    private function stopJjButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        this.getSelectedWorkArea().stop();
    }

    private function playJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        this.getSelectedWorkArea().play();
    }

    private function autoRotateGenerationJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        this.rotateJDialog.setVisible(true);
    }

    private function zoomOutJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        this.getSelectedWorkArea().changeZoom(-1);
    }

    private function zoomInJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        this.getSelectedWorkArea().changeZoom(1);
    }

    private function openJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.openGraphics();
    }

    private function exportJMenuItem1ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.export();
    }

    private function saveJMenuItemMousePressed(evt : java.awt.event.MouseEvent) : Void {
        this.save();
    }

    private function jTabbedPaneStateChanged(evt : javax.swing.event.ChangeEvent) : Void {
        this.updateSelectedWorkArea();
    }

    private function frameJMenuActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function exitJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        System.exit(0);
    }

    private function newJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.newGraphics();
    }

    private function fileJMenuActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function exitForm(evt : java.awt.event.WindowEvent) : Void {
        System.exit(0);
    }

    private function openJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.openGraphics();
    }

    private function jButton2ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.newGraphics();
    }

    private function centerJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            MyCanvasEventService.fire(new MyCanvasEvent((cast new MyCanvasEventSource(MyCanvasEventService.CENTER, null) : Any)));
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "centerJMenuItemActionPerformed", e);
        }
    }

    private function saveJButtonActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.save();
    }

    private function jButton1ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.export();
    }

    private function jMenuItem1ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.getSelectedWorkArea().autoMirror();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "centerJMenuItemActionPerformed", e);
        }
    }

    public function onFiles(files : haxe.ds.Vector<File>) : Void {
        try {
            this.logUtil.putF("Reading: " + files, this, "onFiles");
            for (index in 0...files.length) {
                var document : Document = DomHelper.getInstance().createDocument(files[index]);
                var workAreaJPanel : WorkAreaJPanel = new WorkAreaJPanel(new WorkAreaDom(document), this.getSize());
                workAreaJPanel.setLayout(new GridLayout(1, 1));
                this.add((cast workAreaJPanel : WorkAreaJPanelInterface));
            }
            this.fileJDialog.setVisible(false);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onFiles", e);
        }
    }

    private function newGraphics() : Void {
        try {
            var newName : String = "graphic" + MyFrame.numberOfWorkAreas;
            var dim : Dimension = this.getSize();
            var newDialog : NewWorkAreaJDialog = new NewWorkAreaJDialog(this, false, dim, newName);
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.MENUEVENT)) {
                this.guiLog.put(this.commonStrings.EXCEPTION, this, "newJMenuItemActionPerformed", e);
            }
        }
    }

    private function openGraphics() : Void {
        try {
            this.logUtil.putF("Starting", this, "openImageJMenuItemActionPerformed");
            this.fileJDialog.setVisible(true);
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.MENUEVENT)) {
                this.guiLog.put(this.commonStrings.EXCEPTION, this, "open", e);
            }
        }
    }

    private function export() : Void {
        try {
            var workAreaJPanel : WorkAreaJPanelInterface = (cast this.jTabbedPane.getSelectedComponent() : WorkAreaJPanelInterface);
            var file : File = new File(this.SAVE_PATH + "/" + workAreaJPanel.getName() + this.JAVAEXTENSION);
            var document : Document = workAreaJPanel.toDocument();
            this.logUtil.putF("Export: " + DomHelper.getInstance().toString(document), this, "exportJMenuItem1ActionPerformed");
            this.xslHelper.export(file, MyFrame.TEMPLATE_EXPORT_PATH + "/" + this.JAVA_TEMPLATE, document);
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.MENUEVENT)) {
                this.guiLog.put(this.commonStrings.EXCEPTION, this, "export", e);
            }
        }
    }

    private function save() : Void {
        try {
            var workAreaJPanel : WorkAreaJPanelInterface = (cast this.jTabbedPane.getSelectedComponent() : WorkAreaJPanelInterface);
            DomHelper.getInstance().save(new File(this.SAVE_PATH + "/" + workAreaJPanel.getName() + this.SAVEEXTENSION), workAreaJPanel.toDocument());
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.MENUEVENT)) {
                this.guiLog.put(this.commonStrings.EXCEPTION, this, this.commonStrings.SAVE, e);
            }
        }
    }

    // throws Exception
    public function onHashMap(hashMap : HashMap) : Void {
        var angleIncrementInteger : Null<Int> = (cast hashMap.get(Std.string(0)) : Null<Int>);
        var totalRotationInteger : Null<Int> = (cast hashMap.get(Std.string(1)) : Null<Int>);
        this.getSelectedWorkArea().autoRotate(Std.int(angleIncrementInteger), Std.int(totalRotationInteger));
    }

    private function getSelectedWorkArea() : WorkAreaJPanelInterface {
        return (cast this.jTabbedPane.getSelectedComponent() : WorkAreaJPanelInterface);
    }

    public function updateSelectedWorkArea() : Void {
        var numberOfTabs : Int = this.jTabbedPane.getTabCount();
        for (index in 0...numberOfTabs) {
            var workAreaJPanel : WorkAreaJPanelInterface = (cast this.jTabbedPane.getComponentAt(index) : WorkAreaJPanelInterface);
            workAreaJPanel.deselect();
        }
        var workAreaJPanel : WorkAreaJPanelInterface = (cast this.jTabbedPane.getSelectedComponent() : WorkAreaJPanelInterface);
        if (workAreaJPanel != null) {
            workAreaJPanel.select();
        }
    }

    // throws Exception
    public function add(newCanvasInterface : WorkAreaJPanelInterface) : Void {
        try {
            this.numberOfWorkAreas++;
            if (this.numberOfWorkAreas == MyFrame.MAXWORKAREAS) {
                throw new haxe.Exception();
            }
            this.jTabbedPane.addTab(newCanvasInterface.getName(), (cast newCanvasInterface : JPanel));
            this.jTabbedPane.setSelectedComponent((cast newCanvasInterface : JPanel));
            var animationThread : Thread = new Thread((cast newCanvasInterface : Runnable));
            animationThread.start();
            this.updateSelectedWorkArea();
        } catch (e : haxe.Exception) {
            if (LOGGING.contains(LOGGING.GRAPHICSCREATION)) {
                this.guiLog.put(this.commonStrings.EXCEPTION, this, "addNewCanvas", e);
            }
        }
    }

    public function keyPressed(keyEvent : java.awt.event.KeyEvent) : Void {
        this.getSelectedWorkArea().keyPressed(keyEvent);
    }

    public function keyReleased(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    public function keyTyped(keyEvent : java.awt.event.KeyEvent) : Void {
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        try {
            AngleFactory.getInstance();
            SmallIntegerSingletonFactory.getInstance().init();
            new MyFrame().show();
        } catch (e : haxe.Exception) {
            final logUtil : LogUtil = LogUtil.getInstance();
            logUtil.put(CommonStrings.getInstance().EXCEPTION, null, "main", e);
        }
    }

    private var animateJButton : javax.swing.JButton = null;
    private var autoDamageJMenuItem : javax.swing.JMenuItem = null;
    private var autoExplodeJMenuItem : javax.swing.JMenuItem = null;
    private var autoGrowJMenuItem : javax.swing.JMenuItem = null;
    private var autoRotateGenerationJMenuItem : javax.swing.JMenuItem = null;
    private var autoSheildMenuItem : javax.swing.JMenuItem = null;
    private var autoShrinkJMenuItem : javax.swing.JMenuItem = null;
    private var centerJMenuItem : javax.swing.JMenuItem = null;
    private var copyJMenuItem1 : javax.swing.JMenuItem = null;
    private var exitJMenuItem : javax.swing.JMenuItem = null;
    private var explodeAllJMenuItem : javax.swing.JMenuItem = null;
    private var exportJMenuItem1 : javax.swing.JMenuItem = null;
    private var fileJMenu : javax.swing.JMenu = null;
    private var frameJMenu : javax.swing.JMenu = null;
    private var generateJMenu : javax.swing.JMenu = null;
    private var insertAfterJMenuItem : javax.swing.JMenuItem = null;
    private var insertBeforeJMenuItem : javax.swing.JMenuItem = null;
    private var jButton1 : javax.swing.JButton = null;
    private var jButton2 : javax.swing.JButton = null;
    private var jButton3 : javax.swing.JButton = null;
    private var jButton4 : javax.swing.JButton = null;
    private var jButton41 : javax.swing.JButton = null;
    private var jButton5 : javax.swing.JButton = null;
    private var jMenu1 : javax.swing.JMenu = null;
    private var jMenuItem1 : javax.swing.JMenuItem = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var jTabbedPane : javax.swing.JTabbedPane = null;
    private var jToolBar1 : javax.swing.JToolBar = null;
    private var mainJPanel : javax.swing.JPanel = null;
    private var menuJMenuBar : javax.swing.JMenuBar = null;
    private var newJMenuItem : javax.swing.JMenuItem = null;
    private var nextFrameJMenuItem : javax.swing.JMenuItem = null;
    private var objectJMenu : javax.swing.JMenu = null;
    private var openJButton : javax.swing.JButton = null;
    private var openJMenuItem : javax.swing.JMenuItem = null;
    private var playJButton : javax.swing.JButton = null;
    private var previousFrameJMenuItem : javax.swing.JMenuItem = null;
    private var removeJMenuItem : javax.swing.JMenuItem = null;
    private var saveAsJMenuItem : javax.swing.JMenuItem = null;
    private var saveJButton : javax.swing.JButton = null;
    private var saveJMenuItem : javax.swing.JMenuItem = null;
    public static var statusJLabel : javax.swing.JLabel = null;
    private var statusJPanel : javax.swing.JPanel = null;
    private var stopJjButton : javax.swing.JButton = null;
    private var viewJMenu : javax.swing.JMenu = null;
    private var zoomInJMenuItem : javax.swing.JMenuItem = null;
    private var zoomOutJMenuItem : javax.swing.JMenuItem = null;
}

