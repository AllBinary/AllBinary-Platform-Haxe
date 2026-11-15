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
package org.allbinary.business.advertisement;

import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.logic.system.security.licensing.LockedUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class Advertisements {
    private final bannerList : BasicArrayList = new BasicArrayListD();
    private final pageList : BasicArrayList = new BasicArrayListD();
    public function addPage(advertisementProcessorInterface : AdvertisementProcessorInterface) : Void {
        if (!this.pageList.contains(advertisementProcessorInterface)) {
            this.pageList.add(advertisementProcessorInterface);
        }
    }

    public function startRandomPage() : Void {
        var size : Int = this.pageList.size();
        if (size > 0) {
            var random : Int = this.myRandomFactory.getAbsoluteNextInt(size);
            var advertisementProcessorInterface : AdvertisementProcessorInterface = (cast this.pageList.objectArray[random] : AdvertisementProcessorInterface);
            advertisementProcessorInterface.start();
        }
    }

    private final myRandomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    public function processRandomPage() : Void {
        if (LockedUtil.getInstance().isLocked()) {
            var size : Int = this.pageList.size();
            if (size > 0) {
                var random : Int = this.myRandomFactory.getAbsoluteNextInt(size);
                var advertisementProcessorInterface : AdvertisementProcessorInterface = (cast this.pageList.objectArray[random] : AdvertisementProcessorInterface);
                advertisementProcessorInterface.process();
            }
        }
    }

    public function stopAllPage() : Void {
        {
            var index : Int = this.pageList.size();
            while (--index >= 0) {
            var advertisementProcessorInterface : AdvertisementProcessorInterface = (cast this.pageList.objectArray[index] : AdvertisementProcessorInterface);
            advertisementProcessorInterface.stop();
            }
        }
    }

    public function addBanner(advertisementProcessorInterface : AdvertisementProcessorInterface) : Void {
        if (!this.bannerList.contains(advertisementProcessorInterface)) {
            this.bannerList.add(advertisementProcessorInterface);
        }
    }

    public function startAll() : Void {
        {
            var index : Int = this.bannerList.size();
            while (--index >= 0) {
            var advertisementProcessorInterface : AdvertisementProcessorInterface = (cast this.bannerList.objectArray[index] : AdvertisementProcessorInterface);
            advertisementProcessorInterface.start();
            }
        }
    }

    public function stopAllBanner() : Void {
        {
            var index : Int = this.bannerList.size();
            while (--index >= 0) {
            var advertisementProcessorInterface : AdvertisementProcessorInterface = (cast this.bannerList.objectArray[index] : AdvertisementProcessorInterface);
            advertisementProcessorInterface.stop();
            }
        }
    }

    public function getBanner(index : Int) : AdvertisementProcessorInterface {
        var advertisementProcessorInterface : AdvertisementProcessorInterface = (cast this.bannerList.objectArray[index] : AdvertisementProcessorInterface);
        return advertisementProcessorInterface;
    }

    public function stopAll() : Void {
        this.stopAllBanner();
        this.stopAllPage();
    }

    public function new() {
    }
}

