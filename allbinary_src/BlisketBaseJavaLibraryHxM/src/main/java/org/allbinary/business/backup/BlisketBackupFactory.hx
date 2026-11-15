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
package org.allbinary.business.backup;

import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity;
import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory;
import org.allbinary.globals.PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.file.zip.ZipFileUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BlisketBackupFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : BlisketBackupFactory = new BlisketBackupFactory();
    public static function getInstance() : BlisketBackupFactory {
        return BlisketBackupFactory.instance;
    }

    private final stringUtil : StringUtil = StringUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final directory : Directory = Directory.getInstance();
    // throws Exception
    private function getFileBasicArrayList(pathString : String) : BasicArrayList {
        var path : AbPath = new AbPath(pathString, this.stringUtil.EMPTY_STRING);
        var file : AbFile = AbFile.createAbFileFromAbPath(path);
        return this.directory.search(file, true);
    }

    public function backup() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "backup()");
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getWebappPath());
            stringBuffer.append(PATH_GLOBALS.getInstance().BACKUP_PATH);
            var backupPath : String = stringBuffer.toString();
            var path : AbPath = new AbPath(backupPath, this.stringUtil.EMPTY_STRING);
            var fileBasicArrayList : BasicArrayList = this.getFileBasicArrayList(backupPath);
            this.backup(fileBasicArrayList, path.toFileSystemString() + "backup.zip");
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "backup()", e);
        }
    }

    public function backupViews() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "backupViews()");
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getWebappPath());
            stringBuffer.append(PATH_GLOBALS.getInstance().BACKUP_PATH);
            final backupPath : String = stringBuffer.toString();
            final path : AbPath = new AbPath(backupPath, this.stringUtil.EMPTY_STRING);
            final fileBasicArrayList : BasicArrayList = new BasicArrayListD();
            final storeFrontsEntity : StoreFrontsEntity = StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance();
            final storeFrontNamesBasicArrayList : BasicArrayList = storeFrontsEntity.getStoreFrontNames();
            final size : Int = storeFrontNamesBasicArrayList.size();
            var nextStore : String = null;
            var viewsPath : String = null;
            for (index in 0...size) {
                nextStore = (cast storeFrontNamesBasicArrayList.get(index) : String);
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(URLGLOBALS.getWebappPath());
                stringBuffer.append(PATH_GLOBALS.getInstance().VIEWS_PATH);
                stringBuffer.append(nextStore);
                viewsPath = stringBuffer.toString();
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append("Backup Store Views: ");
                stringBuffer.append(nextStore);
                stringBuffer.append(" from: ");
                stringBuffer.append(viewsPath);
                PreLogUtil.put(stringBuffer.toString(), this, "backupViews()");
                fileBasicArrayList.addAllList(this.getFileBasicArrayList(viewsPath));
            }
            this.backup(fileBasicArrayList, path.toFileSystemString() + "backupViews.zip");
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "backupViews()", e);
        }
    }

    public function backupResources() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "backupResources()");
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getWebappPath());
            stringBuffer.append(PATH_GLOBALS.getInstance().BACKUP_PATH);
            final backupPath : String = stringBuffer.toString();
            final path : AbPath = new AbPath(backupPath, this.stringUtil.EMPTY_STRING);
            final fileBasicArrayList : BasicArrayList = new BasicArrayListD();
            final storeFrontsEntity : StoreFrontsEntity = StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance();
            final storeFrontNamesBasicArrayList : BasicArrayList = storeFrontsEntity.getStoreFrontNames();
            final size : Int = storeFrontNamesBasicArrayList.size();
            var nextStore : String = null;
            var storeFrontInterface : StoreFrontInterface = null;
            var resourcesPath : String = null;
            for (index in 0...size) {
                nextStore = (cast storeFrontNamesBasicArrayList.get(index) : String);
                storeFrontInterface = storeFrontsEntity.getStoreFrontInterface(nextStore);
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(URLGLOBALS.getWebappPath());
                stringBuffer.append(storeFrontInterface.getCurrentHostNamePath());
                stringBuffer.append(storeFrontInterface.getCategoryPath());
                resourcesPath = stringBuffer.toString();
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append("Backup Store Resrouces: ");
                stringBuffer.append(nextStore);
                stringBuffer.append(" from: ");
                stringBuffer.append(resourcesPath);
                PreLogUtil.put(stringBuffer.toString(), this, "backupResources()");
                fileBasicArrayList.addAllList(this.getFileBasicArrayList(resourcesPath));
            }
            this.backup(fileBasicArrayList, path.toFileSystemString() + "backupResources.zip");
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "backupResources()", e);
        }
    }

    public function backupJsps() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "backupJsps()");
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getWebappPath());
            stringBuffer.append(PATH_GLOBALS.getInstance().BACKUP_PATH);
            final backupPath : String = stringBuffer.toString();
            final path : AbPath = new AbPath(backupPath, this.stringUtil.EMPTY_STRING);
            final fileBasicArrayList : BasicArrayList = new BasicArrayListD();
            final storeFrontsEntity : StoreFrontsEntity = StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance();
            final storeFrontNamesBasicArrayList : BasicArrayList = storeFrontsEntity.getStoreFrontNames();
            final size : Int = storeFrontNamesBasicArrayList.size();
            var nextStore : String = null;
            for (index in 0...size) {
                nextStore = (cast storeFrontNamesBasicArrayList.get(index) : String);
                PreLogUtil.put("Backup Store Jsps: " + nextStore, this, "backupJsps()");
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(URLGLOBALS.getWebappPath());
                stringBuffer.append(nextStore);
                fileBasicArrayList.addAllList(this.getFileBasicArrayList(stringBuffer.toString()));
            }
            this.backup(fileBasicArrayList, path.toFileSystemString() + "backupJsps.zip");
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "backupJsps()", e);
        }
    }

    public function backup(fileBasicArrayList : BasicArrayList, zipFile : String) : Void {
        try {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("ZipFile: ");
            stringBuffer.append(zipFile);
            stringBuffer.append(" BasicArrayList: ");
            stringBuffer.appendint(fileBasicArrayList.size());
            PreLogUtil.put("Creating Backup Zip File: " + stringBuffer.toString(), this, "backup()");
            ZipFileUtil.getInstance().create(zipFile, fileBasicArrayList);
            this.logUtil.putF("Created Backup Zip File", this, "backup()");
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "backup()", e);
        }
    }

    public function new() {
    }
}

