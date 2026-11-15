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
package org.allbinary.logic.system.os.android;

import android.content.Context;
import android.os.Build;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class AndroidSystemProperties {
    private static final SINGLETON : AndroidSystemProperties = new AndroidSystemProperties(ResourceUtil.getInstance().getContext());
    public static function getInstance() : AndroidSystemProperties {
        return AndroidSystemProperties.SINGLETON;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new(context : Context) {
    }

    public function getDeviceId() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function getDeviceSoftwareVersion() : String {
        return this.commonStrings.DISABLE;
    }

    public function getLine1Number() : String {
        return this.commonStrings.DISABLE;
    }

    public function getNetworkCountryIso() : String {
        return this.commonStrings.DISABLE;
    }

    public function getNetworkOperator() : String {
        return this.commonStrings.DISABLE;
    }

    public function getNetworkOperatorName() : String {
        return this.commonStrings.DISABLE;
    }

    public function getSimCountryIso() : String {
        return this.commonStrings.DISABLE;
    }

    public function getSimOperator() : String {
        return this.commonStrings.DISABLE;
    }

    public function getSimOperatorName() : String {
        return this.commonStrings.DISABLE;
    }

    public function getSimSerialNumber() : String {
        return this.commonStrings.DISABLE;
    }

    public function getSubscriberId() : String {
        return this.commonStrings.DISABLE;
    }

    public function getVoiceMailAlphaTag() : String {
        return this.commonStrings.DISABLE;
    }

    public function getVoiceMailNumber() : String {
        return this.commonStrings.DISABLE;
    }

    public function getNetworkType() : Int {
        return -1;
    }

    public function getPhoneType() : Int {
        return -1;
    }

    public function getBoard() : String {
        return Build.BOARD;
    }

    public function getBrand() : String {
        return Build.BRAND;
    }

    public function getDevice() : String {
        return Build.DEVICE;
    }

    public function getFingerprint() : String {
        return Build.FINGERPRINT;
    }

    public function getHost() : String {
        return Build.HOST;
    }

    public function getId() : String {
        return Build.ID;
    }

    public function getModel() : String {
        return Build.MODEL;
    }

    public function getProduct() : String {
        return Build.PRODUCT;
    }

    public function getTags() : String {
        return Build.TAGS;
    }

    public function getTime() : haxe.Int64 {
        return Build.TIME;
    }

    public function getType() : String {
        return Build.TYPE;
    }

    public function getUser() : String {
        return Build.USER;
    }

}

