/**
 *  Copyright (C) 2010 Cloud.com, Inc.  All rights reserved.
 * 
 * This software is licensed under the GNU General License v3 or later.
 * 
 * It is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General License as published by
 * the Free Software Foundation, either version 3 of the License, or any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General License for more details.
 * 
 * You should have received a copy of the GNU General License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 */
package com.cloud.api.response;

import java.util.Date;

import com.cloud.serializer.Param;
import com.google.gson.annotations.SerializedName;

public class ExtractResponse extends BaseResponse {
    @SerializedName("id") @Param(description="the id of extracted object")
    private long id;
    
    @SerializedName("name") @Param(description="the name of the extracted object")
    private String name;
    
    //FIXME - add description
    @SerializedName("uploadpercentage")
    private int uploadPercent;
    
    //FIXME - add description
    @SerializedName("uploadstatus")
    private String uploadStatus;
    
    @SerializedName("accountid") @Param(description="the account id to which the extracted object belongs")
    private long accountId;    
 
    @SerializedName("resultstring") @Param(description="")
    private String resultString;    

    @SerializedName("created") @Param(description="the time and date the object was created")
    private Date createdDate;

    @SerializedName("state") @Param(description="the state of the extracted object")
    private String state;
    
    //FIXME - add description
    @SerializedName("storagetype")
    private String storageType;

    //FIXME - add description
    @SerializedName("storage")
    private String storage;
    
    @SerializedName("zoneid") @Param(description="zone ID the object was extracted from")
    private Long zoneId;

    @SerializedName("zonename") @Param(description="zone name the object was extracted from")
    private String zoneName;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUploadPercent() {
        return uploadPercent;
    }

    public void setUploadPercent(int uploadPercent) {
        this.uploadPercent = uploadPercent;
    }

    public String getUploadStatus() {
        return uploadStatus;
    }

    public void setUploadStatus(String uploadStatus) {
        this.uploadStatus = uploadStatus;
    }

    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public String getResultString() {
        return resultString;
    }

    public void setResultString(String resultString) {
        this.resultString = resultString;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getStorageType() {
        return storageType;
    }

    public void setStorageType(String storageType) {
        this.storageType = storageType;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public Long getZoneId() {
        return zoneId;
    }

    public void setZoneId(Long zoneId) {
        this.zoneId = zoneId;
    }

    public String getZoneName() {
        return zoneName;
    }

    public void setZoneName(String zoneName) {
        this.zoneName = zoneName;
    }
}