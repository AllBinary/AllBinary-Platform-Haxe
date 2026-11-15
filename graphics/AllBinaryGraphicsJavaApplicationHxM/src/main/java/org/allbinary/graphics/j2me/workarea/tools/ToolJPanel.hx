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
package org.allbinary.graphics.j2me.workarea.tools;


class ToolJPanel extends javax.swing.JPanel {
    public function new() {
        super();
        this.initComponents();
    }

    private function initComponents() : Void {
        lineJButton = new javax.swing.JButton();
        this.rectJButton = new javax.swing.JButton();
        this.arcJButton = new javax.swing.JButton();
        this.stringJButton = new javax.swing.JButton();
        this.charJButton = new javax.swing.JButton();
        this.roundRectJButton = new javax.swing.JButton();
        this.imageJButton = new javax.swing.JButton();
        this.fillArcJButton = new javax.swing.JButton();
        this.fillRectJButton = new javax.swing.JButton();
        this.fillRoundRectJButton = new javax.swing.JButton();
        this.dottedLineJButton = new javax.swing.JButton();
        this.dottedRectButton = new javax.swing.JButton();
        this.dottedArcJButton = new javax.swing.JButton();
        this.dottedFillRectJButton = new javax.swing.JButton();
        this.dottedFillArcJButton = new javax.swing.JButton();
        this.dottedFillRountRectJButton = new javax.swing.JButton();
        this.colorJPanel = new javax.swing.JPanel();
        this.colorJList = new javax.swing.JList();
        this.setLayout(new java.awt.GridLayout(17, 1));
        lineJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        lineJButton.setText(LinesGraphicItem.getStaticName());
        lineJButton.addMouseListener(/* anonymous class body:
            public function mouseClicked(evt : java.awt.event.MouseEvent) : Void {
                lineJButtonMouseClicked(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.lineJButton);
        this.rectJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.rectJButton.setText("Rect");
        this.rectJButton.addMouseListener(/* anonymous class body:
            public function mouseClicked(evt : java.awt.event.MouseEvent) : Void {
                rectJButtonMouseClicked(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.rectJButton);
        this.arcJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.arcJButton.setText("Arc");
        this.arcJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                arcJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.arcJButton);
        this.stringJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.stringJButton.setText("String");
        this.stringJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                stringJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.stringJButton);
        this.charJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.charJButton.setText("Char");
        this.charJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                charJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.charJButton);
        this.roundRectJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.roundRectJButton.setText("Round Rect");
        this.roundRectJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                roundRectJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.roundRectJButton);
        this.imageJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.imageJButton.setText("Image");
        this.imageJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                imageJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.imageJButton);
        this.fillArcJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.fillArcJButton.setText("Fill Arc");
        this.fillArcJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                fillArcJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.fillArcJButton);
        this.fillRectJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.fillRectJButton.setText("Fill Rect");
        this.fillRectJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                fillRectJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.fillRectJButton);
        this.fillRoundRectJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.fillRoundRectJButton.setText("Fill Rnd Rect");
        this.fillRoundRectJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                fillRoundRectJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.fillRoundRectJButton);
        this.dottedLineJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.dottedLineJButton.setText("Dot Line");
        this.dottedLineJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                dottedLineJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.dottedLineJButton);
        this.dottedRectButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.dottedRectButton.setText("Dot Rect");
        this.dottedRectButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                dottedRectButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.dottedRectButton);
        this.dottedArcJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.dottedArcJButton.setText("Dot Arc");
        this.dottedArcJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                dottedArcJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.dottedArcJButton);
        this.dottedFillRectJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.dottedFillRectJButton.setText("Dot Fill Rect");
        this.dottedFillRectJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                dottedFillRectJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.dottedFillRectJButton);
        this.dottedFillArcJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.dottedFillArcJButton.setText("Dot Fill Arc");
        this.dottedFillArcJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                dottedFillArcJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.dottedFillArcJButton);
        this.dottedFillRountRectJButton.setFont(new java.awt.Font("Dialog", 0, 10));
        this.dottedFillRountRectJButton.setText("Dot Fill Rnd Rect");
        this.dottedFillRountRectJButton.addMouseListener(/* anonymous class body:
            public function mousePressed(evt : java.awt.event.MouseEvent) : Void {
                dottedFillRountRectJButtonMousePressed(evt);
            }

*/ new java.awt.event.MouseAdapter());
        add(this.dottedFillRountRectJButton);
        this.colorJPanel.setLayout(new java.awt.GridLayout(1, 1));
        this.colorJPanel.add(this.colorJList);
        add(this.colorJPanel);
    }

    private function dottedFillRountRectJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.dottedFillRountRectJButton.getText());
    }

    private function dottedFillArcJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.dottedFillArcJButton.getText());
    }

    private function dottedFillRectJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.dottedFillRectJButton.getText());
    }

    private function dottedArcJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.dottedArcJButton.getText());
    }

    private function dottedRectButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.dottedRectButton.getText());
    }

    private function dottedLineJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.dottedLineJButton.getText());
    }

    private function fillRoundRectJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.fillRoundRectJButton.getText());
    }

    private function fillRectJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.fillRectJButton.getText());
    }

    private function fillArcJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.fillArcJButton.getText());
    }

    private function imageJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.imageJButton.getText());
    }

    private function roundRectJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.roundRectJButton.getText());
    }

    private function charJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.charJButton.getText());
    }

    private function stringJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.stringJButton.getText());
    }

    private function arcJButtonMousePressed(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.arcJButton.getText());
    }

    private function rectJButtonMouseClicked(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.rectJButton.getText());
    }

    private function lineJButtonMouseClicked(evt : java.awt.event.MouseEvent) : Void {
        ToolFactory.getInstance().setSelectedTool(this.lineJButton.getText());
    }

    private var arcJButton : javax.swing.JButton = null;
    private var charJButton : javax.swing.JButton = null;
    private var colorJList : javax.swing.JList = null;
    private var colorJPanel : javax.swing.JPanel = null;
    private var dottedArcJButton : javax.swing.JButton = null;
    private var dottedFillArcJButton : javax.swing.JButton = null;
    private var dottedFillRectJButton : javax.swing.JButton = null;
    private var dottedFillRountRectJButton : javax.swing.JButton = null;
    private var dottedLineJButton : javax.swing.JButton = null;
    private var dottedRectButton : javax.swing.JButton = null;
    private var fillArcJButton : javax.swing.JButton = null;
    private var fillRectJButton : javax.swing.JButton = null;
    private var fillRoundRectJButton : javax.swing.JButton = null;
    private var imageJButton : javax.swing.JButton = null;
    private var lineJButton : javax.swing.JButton = null;
    private var rectJButton : javax.swing.JButton = null;
    private var roundRectJButton : javax.swing.JButton = null;
    private var stringJButton : javax.swing.JButton = null;
}

