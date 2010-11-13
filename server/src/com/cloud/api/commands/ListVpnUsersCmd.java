/**
 *  Copyright (C) 2010 Cloud.com, Inc.  All rights reserved.
 * 
 * This software is licensed under the GNU General Public License v3 or later.
 * 
 * It is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 */

package com.cloud.api.commands;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.cloud.api.ApiDBUtils;
import com.cloud.api.BaseListCmd;
import com.cloud.api.Implementation;
import com.cloud.api.Parameter;
import com.cloud.api.ServerApiException;
import com.cloud.api.response.ListResponse;
import com.cloud.api.response.VpnUsersResponse;
import com.cloud.exception.ConcurrentOperationException;
import com.cloud.exception.InsufficientAddressCapacityException;
import com.cloud.exception.InsufficientCapacityException;
import com.cloud.exception.InvalidParameterValueException;
import com.cloud.exception.PermissionDeniedException;
import com.cloud.network.VpnUserVO;
import com.cloud.user.Account;

@Implementation(description="Lists vpn users")
public class ListVpnUsersCmd extends BaseListCmd {
    public static final Logger s_logger = Logger.getLogger (ListVpnUsersCmd.class.getName());

    private static final String s_name = "listvpnusersresponse";

    /////////////////////////////////////////////////////
    //////////////// API parameters /////////////////////
    /////////////////////////////////////////////////////

    @Parameter(name="account", type=CommandType.STRING, description="the account of the remote access vpn. Must be used with the domainId parameter.")
    private String accountName;

    @Parameter(name="domainid", type=CommandType.LONG, description="the domain ID of the remote access vpn. If used with the account parameter, lists remote access vpns for the account in the specified domain.")
    private Long domainId;

    @Parameter(name="id", type=CommandType.LONG, description="the ID of the vpn user")
    private Long id;

    @Parameter(name="username", type=CommandType.STRING, description="the username of the vpn user.")
    private String userName;
    /////////////////////////////////////////////////////
    /////////////////// Accessors ///////////////////////
    /////////////////////////////////////////////////////

    public String getAccountName() {
        return accountName;
    }

    public Long getDomainId() {
        return domainId;
    }

    public Long getId() {
        return id;
    }

    public String getUsername() {
        return userName;
    }


    /////////////////////////////////////////////////////
    /////////////// API Implementation///////////////////
    /////////////////////////////////////////////////////

    @Override
    public String getName() {
        return s_name;
    }
    
    @Override
    public void execute() throws ServerApiException, InvalidParameterValueException, PermissionDeniedException, InsufficientAddressCapacityException, InsufficientCapacityException, ConcurrentOperationException{
        List<VpnUserVO> vpnUsers = _mgr.searchForVpnUsers(this);

        ListResponse<VpnUsersResponse> response = new ListResponse<VpnUsersResponse>();
        List<VpnUsersResponse> vpnResponses = new ArrayList<VpnUsersResponse>();
        for (VpnUserVO vpnUser : vpnUsers) {
            VpnUsersResponse vpnResponse = new VpnUsersResponse();
            vpnResponse.setId(vpnUser.getId());
            vpnResponse.setUserName(vpnUser.getUsername());
            vpnResponse.setAccountName(vpnUser.getAccountName());
            
            Account accountTemp = ApiDBUtils.findAccountById(vpnUser.getAccountId());
            if (accountTemp != null) {
                vpnResponse.setDomainId(accountTemp.getDomainId());
                vpnResponse.setDomainName(ApiDBUtils.findDomainById(accountTemp.getDomainId()).getName());
            }

            vpnResponse.setObjectName("vpnuser");
            vpnResponses.add(vpnResponse);
        }

        response.setResponses(vpnResponses);
        response.setResponseName(getName());
        this.setResponseObject(response);
    }
}