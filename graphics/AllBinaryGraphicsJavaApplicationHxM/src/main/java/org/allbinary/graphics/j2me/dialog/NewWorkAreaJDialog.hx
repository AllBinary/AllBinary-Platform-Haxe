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

//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import javax.swing.*;
import org.allbinary.graphics.j2me.GraphicsException;
import org.allbinary.graphics.j2me.MyFrame;
import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel;
import org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface;

class NewWorkAreaJDialog extends javax.swing.JDialog {
    private var parent : MyFrame = null;
    private var dimension : Dimension = null;
    private var xSizeJTextField : JTextField = null;
    private var ySizeJTextField : JTextField = null;
    private var nameJTextField : JTextField = null;
    public function new(parent : MyFrame, modal : Bool, dimension : Dimension, newName : String) {
        super((cast parent : java.awt.Frame), modal);
        try {
            this.initComponents();
            this.parent = parent;
            this.xSizeJTextField = new JTextField("12");
            this.ySizeJTextField = new JTextField("12");
            this.nameJTextField = new JTextField(newName);
            this.dimension = dimension;
            var submitButton : JButton = new JButton("Ok");
            submitButton.addActionListener(/* anonymous class body:
                public function actionPerformed(evt : ActionEvent) : Void {
                    try {
                        disposeNewDialog();
                    } catch (e : haxe.Exception) {
                    }
                }

*/ new ActionListener());
            this.setSize(150, 100);
            this.getContentPane().setLayout(new GridLayout(5, 2));
            this.getContentPane().add(new JLabel("Please enter"));
            this.getContentPane().add(new JLabel(" the size."));
            this.getContentPane().add(new JLabel("Name:"));
            this.getContentPane().add(this.nameJTextField);
            this.getContentPane().add(new JLabel("X: "));
            this.getContentPane().add(this.xSizeJTextField);
            this.getContentPane().add(new JLabel("Y: "));
            this.getContentPane().add(this.ySizeJTextField);
            this.getContentPane().add(submitButton);
            this.show();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    private function disposeNewDialog() : Void {
        try {
            var canvasWidth : Null<Int> = this.xSizeJTextField.getText();
            var canvasHeight : Null<Int> = this.ySizeJTextField.getText();
            var newName : String = this.nameJTextField.getText();
            if (newName == null) {
                throw new GraphicsException("No Name", this, "disposeNewDialog");
            }
            var workAreaJPanel : WorkAreaJPanel = new WorkAreaJPanel(newName, this.dimension, Std.int(canvasWidth), Std.int(canvasHeight));
            workAreaJPanel.setLayout(new GridLayout(1, 1));
            this.parent.add((cast workAreaJPanel : WorkAreaJPanelInterface));
            this.dispose();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    private function initComponents() : Void {
        addWindowListener(/* anonymous class body:
            public function windowClosing(evt : java.awt.event.WindowEvent) : Void {
                closeDialog(evt);
            }

*/ new java.awt.event.WindowAdapter());
        pack();
    }

    private function closeDialog(evt : java.awt.event.WindowEvent) : Void {
        setVisible(false);
        dispose();
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        try {
            new NewWorkAreaJDialog(new MyFrame(), true, new Dimension(100, 100), "testing").show();
        } catch (e : haxe.Exception) {
        }
    }

}

