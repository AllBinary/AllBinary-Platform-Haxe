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
package org.allbinary.input.automation;

import org.allbinary.thread.ARunnable;
//import java.net.URI;
//import java.net.URL;
//import java.awt.Desktop;
//import java.util.List;
//import javax.swing.ImageIcon;
//import javax.swing.JDialog;
//import javax.help.HelpSet;
//import javax.help.event.HelpSetEvent;
//import javax.help.event.HelpSetListener;
import bundle.input.automation.InputAutomationBundleActivatorListenerInterface;
import bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener;
import bundle.input.automation.robot.InputAutomationRobotChangeListener;
import org.allbinary.globals.AppUrlGlobals;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.gui.dialog.BasicTextJDialog;
import org.allbinary.gui.swing.workers.JListSwingWorker;
import org.allbinary.input.automation.configuration.InputAutomationConfiguration;
import org.allbinary.input.automation.configuration.InputAutomationConfigurationFactory;
import org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent;
import org.allbinary.input.automation.module.InputAutomationModuleFactoryFactory;
import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;
import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration;
import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations;
import org.allbinary.input.automation.osgi.DesktopBundle;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.osgi.InputAutomationRobotChangeEvent;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.java.help.JavaHelpUtil;
import org.allbinary.logic.system.loader.WebappClassLoaderInfo;
import org.allbinary.logic.system.security.licensing.InputAutomationClientInformationFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.RunnableInterface;

class InputAutomationJFrame extends javax.swing.JFrame implements InputAutomationConfigurationModuleChangeListener implements InputAutomationRobotChangeListener implements HelpSetListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var inputAutomationModuleConfigurations : InputAutomationModuleConfigurations = new InputAutomationModuleConfigurations();
    private var inputAutomationModuleFactory : InputAutomationModuleFactoryFactory = null;
    private var inputAutomationModuleInterface : InputAutomationModuleFactoryInterface = null;
    private var runnableInterface : RunnableInterface = null;
    private var thread : Thread = null;
    private var helpSet : HelpSet;
    private final uri : URI = new URI("http://geocities.com/allbinary/");
    public function new() {
        super();
        this.initComponents();
        var url : URL = Type.getClass(this).getResource("/help/Help.hs");
        this.logUtil.putF("URL: " + url, this, this.commonStrings.CONSTRUCTOR);
        this.helpSet = JavaHelpUtil.getInstance().getHelpSet(url);
        url = Type.getClass(this).getResource("/resources/allbinaryicon8bit.jpg");
        final imageIcon : ImageIcon = new ImageIcon(url);
        this.setIconImage(imageIcon.getImage());
        this.init();
    }

    public function helpSetAdded(helpSetEvent : HelpSetEvent) : Void {
        this.helpSet.add(helpSetEvent.getHelpSet());
    }

    public function helpSetRemoved(helpSetEvent : HelpSetEvent) : Void {
        this.helpSet.remove(helpSetEvent.getHelpSet());
    }

    // throws Exception
    private function init() : Void {
        final inputAutomationConfigurationFactory : InputAutomationConfigurationFactory = InputAutomationConfigurationFactory.getInstance();
        inputAutomationConfigurationFactory.init(InputAutomationClientInformationFactory.getInstance());
        final inputAutomationModuleConfigurationList : List<InputAutomationModuleConfiguration> = inputAutomationConfigurationFactory.inputAutomationConfiguration.getInputAutomationModuleConfigurationList();
        if (inputAutomationModuleConfigurationList == null) {
        } else {
            this.inputAutomationModuleConfigurations = new InputAutomationModuleConfigurations(inputAutomationModuleConfigurationList);
        }
        this.inputAutomationModuleFactory = new InputAutomationModuleFactoryFactory(inputAutomationModuleConfigurations, this);
        (new JListSwingWorker(this.inputAutomationModuleJList, this.inputAutomationModuleFactory.getListModel())).execute();
        this.gameRobotJTabbedPane.setEnabledAt(1, false);
        this.gameRobotJTabbedPane.setSelectedIndex(0);
    }

    private function initComponents() : Void {
        this.noModuleSelectedJDialog = new javax.swing.JDialog();
        this.noModuleSelectedJLabel = new javax.swing.JLabel();
        this.gameRobotJTabbedPane = new javax.swing.JTabbedPane();
        this.inputAutomationModuleJPanel = new javax.swing.JPanel();
        this.jScrollPane1 = new javax.swing.JScrollPane();
        this.inputAutomationModuleJList = new javax.swing.JList();
        this.automationModuleConfigurationJPanel = new javax.swing.JPanel();
        this.mainJMenuBar = new javax.swing.JMenuBar();
        this.processingJMenu = new javax.swing.JMenu();
        this.startJMenuItem = new javax.swing.JMenuItem();
        this.stopJMenuItem = new javax.swing.JMenuItem();
        this.optionsJMenu = new javax.swing.JMenu();
        this.stopOnFocusJCheckBoxMenuItem = new javax.swing.JCheckBoxMenuItem();
        this.toolsJMenu = new javax.swing.JMenu();
        this.helpJMenuItem = new javax.swing.JMenuItem();
        this.updatesJMenuItem = new javax.swing.JMenuItem();
        this.subscriptionJMenuItem = new javax.swing.JMenuItem();
        this.modulesJMenuItem = new javax.swing.JMenuItem();
        this.aboutJMenuItem = new javax.swing.JMenuItem();
        this.noModuleSelectedJDialog.setMinimumSize(new java.awt.Dimension(200, 100));
        this.noModuleSelectedJLabel.setText("Please Select A Module");
        var noModuleSelectedJDialogLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.noModuleSelectedJDialog.getContentPane());
        this.noModuleSelectedJDialog.getContentPane().setLayout(noModuleSelectedJDialogLayout);
        noModuleSelectedJDialogLayout.setHorizontalGroup(noModuleSelectedJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(noModuleSelectedJDialogLayout.createSequentialGroup().addContainerGap().addComponent(noModuleSelectedJLabel).addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        noModuleSelectedJDialogLayout.setVerticalGroup(noModuleSelectedJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(noModuleSelectedJLabel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 48, Short.MAX_VALUE));
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        this.setMinimumSize(new java.awt.Dimension(325, 215));
        setResizable(false);
        addWindowFocusListener(/* anonymous class body:
            public function windowGainedFocus(evt : java.awt.event.WindowEvent) : Void {
                formWindowGainedFocus(evt);
            }

            public function windowLostFocus(evt : java.awt.event.WindowEvent) : Void {
                formWindowLostFocus(evt);
            }

*/ new java.awt.event.WindowFocusListener());
        addFocusListener(/* anonymous class body:
            public function focusGained(evt : java.awt.event.FocusEvent) : Void {
                formFocusGained(evt);
            }

            public function focusLost(evt : java.awt.event.FocusEvent) : Void {
                formFocusLost(evt);
            }

*/ new java.awt.event.FocusAdapter());
        this.gameRobotJTabbedPane.setMinimumSize(new java.awt.Dimension(320, 200));
        this.inputAutomationModuleJList.setMinimumSize(new java.awt.Dimension(200, 0));
        this.inputAutomationModuleJList.addListSelectionListener(/* anonymous class body:
            public function valueChanged(evt : javax.swing.event.ListSelectionEvent) : Void {
                inputAutomationModuleJListValueChanged(evt);
            }

*/ new javax.swing.event.ListSelectionListener());
        this.jScrollPane1.setViewportView(this.inputAutomationModuleJList);
        var inputAutomationModuleJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.inputAutomationModuleJPanel);
        this.inputAutomationModuleJPanel.setLayout(inputAutomationModuleJPanelLayout);
        inputAutomationModuleJPanelLayout.setHorizontalGroup(inputAutomationModuleJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(inputAutomationModuleJPanelLayout.createSequentialGroup().addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 199, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap(367, Short.MAX_VALUE)));
        inputAutomationModuleJPanelLayout.setVerticalGroup(inputAutomationModuleJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(inputAutomationModuleJPanelLayout.createSequentialGroup().addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 330, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        this.gameRobotJTabbedPane.addTab("Modules", inputAutomationModuleJPanel);
        var automationModuleConfigurationJPanelLayout : javax.swing.GroupLayout = new javax.swing.GroupLayout(this.automationModuleConfigurationJPanel);
        this.automationModuleConfigurationJPanel.setLayout(automationModuleConfigurationJPanelLayout);
        automationModuleConfigurationJPanelLayout.setHorizontalGroup(automationModuleConfigurationJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 566, Short.MAX_VALUE));
        automationModuleConfigurationJPanelLayout.setVerticalGroup(automationModuleConfigurationJPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 334, Short.MAX_VALUE));
        this.gameRobotJTabbedPane.addTab("Configuration", automationModuleConfigurationJPanel);
        this.processingJMenu.setText("Processing");
        this.processingJMenu.setToolTipText("Set module processing state");
        this.startJMenuItem.setText(this.commonStrings.START);
        this.startJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                startJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.startJMenuItem);
        this.stopJMenuItem.setText("Stop");
        this.stopJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                stopJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.processingJMenu.add(this.stopJMenuItem);
        this.mainJMenuBar.add(this.processingJMenu);
        this.optionsJMenu.setText("Options");
        this.optionsJMenu.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                optionsJMenuActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.stopOnFocusJCheckBoxMenuItem.setSelected(true);
        this.stopOnFocusJCheckBoxMenuItem.setEnabled(false);
        this.stopOnFocusJCheckBoxMenuItem.setLabel("Stop Module On Focus");
        this.stopOnFocusJCheckBoxMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                stopOnFocusJCheckBoxMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.optionsJMenu.add(this.stopOnFocusJCheckBoxMenuItem);
        this.mainJMenuBar.add(this.optionsJMenu);
        this.toolsJMenu.setText("Help");
        this.helpJMenuItem.setText("Help");
        this.helpJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                helpJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.toolsJMenu.add(this.helpJMenuItem);
        this.updatesJMenuItem.setText("Updates");
        this.updatesJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                updatesJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.toolsJMenu.add(this.updatesJMenuItem);
        this.subscriptionJMenuItem.setText("Subscription");
        this.subscriptionJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                subscriptionJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.toolsJMenu.add(this.subscriptionJMenuItem);
        this.modulesJMenuItem.setText("Module Manager");
        this.modulesJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                modulesJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.toolsJMenu.add(this.modulesJMenuItem);
        this.aboutJMenuItem.setText("About");
        this.aboutJMenuItem.addActionListener(/* anonymous class body:
            public function actionPerformed(evt : java.awt.event.ActionEvent) : Void {
                aboutJMenuItemActionPerformed(evt);
            }

*/ new java.awt.event.ActionListener());
        this.toolsJMenu.add(this.aboutJMenuItem);
        this.mainJMenuBar.add(this.toolsJMenu);
        setJMenuBar(this.mainJMenuBar);
        var layout : javax.swing.GroupLayout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(gameRobotJTabbedPane, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 571, Short.MAX_VALUE));
        layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(gameRobotJTabbedPane, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 359, Short.MAX_VALUE));
        pack();
    }

    private function subscriptionJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            Desktop.getDesktop().browse(this.uri);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "subscriptionJMenuItemActionPerformed", e);
        }
    }

    private function updatesJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            Desktop.getDesktop().browse(this.uri);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "updatesJMenuItemActionPerformed", e);
        }
    }

    private function aboutJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        var textJDialog : JDialog = new BasicTextJDialog("Copyright (c) 2002-2007 AllBinary");
        textJDialog.setVisible(true);
        textJDialog.setLocationRelativeTo(this);
    }

    private function modulesJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            new DesktopBundle().start();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "modulesJMenuItemActionPerformed", e);
        }
    }

    private function helpJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        JavaHelpUtil.getInstance().show(this.helpSet);
    }

    private function stopOnFocusJCheckBoxMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function optionsJMenuActionPerformed(evt : java.awt.event.ActionEvent) : Void {
    }

    private function formWindowLostFocus(evt : java.awt.event.WindowEvent) : Void {
        this.logUtil.putF("Nothing", this, "focusLost");
    }

    private function formWindowGainedFocus(evt : java.awt.event.WindowEvent) : Void {
        if (this.stopOnFocusJCheckBoxMenuItem.isSelected()) {
            this.logUtil.putF("Stopping", this, "focusGained");
            if (this.runnableInterface != null) {
                this.runnableInterface.setRunning(false);
            }
        }
    }

    private function formFocusLost(evt : java.awt.event.FocusEvent) : Void {
    }

    private function formFocusGained(evt : java.awt.event.FocusEvent) : Void {
    }

    private function inputAutomationModuleJListValueChanged(evt : javax.swing.event.ListSelectionEvent) : Void {
        try {
            var gameAutomationRobotModuleNameString : String = (cast this.inputAutomationModuleJList.getSelectedValue() : String);
            if (gameAutomationRobotModuleNameString != null) {
                this.inputAutomationModuleInterface = this.inputAutomationModuleFactory.getInstance(gameAutomationRobotModuleNameString);
                this.getAutomationModuleConfigurationJPanel().removeAll();
                var layout : javax.swing.GroupLayout = (cast this.getAutomationModuleConfigurationJPanel().getLayout() : javax.swing.GroupLayout);
                layout.setHorizontalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 395, Short.MAX_VALUE).addComponent(this.inputAutomationModuleInterface.getConfigurationJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
                layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGap(0, 256, Short.MAX_VALUE).addComponent(this.inputAutomationModuleInterface.getConfigurationJPanel(), javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE));
                this.gameRobotJTabbedPane.setEnabledAt(1, true);
                this.logUtil.putF("Setting Module: " + gameAutomationRobotModuleNameString + " and Configuration JPanel", this, "gameAutomationRobotModuleJListValueChanged");
            } else {
                this.logUtil.putF("Module name was null", this, "gameAutomationRobotModuleJListValueChanged");
                this.gameRobotJTabbedPane.setEnabledAt(1, false);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "gameAutomationRobotModuleJListValueChanged", e);
        }
    }

    private function stopJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        if (this.runnableInterface != null) {
            this.runnableInterface.setRunning(false);
        } else {
            this.noModuleSelectedJDialog.setVisible(true);
            this.noModuleSelectedJDialog.setLocationRelativeTo(this);
        }
    }

    private function startJMenuItemActionPerformed(evt : java.awt.event.ActionEvent) : Void {
        try {
            this.logUtil.putF("Starting", this, "startJMenuItemActionPerformed");
            if (this.inputAutomationModuleInterface != null) {
                this.runnableInterface = this.inputAutomationModuleInterface.getInstance();
                if (this.runnableInterface != null) {
                    this.thread = new Thread(this.runnableInterface);
                    this.thread.setPriority(Thread.MIN_PRIORITY + 1);
                    this.thread.start();
                } else {
                    this.logUtil.putF("Runnnable was null", this, "startJMenuItemActionPerformed");
                    this.noModuleSelectedJDialog.setVisible(true);
                    this.noModuleSelectedJDialog.setLocationRelativeTo(this);
                }
            } else {
                this.logUtil.putF("InputAutomationModuleInterface was null", this, "startJMenuItemActionPerformed");
                this.noModuleSelectedJDialog.setVisible(true);
                this.noModuleSelectedJDialog.setLocationRelativeTo(this);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "startJMenuItemActionPerformed", e);
        }
    }

    private static var INPUTAUTOMATION_JFRAME : InputAutomationJFrame = null;
    public static function getInstance() : InputAutomationJFrame {
        return InputAutomationJFrame.INPUTAUTOMATION_JFRAME;
    }

    public static function destroy() : Void {
        InputAutomationJFrame.INPUTAUTOMATION_JFRAME.setVisible(false);
    }

    public static function create(inputAutomationBundleActivatorListenerInterface : InputAutomationBundleActivatorListenerInterface) : Void {
        LogConfigTypeFactory.getInstance();
        final appUrlGlobals : AppUrlGlobals = new AppUrlGlobals();
        appUrlGlobals.setWebappPath("G:/mnt/bc/mydev/work_automation/automation/run/");
        URLGLOBALS.init(appUrlGlobals);
        WebappClassLoaderInfo.setLoader(Type.getClass(appUrlGlobals).getClassLoader());
        java.awt.EventQueue.invokeLater(/* anonymous class body:
            public function run() : Void {
                final logUtil : LogUtil = LogUtil.getInstance();
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                try {
                    logUtil.putF("Running", this, commonStrings.RUN);
                    INPUTAUTOMATION_JFRAME = new InputAutomationJFrame();
                    InputRobotFactory.getInstance().addListener(InputAutomationJFrame.getInstance());
                    if (inputAutomationBundleActivatorListenerInterface != null) {
                        inputAutomationBundleActivatorListenerInterface.registerAsService();
                        inputAutomationBundleActivatorListenerInterface.useServices();
                    }
                    INPUTAUTOMATION_JFRAME.setVisible(true);
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

*/ new ARunnable());
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        InputAutomationJFrame.create(null);
    }

    public function getAutomationModuleConfigurationJPanel() : javax.swing.JPanel {
        return this.automationModuleConfigurationJPanel;
    }

    public function setAutomationModuleConfigurationJPanel(automationModuleConfigurationJPanel : javax.swing.JPanel) : Void {
        this.automationModuleConfigurationJPanel = automationModuleConfigurationJPanel;
    }

    public function onAdd(inputAutomationRobotChangeEvent : InputAutomationRobotChangeEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "onAdd");
            InputRobotFactory.getInstance().add(inputAutomationRobotChangeEvent.getInputAutomationRobotInterfaceWrapper().getInputRobotInterface());
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onAdd", e);
        }
    }

    public function onRemove(inputAutomationRobotChangeEvent : InputAutomationRobotChangeEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "onRemove");
            InputRobotFactory.getInstance().add(inputAutomationRobotChangeEvent.getInputAutomationRobotInterfaceWrapper().getInputRobotInterface());
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onRemove", e);
        }
    }

    public function onAdd(inputAutomationConfigurationChangeEvent : InputAutomationConfigurationModuleChangeEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "onAdd");
            this.inputAutomationModuleConfigurations.add(inputAutomationConfigurationChangeEvent.getInputAutomationModuleConfiguration());
            this.init();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onAdd", e);
        }
    }

    public function onRemove(inputAutomationConfigurationChangeEvent : InputAutomationConfigurationModuleChangeEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "onRemove");
            final inputAutomationConfiguration : InputAutomationConfiguration = InputAutomationConfigurationFactory.getInstance().inputAutomationConfiguration;
            final inputAutomationModuleConfigurationList : java.util.List<InputAutomationModuleConfiguration> = inputAutomationConfiguration.getInputAutomationModuleConfigurationList();
            if (inputAutomationModuleConfigurationList == null) {
                final logUtil : LogUtil = LogUtil.getInstance();
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.putF("inputAutomationModuleConfigurationList: " + inputAutomationModuleConfigurationList, this, commonStrings.INIT);
                throw new haxe.Exception();
            }
            final inputAutomationModuleConfigurations : InputAutomationModuleConfigurations = new InputAutomationModuleConfigurations(inputAutomationConfiguration.getInputAutomationModuleConfigurationList());
            inputAutomationModuleConfigurations.remove(inputAutomationConfigurationChangeEvent.getInputAutomationModuleConfiguration());
            this.init();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onRemove", e);
        }
    }

    private var aboutJMenuItem : javax.swing.JMenuItem = null;
    private var automationModuleConfigurationJPanel : javax.swing.JPanel = null;
    private var gameRobotJTabbedPane : javax.swing.JTabbedPane = null;
    private var helpJMenuItem : javax.swing.JMenuItem = null;
    private var inputAutomationModuleJList : javax.swing.JList = null;
    private var inputAutomationModuleJPanel : javax.swing.JPanel = null;
    private var jScrollPane1 : javax.swing.JScrollPane = null;
    private var mainJMenuBar : javax.swing.JMenuBar = null;
    private var modulesJMenuItem : javax.swing.JMenuItem = null;
    private var noModuleSelectedJDialog : javax.swing.JDialog = null;
    private var noModuleSelectedJLabel : javax.swing.JLabel = null;
    private var optionsJMenu : javax.swing.JMenu = null;
    private var processingJMenu : javax.swing.JMenu = null;
    private var startJMenuItem : javax.swing.JMenuItem = null;
    private var stopJMenuItem : javax.swing.JMenuItem = null;
    private var stopOnFocusJCheckBoxMenuItem : javax.swing.JCheckBoxMenuItem = null;
    private var subscriptionJMenuItem : javax.swing.JMenuItem = null;
    private var toolsJMenu : javax.swing.JMenu = null;
    private var updatesJMenuItem : javax.swing.JMenuItem = null;
}

