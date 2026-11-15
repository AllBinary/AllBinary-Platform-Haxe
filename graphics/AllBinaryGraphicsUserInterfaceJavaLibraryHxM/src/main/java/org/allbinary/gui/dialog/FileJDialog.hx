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
package org.allbinary.gui.dialog;

import org.allbinary.thread.ARunnable;
//import java.io.File;
import org.allbinary.logic.communication.log.LogUtil;

class FileJDialog extends javax.swing.JDialog {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var finishedListenerInterface : FileJDialogListenerInterface = null;
    public function new() {
        super();
        this.initComponents();
        this.getJFileChooser1().setMultiSelectionEnabled(true);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(parent : java.awt.Frame, modal : Bool) {
        super(parent, modal);
        this.initComponents();
        this.getJFileChooser1().setMultiSelectionEnabled(true);
    }

    public function addFinishedListener(finishedListenerInterface : FileJDialogListenerInterface) : Void {
        this.finishedListenerInterface = finishedListenerInterface;
    }

    private function initComponents() : Void {
        this.jFileChooser1 = new javax.swing.JFileChooser();
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        this.jFileChooser1.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jFileChooser1ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var layout : org.jdesktop.layout.GroupLayout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup().addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).add(jFileChooser1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE).addContainerGap()));
        layout.setVerticalGroup(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(layout.createSequentialGroup().addContainerGap().add(jFileChooser1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 357, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE).addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        pack();
    }

    private function jFileChooser1ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        this.logUtil.putF("Starting Action Command: " + evt.getActionCommand(), this, "ActionPerformed");
        var files : haxe.ds.Vector<File> = this.getJFileChooser1().getSelectedFiles();
        if (evt.getActionCommand() == this.getJFileChooser1().CANCEL_SELECTION) {
            this.setVisible(false);
        }
        if (evt.getActionCommand() == this.getJFileChooser1().APPROVE_SELECTION) {
            if (files != null && files.length > 0) {
                this.finishedListenerInterface.onFiles(files);
            }
        }
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        java.awt.EventQueue.invokeLater(/* anonymous class body:
            public function run() : Void {
                new FileJDialog(new javax.swing.JFrame(), true).setVisible(true);
            }

*/ new ARunnable());
    }

    public function getJFileChooser1() : javax.swing.JFileChooser {
        return this.jFileChooser1;
    }

    public function setJFileChooser1(jFileChooser1 : javax.swing.JFileChooser) : Void {
        this.jFileChooser1 = jFileChooser1;
    }

    private var jFileChooser1 : javax.swing.JFileChooser = null;
}

