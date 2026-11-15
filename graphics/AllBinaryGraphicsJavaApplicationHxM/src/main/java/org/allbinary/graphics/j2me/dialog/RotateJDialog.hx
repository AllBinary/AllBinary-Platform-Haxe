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
package org.allbinary.graphics.j2me.dialog;

import org.allbinary.thread.ARunnable;
//import java.util.HashMap;
import org.allbinary.gui.dialog.HashMapJDialogListenerInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class RotateJDialog extends javax.swing.JDialog {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var hashMap : HashMap = StdUtil.getInstance().createHashMap();
    public function new(parent : java.awt.Frame, modal : Bool) {
        super(parent, modal);
        this.initComponents();
    }

    private function initComponents() : Void {
        angleIncrementJTextField = new javax.swing.JTextField();
        this.jLabel1 = new javax.swing.JLabel();
        this.totalRotationJTextField = new javax.swing.JTextField();
        this.jLabel2 = new javax.swing.JLabel();
        this.jPanel1 = new javax.swing.JPanel();
        this.jButton1 = new javax.swing.JButton();
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        this.angleIncrementJTextField.setText("36");
        this.jLabel1.setText("Angle Increment:");
        this.totalRotationJTextField.setText("360");
        this.jLabel2.setText("Total Angular Rotation:");
        this.jButton1.setText("OK");
        this.jButton1.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                jButton1ActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        var jPanel1Layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.jPanel1);
        this.jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(jPanel1Layout.createSequentialGroup().addGap(62, 62, 62).addComponent(jButton1).addContainerGap(62, Short.MAX_VALUE)));
        jPanel1Layout.setVerticalGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(jButton1));
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING).addComponent(jLabel1).addComponent(jLabel2)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(totalRotationJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE).addComponent(angleIncrementJTextField, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)).addContainerGap()).addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(angleIncrementJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel1)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED).addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(totalRotationJTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(jLabel2)).addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 16, Short.MAX_VALUE).addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap()));
        pack();
    }

    private function jButton1ActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.hashMap.put(Std.string(0), Std.string(this.angleIncrementJTextField.getText()));
            this.hashMap.put(Std.string(1), Std.string(this.totalRotationJTextField.getText()));
            ((cast this.getParent() : HashMapJDialogListenerInterface)).onHashMap(this.hashMap);
            this.setVisible(false);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.EXCEPTION, this, "jButton1ActionPerformed");
        }
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        java.awt.EventQueue.invokeLater(/* anonymous class body:
            public function run() : Void {
                var dialog : RotateJDialog = new RotateJDialog(new javax.swing.JFrame(), true);
                dialog.addWindowListener(/* anonymous class body:
                    public function windowClosing(e : java.awt.event.WindowEvent) : Void {
                        System.exit(0);
                    }

* / new java.awt.event.WindowAdapter());
                dialog.setVisible(true);
            }

*/ new ARunnable());
    }

    private var angleIncrementJTextField : javax.swing.JTextField = null;
    private var jButton1 : javax.swing.JButton = null;
    private var jLabel1 : javax.swing.JLabel = null;
    private var jLabel2 : javax.swing.JLabel = null;
    private var jPanel1 : javax.swing.JPanel = null;
    private var totalRotationJTextField : javax.swing.JTextField = null;
}

