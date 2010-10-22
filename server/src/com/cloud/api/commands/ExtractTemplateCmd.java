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
package com.cloud.api.commands;

import org.apache.log4j.Logger;

import com.cloud.api.BaseAsyncCmd;
import com.cloud.api.BaseCmd.CommandType;
import com.cloud.api.BaseCmd.Manager;
import com.cloud.api.ApiDBUtils;
import com.cloud.api.Implementation;
import com.cloud.api.Parameter;
import com.cloud.api.response.ExtractResponse;
import com.cloud.event.EventTypes;
import com.cloud.storage.UploadVO;
import com.cloud.storage.VMTemplateVO;
import com.cloud.user.Account;

@Implementation(method="extract", manager=Manager.TemplateManager)
public class ExtractTemplateCmd extends BaseAsyncCmd {
	public static final Logger s_logger = Logger.getLogger(ExtractTemplateCmd.class.getName());

    private static final String s_name = "extracttemplateresponse";

    /////////////////////////////////////////////////////
    //////////////// API parameters /////////////////////
    /////////////////////////////////////////////////////

    @Parameter(name="id", type=CommandType.LONG, required=true, description="the ID of the template")
    private Long id;

    @Parameter(name="url", type=CommandType.STRING, required=false, description="the url to which the ISO would be extracted")
    private String url;
    
    @Parameter(name="zoneid", type=CommandType.LONG, required=true, description="the ID of the zone where the ISO is originally located" )
    private Long zoneId;

    @Parameter(name="mode", type=CommandType.STRING, required=true, description="the mode of extraction - HTTP_DOWNLOAD or FTP_UPLOAD")
    private String mode;
    
    /////////////////////////////////////////////////////
    /////////////////// Accessors ///////////////////////
    /////////////////////////////////////////////////////

    public Long getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    public Long getZoneId() {
        return zoneId;
    }

    public String getMode() {
        return mode;
    }
    
    /////////////////////////////////////////////////////
    /////////////// API Implementation///////////////////
    /////////////////////////////////////////////////////

	@Override
	public String getName() {
		return s_name;
	}
	
    public static String getStaticName() {
        return "ExtractTemplate";
    }

    @Override
    public long getAccountId() {
        VMTemplateVO template = ApiDBUtils.findTemplateById(getId());
        if (template != null) {
            return template.getAccountId();
        }

        // invalid id, parent this command to SYSTEM so ERROR events are tracked
        return Account.ACCOUNT_ID_SYSTEM;
    }

    @Override
    public String getEventType() {
        return EventTypes.EVENT_TEMPLATE_EXTRACT;
    }

    @Override
    public String getEventDescription() {
        return  "Extraction job";
    }

	@Override @SuppressWarnings("unchecked")
	public ExtractResponse getResponse() {
        Long uploadId = (Long)getResponseObject();
        UploadVO uploadInfo = ApiDBUtils.findUploadById(uploadId);
        
        ExtractResponse response = new ExtractResponse();
        response.setResponseName(getName());
        response.setId(id);
        response.setName(ApiDBUtils.findTemplateById(id).getName());        
        response.setZoneId(zoneId);
        response.setZoneName(ApiDBUtils.findZoneById(zoneId).getName());
        response.setMode(mode);
        response.setUploadId(uploadId);
        response.setState(uploadInfo.getUploadState().toString());
        response.setAccountId(getAccountId());        
        //FIX ME - Need to set the url once the gson jar is upgraded since it is throwing an error right now.
        //response.setUrl(uploadInfo.getUploadUrl());         
        return response;
	}
}