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
package org.allbinary.input.automation.module.osgi;

//import java.io.File;
//import java.io.FileFilter;
//import java.io.FileInputStream;
//import java.net.URL;
//import java.util.HashMap;
//import java.util.Set;
//import java.util.jar.JarInputStream;
//import java.util.jar.Manifest;
import org.osgi.framework.Bundle;
import org.osgi.framework.BundleContext;
import org.osgi.framework.Constants;
import bundle.input.automation.InputAutomationBundleActivator;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.logic.io.file.directory.SubDirectory;
import org.allbinary.logic.io.file.filter.BasicFileFilterUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.RunnableInterface;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class InputAutomationNewBundleRunnable implements RunnableInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private static final FILE : String = "file:";
    private static final JAR_DIR_PROP : String = "org.knopflerfish.gosg.jars";
    private static final INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH : String = "ia/auto";
    private static final MODULES_START_LEVEL : Int = 8;
    private final inputAutomationBundleActivator : InputAutomationBundleActivator;
    private var running : Bool = false;
    private var fileBasicArrayList : BasicArrayList;
    public function new(inputAutomationBundleActivator : InputAutomationBundleActivator) {
        this.inputAutomationBundleActivator = inputAutomationBundleActivator;
        this.fileBasicArrayList = new BasicArrayListD();
    }

    // throws Exception
    public function setThread(thread : Thread) : Void {
    }

    // synchronized
    public function isRunning() : Bool {
        return this.running;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
        this.running = running;
    }

    // throws Exception
    private function updateModules() : Void {
        this.logUtil.putF(this.commonStrings.START, this, "updateModules");
        final list : BasicArrayList = this.findNewModules();
        final size : Int = list.size();
        var bundle : Bundle = null;
        for (index in 0...size) {
            bundle = this.install((cast list.get(index) : URL));
            if (bundle != null) {
                bundle.start(InputAutomationNewBundleRunnable.MODULES_START_LEVEL);
            }
        }
    }

    // throws Exception
    private function getAllJarSymbolicNameHashMap() : HashMap {
        this.logUtil.putF(this.commonStrings.START, this, "getAllJarSymbolicNameHashMap");
        final hashMap : HashMap = StdUtil.getInstance().createHashMap();
        final jarFileBasicArrayList : BasicArrayList = this.getJarModuleFileBasicArrayList();
        this.logUtil.putF("Jar Module Files: " + jarFileBasicArrayList, this, "getAllJarSymbolicNameHashMap");
        final size : Int = jarFileBasicArrayList.size();
        var file : File = null;
        for (index in 0...size) {
            file = (cast jarFileBasicArrayList.get(index) : File);
            if (!file.isDirectory()) {
                final fileInputStream : FileInputStream = new FileInputStream(file);
                final jarInputStream : JarInputStream = new JarInputStream(fileInputStream);
                final manifest : Manifest = jarInputStream.getManifest();
                if (manifest == null) {
                } else {
                    var symbolicName : String = manifest.getMainAttributes().getValue(Constants.BUNDLE_SYMBOLICNAME);
                    if (symbolicName != null) {
                        hashMap.put(symbolicName, new URL(InputAutomationNewBundleRunnable.FILE + file.getAbsolutePath()));
                    }
                }
            }
        }
        return hashMap;
    }

    private function getJarModuleFileBasicArrayList() : BasicArrayList {
        this.logUtil.putF(this.commonStrings.START, this, "getJarModuleFileBasicArrayList");
        var baseJarPath : String = System.getProperty(JAR_DIR_PROP);
        if (StringTools.startsWith(baseJarPath, InputAutomationNewBundleRunnable.FILE)) {
            baseJarPath = baseJarPath.substring(InputAutomationNewBundleRunnable.FILE.length());
        }
        var jarFileFilter : FileFilter = BasicFileFilterUtil.getInstance(".jar");
        var path : String = baseJarPath + InputAutomationNewBundleRunnable.INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH;
        this.logUtil.putF("Path: " + path, this, "getJarModuleFileBasicArrayList");
        var file : File = new File(path);
        this.logUtil.putF("File: " + file.getAbsolutePath() + " isDirectory: " + file.isDirectory(), this, "getJarModuleFileBasicArrayList");
        return SubDirectory.getInstance().search(jarFileFilter, FileWrapperUtil.wrapFile(file));
    }

    // throws Exception
    private function getInstalledJarSymbolicNameBasicArrayList() : BasicArrayList {
        this.logUtil.putF(this.commonStrings.START, this, "getInstalledJarSymbolicNameBasicArrayList");
        var vector : BasicArrayList = new BasicArrayListD();
        var bundleContext : BundleContext = InputAutomationBundleActivator.getBundleContext();
        var bundleArray : haxe.ds.Vector<Bundle> = bundleContext.getBundles();
        if (bundleArray != null) {
            this.logUtil.putF("bundleArray: " + bundleArray.length, this, "getInputAutomationModuleServices");
            for (index in 0...bundleArray.length) {
                var bundle : Bundle = bundleArray[index];
                vector.add(bundle.getSymbolicName());
            }
        }
        return vector;
    }

    // throws Exception
    private function isInstalled(symbolicName : String) : Bool {
        this.logUtil.putF(CommonLabels.getInstance().START + symbolicName, this, "isInstalled");
        final list : BasicArrayList = this.getInstalledJarSymbolicNameBasicArrayList();
        final size : Int = list.size();
        var nextSymbolicName : String = null;
        for (index in 0...size) {
            nextSymbolicName = (cast list.get(index) : String);
            if (Reflect.compare(nextSymbolicName, symbolicName) == 0) {
                return true;
            }
        }
        return false;
    }

    // throws Exception
    private function findNewModules() : BasicArrayList {
        this.logUtil.putF(this.commonStrings.START, this, "findNewModules");
        var vector : BasicArrayList = new BasicArrayListD();
        var hashMap : HashMap = this.getAllJarSymbolicNameHashMap();
        this.logUtil.putF("All: " + hashMap, this, "findNewModules");
        var set : Set = hashMap.keySet();
        final symbolicNameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = symbolicNameArray.length;
        for (index in 0...size) {
            var symbolicName : String = (cast symbolicNameArray[index] : String);
            if (!this.isInstalled(symbolicName)) {
                vector.add(hashMap.get(symbolicName));
            }
        }
        return vector;
    }

    // throws Exception
    private function install(url : URL) : Bundle {
        this.logUtil.putF(CommonLabels.getInstance().START + url, this, "install");
        var bundleContext : BundleContext = InputAutomationBundleActivator.getBundleContext();
        return bundleContext.installBundle(url.toString());
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            while (this.isRunning()) {
                timeHelper.setStartTimeTNT();
                this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT(), this, this.commonStrings.RUN);
                this.updateModules();
                break;
            }
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

